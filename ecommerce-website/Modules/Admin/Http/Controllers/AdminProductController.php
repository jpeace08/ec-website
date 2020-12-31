<?php

namespace Modules\Admin\Http\Controllers;

use DateTime;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Redirect;
use Modules\Admin\Entities\Category;
use Modules\Admin\Entities\Product;
use Modules\Admin\Entities\Trademark;
use Illuminate\Support\Str;
use Modules\Admin\Entities\ProductImage;

class AdminProductController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $products = Product::all();
        $categories = Category::all();
        $trademarks = Trademark::all();
        return view('admin::product.index', [
            'categories' => $categories,
            'trademarks' => $trademarks,
            'products' => $products,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        $categories = Category::all();
        $trademarks = Trademark::all();
        return view('admin::product.create', [
            'categories' => $categories,
            'trademarks' => $trademarks,

        ]);
    }

    public function saveProductImages (Request $request){
        
        $id  = $request->productId;
        $product = Product::find($id);
        if($product) {
            //save images:

            for ($i=0; $i < sizeof($_FILES); $i++) { 
                $date = new DateTime();
                $image = $date->getTimestamp().'-'.$_FILES[$i]['name'];
                $imgPath = 'uploads/'.$image;

                $productImg = new ProductImage();
                $productImg->image = $image;
                $productImg->desc = $product->name;
                $productImg->product_id = $id;

                $productImg->save();

                move_uploaded_file($_FILES[$i]['tmp_name'], $imgPath);
            }     
        }

        return json_encode([
            'message' => 'Thêm sản phẩm thành công!',
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $product = new Product();
        $product->name = $request->name;
        $product->desc = $request->desc;
        $product->price = $request->price;
        $product->slug = Str::slug($request->name);
        $product->content = $request->content;
        $product->category_id = $request->category_id;
        $product->trademark_id = $request->trademark_id;
        $product->active = $request->status;
        $product->thumb = 'no-image.svg';

        //save thumb:
        if($_FILES['thumb']){
            $date = new DateTime();
            $thumb = $date->getTimestamp().'-'.$_FILES['thumb']['name'];
            $thumb_path = 'uploads/'.$thumb;
            move_uploaded_file($_FILES['thumb']['tmp_name'], $thumb_path);
            $product->thumb = $thumb;
        }

        $product->save();

        return json_encode([
            'id' => $product->id,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $categories = Category::all();
        $trademarks = Trademark::all();
        $product = Product::find($id);
        // if($product == null) return;
        $product_images = ProductImage::where([
            'product_id' => $id,
        ])->get();
        return view('admin::product.update', [
            'product' => $product,
            'product_images' => $product_images,
            'categories' => $categories,
            'trademarks' => $trademarks,
        ]);
    }

    public function update (Request $request, $id) {

        $product = Product::find($id);
        // if($product) return ;

        $product->name = $request->name;
        $product->desc = $request->desc;
        $product->price = $request->price;
        $product->slug = Str::slug($request->name);
        $product->content = $request->content;
        $product->category_id = $request->category;
        $product->trademark_id = $request->trademark;
        $product->active = $request->active;

        if($request->hasFile('thumb')){
            $thumb = $request->thumb;
            $product->thumb = $thumb->getClientOriginalName();
            $thumb->move('uploads', $thumb->getClientOriginalName());
        }

        $product->save();

        if($request->hasFile('relative_images')){
            $relativeImgs = $request->relative_images;
            for ($i=0; $i < sizeof($relativeImgs); $i++) { 
                $img = new ProductImage();
                $date = new DateTime();
                $timeStamp = $date->getTimestamp();

                $image = $relativeImgs[$i];
                $img->image = $timeStamp.'-'.$image->getClientOriginalName();
                $img->product_id = $id;
                $img->desc = 'Tada';
                $img->save();

                $image->move('uploads', $timeStamp.'-'.$image->getClientOriginalName());
            }
        }

        return redirect()->route('admin.get.edit.product', ['id' => $id])
        ->with('message', 'Cập nhật thành công!');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function remove($id)
    {
        $product= Product::find($id);
        if($product){
            $thumbPath = public_path('uploads\\'.$product->thumb);
            $product->delete();

            $relativeImages = ProductImage::where([
                'product_id' => $id,
            ])->get();

            foreach ($relativeImages as $image) {
                $path = public_path('uploads\\'. $image->image);
                $image->delete();
                if(is_file($path)){
                    unlink($path);
                }
            }

            if(is_file($thumbPath)) unlink($thumbPath);

            return redirect()->route('admin.get.list.product')
            ->with('message', 'Xóa thành công thành công!');
        }
    }

    public function removeImage(Request $request) {
        $imgId = $request->imgId;

        $image = ProductImage::find($imgId);
        if($image) {
            $imgPath = public_path('uploads\\'.$image->image);
            $image->delete();
            if(is_file($imgPath)){
                unlink($imgPath);
            }
        }

        return json_encode([
            'message' => 'Success!',
        ]);
    }
}
