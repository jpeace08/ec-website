@extends('admin::layouts.master')

@section('title')
    <title>Product | Add New Product</title>
@endsection
@section('css')
    <link rel="stylesheet" href="{{asset('theme-admin/product/css/add/stylesheets.css')}}">
@endsection
@section('js-h')
    <script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/decoupled-document/ckeditor.js"></script>
@endsection
@section('content')
    @if (isset($categories) && isset($trademarks))
        @include('admin::product.form', ['categories' => $categories, 'trademarks' => $trademarks])
    @endif
@endsection
@section('js')
    <script>
        DecoupledEditor
            .create( document.querySelector( '#editor' ) )
            .then( editor => {
                const toolbarContainer = document.querySelector( '#toolbar-container' );

                toolbarContainer.appendChild( editor.ui.view.toolbar.element );
            } )
            .catch( error => {
                console.error( error );
            } );
    </script>
    <script src="{{asset('theme-admin/product/js/add/scripts.js')}}"></script>
@endsection