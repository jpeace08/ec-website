@if (isset($product))
<div class="card" style="width: 18rem;">
    <a href="{{route('fr.get.detail.product', ['slug' => $product->slug, 'id' => $product->id])}}"><img class="card-img-top card__img mx-auto" src="{{asset('uploads/'.$product->thumb)}}" alt="Card image cap"></a>
    <div class="card-body">
        <div class="row">
            <div class="col-sm-9">
                <h5 class="card-title _short"><a href="{{route('fr.get.detail.product', ['slug' => $product->slug, 'id' => $product->id])}}">{{$product->name}}</a></h5>
            </div>
            <div class="col-sm-3">
                <p class="float-right">{{$product->price}}₫</p>
            </div>
        </div>
        <p class="card-text _short">{{$product->desc}}</p>
        <div class="row">
            <div class="col-sm-6">
                <a href="#" class="card__action __action-add btn btn-primary" data-product-id = {{$product->id}}>Add</a>
            </div>
            <div class="col-sm-6">
                <a href="#" class="card__action __action-like btn btn-primary">Like</a>
            </div>
        </div>
    </div>
</div>
@endif