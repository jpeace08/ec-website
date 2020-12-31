@extends('admin::layouts.master')

@section('title')
    <title>Category | List Category</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/category/css/show/stylesheets.css')}}">
@endsection

@section('content')
    
    <div class="row">
        <div class="col-md-12">
            <a href="{{ route('admin.get.create.category') }}" class="btn btn-success float-right m-2"><i class="fas fa-plus-circle"></i>&nbsp;&nbsp;Add</a>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên danh mục</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                @isset($categories)
                        @foreach ($categories as $index => $item)
                            <tr data-category-id={{$item->id}}>
                                <th scope="row">{{$item->index + 1}}</th>
                                <td>{{ $item->name }}</td>
                                <td>{{ $item->created_at }}
                                </td>
                                <td>
                                    <span 
                                        class="badge"
                                        data-category-active={{$item->active}} 
                                        data-category-id={{$item->id}} 
                                    >
                                    </span>
                                </td>
                                <td>
                                    <a class="btn btn-outline-primary" name="edit" 
                                    data-category-active={{$item->active}} 
                                    data-category-id={{$item->id}} 
                                    data-category-name="{{$item->name}}"
                                    data-category-icon="{{$item->icon}}"
                                    data-category-parent-id={{$item->parent_id}}
                                    >
                                    Sửa
                                    </a>&nbsp;

                                    <a class="btn btn-outline-secondary" name="remove" 
                                    data-category-id={{$item->id}}
                                    >
                                    Xóa
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                @endisset
                </tbody>
            </table>
            <div class="col-md-12">
                {{ $categories->links() }}
            </div>
        </div>
    </div>

    <div class="row form-container hide">
        <div class="col-md-9 mx-auto">
            <div >
                <div class="form-group">
                    <label for="">Tên danh mục</label>
                    <input type="text" name = "name" value="" class="form-control" placeholder="Nhập tên danh mục">
                </div>
                <div class="form-group">
                    <label >Chọn danh mục cha</label>
                    <select class="form-control" name = "parent_id">
                        <option value={{0}}>Chọn danh mục cha</option>
                        
                        @if (isset($categories))
                            @foreach ($categories as $category)
                                <option class="_f" value="{{$category->id}}" >{{$category->name}}</option>
                            @endforeach
                        @endif

                    </select>
                </div>
                <div class="form-group">
                    <label for="">Icon</label>
                    <input type="text" name = "icon" value="" class="form-control" placeholder="fa-heart">
                </div> 
                <div class="form-check">
                    <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="active" id="" value="0"
                    >
                        Ẩn
                    </label>
                    <br>
                    <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="active" id="" value="1"
                    >
                        Hiển thị
                    </label>
                </div>
                <hr>
                <div class="btn-group">
                    <span id="save" class="btn btn-success "><i class="fas fa-save"></i>&nbsp; &nbsp;Lưu</span>
                    <span id="cancel" class="btn btn-secondary "><i class="fas fa-exit"></i>&nbsp; &nbsp;Cancel</span>
                </div>
            </div>
        </div>                   
    </div>

@endsection

@section('js')
    <script src="{{asset('theme-admin/category/js/show/scripts.js')}}"></script>
@endsection