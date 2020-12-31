<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\Admin\Entities\Category;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
class AdminCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $categories = Category::paginate(6);
        
        return view('admin::category.index', [
            'categories' => $categories,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        $categories = Category::all();
        return view('admin::category.create',[
            'categories' => $categories,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        // $this->validate($request ,[
        //     'name' => 'required|unique:products,name',
        //     'icon' => 'required',
        // ],[
        //     'name.required' => 'Danh mục sản phẩm không được để trống',
        //     'name.unique' => 'Danh mục sản phẩm đã tồn tại',
        //     'icon.required' => 'Icon danh mục không được để trống',
        // ]);
        try {
            DB::beginTransaction();
            $category = new Category();
            $category->name = $request->name;
            $category->slug =  Str::slug($request->name);
            $category->parent_id = $request->parent_id;
            $category->active = $request->active;
            $category->icon = $request->icon;
            $category->save();
            DB::commit();

            // dd($request);
            return redirect()->route('admin.get.create.category', ['notification' => 'Thêm mới thành công']);
        } catch (\Exception $ex) {
            DB::rollback();
            throw $ex;
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('admin::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $category = Category::find($id);
        $categories = Category::all();
        return view('admin::category.update', [
            'category' => $category,
            'categories' => $categories,
        ]);
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request)
    {
        $id = $request->id;
        if($id) {
            $updateData = $request->updateData;
            $category = Category::find($id);
            if($category) {
                $category->update($updateData);
                return json_encode([
                    "category" => $category,
                ]);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function remove($id)
    {
        if($id != null) {
            $category = Category::find($id);
            if($category) $category->delete();
        }
        return json_encode($id);
    }

    public function setActive(Request $request) {
        $id = $request->id;
        $category = Category::find($id);
        if($category) {
            $category->active = !$category->active;
            $category->save();
            return json_encode([
                'category' => $category,
            ]);
        }
    }
}
