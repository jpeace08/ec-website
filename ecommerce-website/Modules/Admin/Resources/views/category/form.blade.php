<div class="row ml-5">
    <div class="col-md-6 mx-auto">
        @if (count($errors) >0)
            <div class="alert alert-danger">
                @foreach ($errors->all() as $err)
                    {{ $err }} <br>
                @endforeach
            </div>
        @endif
        @if (session('notification'))
            <div class="alert alert-success">
                {{ session('notification') }}
            </div>
        @endif
        <form action ="{{route('admin.post.create.category')}}" method="POST">
            @csrf
            <div class="form-group">
                <label for="">Tên danh mục</label>
                <input type="text" name = "name" value="{{isset($category) ? $category->name: ''}}" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="Nhập tên danh mục">
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Chọn danh mục cha</label>
                <select class="form-control" name = "parent_id">
                    <option value="0">Chọn danh mục cha</option>
                    
                    @if (isset($categories))
                        @foreach ($categories as $category)
                            <option value="{{$category->id}}">{{$category->name}}</option>
                        @endforeach
                    @endif

                </select>
            </div>
            <div class="form-group">
                <label for="">Icon</label>
                <input type="text" name = "icon" value="{{isset($category) ? $category->icon: ''}}" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="fas-fa-heart">
            </div> 
            <div class="form-check">
                <label class="form-check-label">
                <input type="radio" class="form-check-input" name="active" id="" value="0"
                    @isset($category)
                        @if ($category->active == 0)
                            checked
                        @endif
                    @endisset
                >
                    Ẩn
                </label>
                <br>
                <label class="form-check-label">
                <input type="radio" class="form-check-input" name="active" id="" value="1"
                    @isset($category)
                        @if ($category->active == 1)
                            checked
                        @endif
                    @endisset
                >
                    Hiển thị
                </label>
            </div>
            <hr>
            <button type="submit" id="save" class="btn btn-primary"><i class="fas fa-save"></i>&nbsp; &nbsp;Lưu</button>
        </form>
    </div>
</div>