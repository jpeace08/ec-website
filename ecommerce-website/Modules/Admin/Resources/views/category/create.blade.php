@extends('admin::layouts.master')

@section('title')
    <title>Product | Add New Product</title>
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/category/css/add/stylesheets.css')}}">
@endsection
@section('title-header')
    <h1>Thêm mới danh mục sản phẩm</h1>
@endsection
@section('content')
    

    @include('admin::category.form')

@endsection
@section('js')
    <script src="{{asset('theme-admin/category/js/add/scripts.js')}}"></script>
@endsection