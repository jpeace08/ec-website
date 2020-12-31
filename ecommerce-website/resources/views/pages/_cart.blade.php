@extends('layouts.layout')

@section('title')
    <title>{{$title}}</title>
@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('theme/css/cart.css')}}">
@endsection

@section('content')
    
   @if (isset($products))
        @if (count($products) > 0)
            <div class="container header">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="cartbox">
                            <ul class="products">
                                @foreach ($products as $product)
                                    <li data-product-id={{$product->id}} class="product-item">
                                        <div class="row">
                                            <div class="col-sm-2 pr__image">
                                                <img src="{{asset('uploads/'.$product->thumb)}}" alt="{{$product->name}}">
                                            </div>
                                            <div class="col-sm-6 pr__meta">
                                                <span class="__meta-name">{{$product->name}}</span>
                                                <span class="__meta-price">{{$product->price}}</span>
                                            </div>
                                            <div class="col-sm-4 pr__action">
                                                <div class="__action-quantity">
                                                    <span data-product-id="{{$product->id}}" class="fas fa-plus"></span>
                                                    <span data-product-id="{{$product->id}}" class="quantity">{{$product_quantity[$product->id]}}</span>
                                                    <span data-product-id="{{$product->id}}" class="fas fa-minus"></span>
                                                </div>
                                                <i data-product-id={{$product->id}} class="rmItem fas fa-minus-circle"></i>
                                            </div>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                            <ul class="cart-meta ">
                                <li class="">Tổng số lượng : <span id="total-count">{{$total_count}}</span></li>
                                <li class="">Tổng tiền: <span id="total-money">{{$total_money}}</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 cartbox">
                        <div class="form-group">
                          <label for="">Họ và tên</label>
                          <input type="text" name="name" id="" class="form-control" placeholder="" aria-describedby="helpId">
                          <small id="helpId" class="text-muted"></small>
                        </div>
                        <div class="form-group">
                          <label for="">Số điện thoại</label>
                          <input type="text" name="phone" id="" class="form-control" placeholder="" aria-describedby="helpId">
                          <small id="helpId" class="text-muted"></small>
                        </div>
                        <div class="form-group">
                          <label for="">Địa chỉ</label>
                          <input type="text" name="address" id="" class="form-control" placeholder="" aria-describedby="helpId">
                          <small id="helpId" class="text-muted"></small>
                        </div>  

                        <div class="form-group">
                            <button id="checkout" class="btn btn-outline-success btn-block">Đặt hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        @else
            <span class="display-4 _404">
                <div class="display-4 _404">Không có sản phẩm nào trong giỏ hàng Vui lòng quay lại <a href="{{route('fr.get.home')}}">trang chủ</a></div>
            </span>
        @endif
   @endif

@endsection

@section('scripts')
    <script src="{{asset('theme/js/home.js')}}"></script>
    <script src="{{asset('theme/js/list.js')}}"></script>
    <script src="{{asset('theme/js/cart.js')}}"></script>
@endsection