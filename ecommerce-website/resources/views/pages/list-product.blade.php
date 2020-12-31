@extends('layouts.layout')

@section('title')
    <title>{{$title}}</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('theme/css/list-products.css')}}">
@endsection

@section('content')
    
   <div class="container-fluid header">
        <p class="display-4 _s">
            <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{$title}}</li>
            </ol>
            </nav>
        </p>
        <div class="row">
           <div class="col-sm-10">
               <div class="row">
                   @if (isset($products))
                        @foreach ($products as $product)
                            <div class="col-sm-3 cardbox">
                                @include('partials._card-item', ['product' => $product])
                            </div>
                        @endforeach
                    @endif
               </div>
           </div>
           <div class="cols-sm-2">
               <ul class="list-group">
                    <li class="list-group-item">Cras justo odio</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Morbi leo risus</li>
                    <li class="list-group-item">Porta ac consectetur ac</li>
                    <li class="list-group-item">Vestibulum at eros</li>
                </ul>
           </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src="{{asset('theme/js/home.js')}}"></script>
    <script src="{{asset('theme/js/list.js')}}"></script>
@endsection