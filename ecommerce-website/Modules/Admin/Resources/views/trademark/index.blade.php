@extends('admin::layouts.master')

@section('title')
    <title>Trademark | List Trademark</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/trademark/css/show/stylesheets.css')}}">
@endsection

@section('content')
    <div class="row">
        <div class="col-md-12">
            <a href="{{ route('admin.get.create.trademark') }}" class="btn btn-success float-right m-2"><i class="fas fa-plus-circle"></i>&nbsp;&nbsp;Add</a>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th>Logo</th>
                    <th scope="col">Tên thương hiệu</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                @isset($trademarks)
                        @foreach ($trademarks as $index => $item)
                            <tr data-trademark-id={{$item->id}}>
                                <th scope="row">{{$item->index + 1}}</th>
                                <td>
                                    <img src="{{asset('uploads/'.$item->logo)}}" alt="Logo">
                                </td>
                                <td>{{ $item->name }}</td>
                                </td>
                                <td>
                                    <span 
                                        class="badge"
                                        data-trademark-active={{$item->active}} 
                                        data-trademark-id={{$item->id}} 
                                    >
                                    </span>
                                </td>
                                <td>
                                    <a class="btn btn-outline-primary" name="edit" 
                                    data-trademark-active={{$item->active}} 
                                    data-trademark-id={{$item->id}} 
                                    data-trademark-name="{{$item->name}}"
                                    data-trademark-logo="{{$item->logo}}"
                                    >
                                    Sửa
                                    </a>&nbsp;

                                    <a class="btn btn-outline-secondary" name="remove" 
                                    data-trademark-id={{$item->id}}
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
                 @isset($trademarks)
                    {{$trademarks->links()}}
                @endisset
            </div>
        </div>
    </div>

    {{-- Form edit  --}}

    <form class="row form-container hide" enctype="multipart/form-data">
        <div class="col-md-9 mx-auto">
            <div >
                <div class="form-group">
                    <label for="">Tên thương hiệu</label>
                    <input type="text" name = "name" value="" class="form-control" placeholder="Nhập tên thương hiệu...">
                </div>
                <div class="form-group">
                    <div class="trademark-logo">
                        <div class="col-sm-5">
                            <label for="">Logo</label>
                            <input type="file" name = "logo" value="" class="form-control" placeholder="fa-heart">
                        </div>
                        <div class="col-sm-6">
                            <label for="">Current Logo</label>
                            <img src="" alt="" name="old-logo">
                        </div>
                    </div>
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
    </form>

@endsection

@section('js')
    <script src="{{asset('theme-admin/trademark/js/show/scripts.js')}}"></script>
@endsection