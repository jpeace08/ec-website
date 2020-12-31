<?php

namespace Modules\Admin\Http\Controllers;

use DateTime;
use Error;
use Exception;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\File;
use Modules\Admin\Entities\Trademark;
use Illuminate\Support\Str;

class AdminTrademarkController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $trademarks = Trademark::paginate(6);
        return view('admin::trademark.index', compact('trademarks'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('admin::trademark.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $trademark = new Trademark();
        $trademark->name = $request->name;
        $trademark->slug = Str::slug($trademark->name);
        $trademark->active = $request->active;
        $trademark->logo = 'no-image.svg';

        if(isset($_FILES['logo'])){
            if(0 < $_FILES['logo']['error']){
                return redirect()
                    ->route('admin.get.create.trademark')
                    ->with('error', [
                        "message" => $_FILES['logo']['error'],
                    ]);
            }
            if (2097152 < $_FILES['logo']['size']) {
                return redirect()
                    ->route('admin.get.create.trademark')
                    ->with('error', [
                        "message" => 'Kích thước file phải nhỏ hơn hoặc bằng 2Mb',
                    ]);
            }
            else {
                $date = new DateTime();
                $fileName = $date->getTimestamp().'-'.$_FILES['logo']['name'];
                $logoPath = 'uploads/'.$fileName;
                if(move_uploaded_file($_FILES['logo']['tmp_name'], $logoPath)){
                    $trademark->logo=$fileName;
                    $trademark->save();
                }
            }
            return redirect()
                ->route('admin.get.create.trademark')
                ->with('success', [
                    "message" => 'Thêm thương hiệu thành công!',
                ]);
        }

        // dd($_FILES['logo']);

    }

    public function setActive (Request $request) {
        if(isset($request->trademarkId)){
            $trademark = Trademark::find($request->trademarkId);
            if($trademark) {
                $trademark->active = $trademark->active == 0 ? 1:0;
                $trademark->save();
                return json_encode([
                    $trademark,
                ]);
            }
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
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request)
    {
        if(isset($request->id)){
            $trademark = Trademark::find($request->id);
            if($trademark) {
                $trademark->name = $request->name;
                $trademark->slug = Str::slug($request->name);
                $trademark->active = $request->active;
                $oldLogo = '';
                if(isset($request->oldLogo)){
                    $oldLogo = public_path('uploads\\'.$request->oldLogo);
                }

                if (isset($_FILES['logo'])) {
                    if (0 < $_FILES['logo']['error']) {
                        throw new Error('Error upload', 404);
                    }
                    if (2097152 < $_FILES['logo']['size']) {
                        throw new Exception("Dung lượng file nên nhỏ hơn 2 M", 1);

                    } else {
                        $date = new DateTime();
                        $fileName = $date->getTimestamp() . '-' . $_FILES['logo']['name'];
                        $logoPath = 'uploads/' . $fileName;
                        if (move_uploaded_file($_FILES['logo']['tmp_name'], $logoPath)) {
                            $trademark->logo = $fileName;
                            if(is_file($oldLogo)) unlink($oldLogo);
                        }
                    }
                }
                $trademark->save();
                return json_encode($trademark);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function remove($id)
    {
        $trademark = Trademark::find($id);
        if($trademark) {
            $logo = public_path('uploads\\'. $trademark->logo);
            $trademark->delete();
            if(is_file($logo)) unlink($logo);
            return json_encode($id);
        }
    }
}
