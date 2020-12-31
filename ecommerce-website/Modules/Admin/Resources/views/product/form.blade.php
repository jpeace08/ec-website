<div class="row">
    <div class="col-sm-8 mx-auto form-container">
        
        <div class="form-group">
            <label for="name">Tên sản phẩm</label>
            <input type="text" name="name" id="name" class="form-control" 
                placeholder="Tên sản phẩm..." 
                aria-describedby="name"
                value="{{isset($product) ? $product->name:''}}">
            <small id="name" class="text-muted"></small>
        </div>

        <div class="form-group">
            <label for="desc">Mô tả sản phẩm</label>
            <input type="text" name="desc" id="desc" class="form-control" 
                placeholder="Mô tả sản phẩm..." 
                aria-describedby="desc"
                value="{{isset($product) ? $product->desc:''}}">
            <small id="desc" class="text-muted"></small>
        </div>

        <div class="form-group">
            <label for="price">Giá sản phẩm</label>
            <input type="number" name="price" id="price" class="form-control" 
                placeholder="Giá sản phẩm" 
                aria-describedby="price"
                value="{{isset($product) ? $product->price:0}}">
            <small id="price" class="text-muted"></small>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="thumnb">Hình ảnh sản phẩm</label>
                    <input type="file" class="form-control-file" name="thumb" id="thumnb" placeholder="Hình ảnh sản phẩm" aria-describedby="thumb">
                    <small id="thumb" class="form-text text-muted"></small>
                </div>
            </div>
            @if (isset($product))
                <div class="col-sm-6 img-container">
                    <img src="{{asset('uploads/'.$product->thumb)}}" alt="" srcset="" class="thumb-product">
                </div>
            @endif
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="relative_images">Hình ảnh khác</label>
                    <input multiple type="file" class="form-control-file" name="relative_images[]" id="relative_images" placeholder="Hình ảnh liên quan..." aria-describedby="fileHelpId">
                    <small id="fileHelpId" class="form-text text-muted"></small>
                </div>
            </div>
            @if (isset($product))
                <div class="col-sm-6 o-images img-container" >

                    @foreach ($product_images as $product_image)
                        <span class="_1-img">
                            <img class="r-img" src="{{asset('uploads/'.$product_image->image)}}" alt="First slide">
                            <i class="fas fa-minus-circle" 
                                data-proid={{$product->id}}
                                data-imgid={{$product_image->id}}>
                            </i>
                        </span>
                    @endforeach

                </div>
            @endif
        </div>


        <label for="">Nội dung sản phẩm</label>
        <div id="toolbar-container"></div>

        <!-- This container will become the editable. -->
        <div id="editor">@isset($product) {!!$product->content!!} @endisset</div>

        <label for="">Trạng thái hoạt động</label>
        <div class="form-check form-check-inline">
            <label class="form-check-label">
                <input @isset($product) @if ($product->active == 1) checked @endif @endisset class="form-check-input" type="radio" name="active" value="1"> Hiện
            </label>
            <label class="form-check-label">
                <input @isset($product) @if ($product->active == 0) checked @endif @endisset class="form-check-input" type="radio" name="active" value="0"> Ẩn
            </label>
        </div>

        <div class="d-flex justify-content-center">
            <div class="form-group mr-2 w-100">
                <label for="category">Danh mục sản phẩm</label>
                <select class="form-control" name="category" id="category">
                    <option>--Chọn danh mục sản phẩm--</option>
                   @foreach ($categories as $category)
                       <option @isset($product) @if ($product->category_id == $category->id) selected @endif @endisset value="{{$category->id}}">{{$category->name}}</option>
                   @endforeach
                </select>
            </div>

            <div class="form-group ml-2 w-100">
                <label for="trademark">Thương hiệu</label>
                <select class="form-control" name="trademark" id="trademark">
                    <option>--Chọn thương hiệu sản phẩm--</option>
                    @foreach ($trademarks as $trademark)
                        <option @isset($product) @if ($product->trademark_id == $trademark->id) selected @endif @endisset value="{{$trademark->id}}">{{$trademark->name}}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="btn-group w-100">
            <div id="save" class="btn btn-success w-100"><i class="fas fa-save"></i>&nbsp;&nbsp;Save</div>
            <a id="cancel" href="{{route('admin.get.list.product')}}" class="btn btn-secondary w-100">Cancle</a>
        </div>

    </div>
</div>