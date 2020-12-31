@extends('admin::layouts.master')
@section('title')
    <title>Sản phẩm của bạn</title>
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/product/css/show/stylesheets.css')}}">
@endsection
@section('content')
    
    <a href="{{route('admin.get.create.product')}}" class="btn btn-outline-primary"><i class="fas fa-plus-circle"></i>&nbsp;Thêm sản phẩm</a>

            <table class="table mt-5">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Tên sản phẩm </th>
                    <th scope="col">Giá </th>
                    <th scope="col">Danh mục</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @if (isset($products))
                        @foreach ($products as $index => $product)

                        <tr>
                        <th scope="row">{{$index + 1}}</th>
                        <td>
                            <img class="img-pro" src="{{asset('uploads/'.$product->thumb)}}" alt="image">
                        </td>
                        <td style="max-width: 300px;">{{ $product->name }}</td>
                        <td>{{ number_format($product->price , 0,'',',')}} đ</td>
                        <td>{{optional($product->category)->name}}</td>
                        <td>{{ $product->created_at }}</td>
                        <td>
                            <a class="btn btn-outline-primary"
                                 href="{{route('admin.get.edit.product', ['id' => $product->id])}}" 
                                 name="edit">
                                <i class="far fa-edit"></i>
                            </a>&nbsp;

                            <a class="btn btn-outline-secondary" href="{{route('admin.get.remove.product', ['id' => $product->id])}}" name="remove"                             >
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>

                        @endforeach
                    @endif

                </tbody>
            </table>

@endsection
@section('js')
    <script src="{{asset('theme-admin/product/js/show/scripts.js')}}"></script>
@endsection