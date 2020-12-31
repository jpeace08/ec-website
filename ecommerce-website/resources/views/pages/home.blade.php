@extends('layouts.layout')

@section('title')
    <title>Trang chủ</title>
@endsection

@section('css')
    {{-- <link rel="stylesheet" href="home.css"> --}}
@endsection

@section('content')
    
    <div class="container-fluid mt-2">
        <p class="display-4 _s">Sản phẩm mới nhất</p>
        <div class="row">
            
            @if (isset($feature_products))
                @foreach ($feature_products as $product)
                    <div class="col-sm-3 cardbox">
                        @include('partials._card-item', ['product' => $product])
                    </div>
                @endforeach
            @endif
           
        </div>
    </div>

@endsection

@section('scripts')
    <script src="{{asset('theme/js/home.js')}}"></script>
@endsection