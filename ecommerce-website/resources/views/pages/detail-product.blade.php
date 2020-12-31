@extends('layouts.layout')

@section('title')
    <title>{{$title}}</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('theme/css/list-products.css')}}">
@endsection

@section('content')
    
    @if (isset($product))
    <div class="container header">
        <section>
            <div class="row">
                <ul>
                    <li><a href="">{{$product->category->name}}</a></li>
                    <li>/<li>
                    <li><a href="">{{$product->name}}</a></li>
                </ul>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <span class="product-name display-4">{{$product->name}}</span>
                    <span class="fas fa-star"></span>
                    <span class="fas fa-star"></span>
                    <span class="fas fa-star"></span>
                    <span class="fas fa-star"></span>
                    <span class="fas fa-star"></span>
                    <span class="votes"><a href="">192 đánh giá</a></span>
                </div>
            </div>

        </section>
        <hr>
        <section>
            <div class="row">
                <div class="col-sm-4">
                    <div class="product__thumb">
                        <img src="{{asset('uploads/'.$product->thumb)}}" alt="{{$product->name}}" class="">
                    </div>
                    <div class="product__imgages mx-5 mt-3">
                        <div class="owl-carousel home-owl">
                            @if (isset($otherImgs))
                                @foreach ($otherImgs as $img)
                                    <img src="{{asset('uploads/'.$img->image)}}" alt="{{$img->desc}}" data-hash="">
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="product__price display-4">{{$product->price}} ₫</div>
                    <div class="product__action mt-3 w-100">
                        <div class="btn btn-warning btn-block" data-product-id={{$product->id}} id="__add-product">Mua ngay</div>
                        <div class="btn-group mt-2 w-100">
                            <button class="btn btn-primary _fs w-100">Mua trar góp 0%</button>
                            <button class="btn btn-primary _fs w-100">Mua trả góp qua thẻ</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr>

        <section>
            <div class="row">
                <div class="col-sm-9">
                    <div class="product__desc display-4">
                        {{$product->desc}}
                    </div>
                    <div class="product__content mt-3">
                        {!!$product->content!!}
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="display-4 mb-3" style="font-size: 1.5rem; font-weight: 400;">Người dùn thường mua</div>
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="../assets/images/home.jpg" alt="Card image cap">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                                <div class="col-sm-6">
                                    <p>9400000</p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="#" class="card__action btn btn-primary">Add</a>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#" class="card__action btn btn-primary">Like</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
    @endif
    

@endsection

@section('scripts')
    <script src="{{asset('theme/js/detail.js')}}"></script>
    <script src="{{asset('theme/js/home.js')}}"></script>
    
@endsection