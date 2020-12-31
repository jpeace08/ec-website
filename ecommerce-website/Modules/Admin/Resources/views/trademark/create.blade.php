@extends('admin::layouts.master')

@section('title')
    <title>Trademark | Add New Trademark</title>
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/trademark/css/add/stylesheets.css')}}">
@endsection
@section('title-header')
    <h1>Thêm mới thương hiệu</h1>
@endsection
@section('content')
    

    @include('admin::trademark.form')

@endsection
@section('js')
    <script src="{{asset('theme-admin/trademark/js/add/scripts.js')}}"></script>
@endsection