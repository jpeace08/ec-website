<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Admin\Entities\Category;
use Modules\Admin\Entities\Order;
use Modules\Admin\Entities\Product;
use Modules\Admin\Entities\ProductImage;

class PageController extends Controller
{
    public function index() {
        $feature_products = Product::orderBy('id', 'desc')->limit(12)->get();
        return view('pages.home', [
            'feature_products' => $feature_products,
        ]);
    }

    public function getProductsByCategory ($slug) {
        $products = null;
        $title = null;
        if(trim($slug) != null) {
            if(trim($slug) == '' || trim($slug) == 'all'){
                $products = Product::orderBy('id', 'desc')->get();
                $title = 'All products';
            }
            else {
                $category = Category::where([
                    'slug' => $slug,
                ])->get()[0];

                if($category) {
                    $title = $category->name;
                    $products = Product::where([
                        'category_id' => $category->id,
                    ])->orderBy('id', 'desc')->paginate(20);
                }
            }

            return view('pages.list-product', [
                'title' => $title,
                'products' => $products,
            ]);
        }
    }

    public function getDetailProduct($slug, $id) {
        $product = Product::find($id);
        if($product != null) {

            $relative_images = ProductImage::where([
                'product_id' => $product->id,
            ])->get();

            return view('pages.detail-product', [
                'product' => $product,
                'otherImgs' => $relative_images,
                'title' => $product->name,
            ]);
        }
    }

    public function addProductToCart (Request $request) {

        $id = $request->id;
        $newProduct = Product::find($id);

        $products = $request->session()->get('products', []);
        $products[$id] = $newProduct;
        $request->session()->put('products', $products);

        $product_quantity = $request->session()->get('product-quantity', []);
        if(isset($product_quantity[$id])) {
            $product_quantity[$id] ++;
        }
        else {
            $product_quantity[$id] = 1;
        }
        $request->session()->put('product-quantity', $product_quantity);

        $total_money = $request->session()->get('total-money', 0);
        $total_money += $newProduct->price;
        $request->session()->put('total-money', $total_money);

        $total_count = $request->session()->get('total-count', 0);
        $total_count ++;
        $request->session()->put('total-count', $total_count);

        return json_encode([
            'products' => $request->session()->get('products'),
            'product_quantity' => $request->session()->get('product-quantity'),
            'total_money' => $request->session()->get('total-money'),
            'total_count' => $request->session()->get('total-count'),
        ]);
    }

    public function showCart (Request $request) {

        // $request->session()->put('products', []);
        // $request->session()->put('product-quantity', []);
        // $request->session()->put('total-money', 0);
        // $request->session()->put('total-count', 0);

        return view('pages._cart', [
            'products' => $request->session()->get('products', []),
            'product_quantity' => $request->session()->get('product-quantity', []),
            'total_money' => $request->session()->get('total-money', 0),
            'total_count' => $request->session()->get('total-count', 0),
            'title' => 'Giỏ hàng của bạn'
        ]);
    }

    public function removeItemCart (Request $request, $id) {

        $pr_quantity = 0;

        $pr = Product::find($id);

        $products = $request->session()->get('products', []);
        unset($products[$id]);
        $request->session()->put('products', $products);

        $product_quantity = $request->session()->get('product-quantity', []);
        $pr_quantity = $product_quantity[$id];
        unset($product_quantity[$id]);
        $request->session()->put('product-quantity', $product_quantity);

        $total_money = $request->session()->get('total-money', 0);
        $total_money -= $pr->price * $pr_quantity;
        $request->session()->put('total-money', $total_money);

        $total_count = $request->session()->get('total-count', 0);
        $total_count -= $pr_quantity;
        $request->session()->put('total-count', $total_count);

        return json_encode([
            'products' => $request->session()->get('products', []),
            'product_quantity' => $request->session()->get('product-quantity', 0),
            'total_money' => $request->session()->get('total-money', 0),
            'total_count' => $request->session()->get('total-count', 0),
        ]);
    }

    public function changeQuantity (Request $request) {

        $is_plus = $request->isPlus;
        $id = $request->id;

        $product = Product::find($id);
        $product_quantity = $request->session()->get('product-quantity', []);
        $total_money = $request->session()->get('total-money', 0);
        $total_count = $request->session()->get('total-count', 0);

        if($is_plus == 1) {
            //plus:
            $product_quantity[$id] ++;
            $total_money += $product->price;
            $total_count++;
        }
        if($is_plus == 0) {
            //minus:
            $product_quantity[$id] = $product_quantity[$id] - 1;
            $total_money -= $product->price;
            $total_count = $total_count - 1;

        }

        $request->session()->put('product-quantity', $product_quantity);
        $request->session()->put('total-money', $total_money);
        $request->session()->put('total-count', $total_count);


        return json_encode([
            'isPlus' => $is_plus,
            'products' => $request->session()->get('products', []),
            'product_quantity' => $request->session()->get('product-quantity', 0),
            'total_money' => $request->session()->get('total-money', 0),
            'total_count' => $request->session()->get('total-count', 0),
        ]);
    }

    public function save(Request $request) {

        $order = new Order();
        $order->customer_name = $request->name;
        $order->customer_address = $request->address;
        $order->customer_phone = $request->phone;
        $order->quantity = $request->quantity;
        $order->total_money = $request->totalMoney;

        $order->save();

        $request->session()->put('products', []);
        $request->session()->put('product-quantity', []);
        $request->session()->put('total-money', 0);
        $request->session()->put('total-count', 0);

        return json_encode([
            'message' => 'Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi!',
        ]);
    }
}
