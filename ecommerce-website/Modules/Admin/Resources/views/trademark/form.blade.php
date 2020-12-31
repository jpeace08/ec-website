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
        <form action ="{{route('admin.post.create.trademark')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="">Tên thương hiệu</label>
                <input type="text" name = "name" value="{{isset($trademark) ? $trademark->name: ''}}" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="Nhập tên thương hiệu">
            </div>

            <div class="form-group">
                <label for="">Logo</label>
                <input type="file" name = "logo" value="{{isset($trademark) ? $trademark->logo: ''}}" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="fas-fa-heart">
            </div> 
            <div class="form-check">
                <label class="form-check-label">
                <input type="radio" class="form-check-input" name="active" id="" value="0"
                    @isset($trademark)
                        @if ($trademark->active == 0)
                            checked
                        @endif
                    @endisset
                >
                    Ẩn
                </label>
                <br>
                <label class="form-check-label">
                <input type="radio" class="form-check-input" name="active" id="" value="1"
                    @isset($trademark)
                        @if ($trademark->active == 1)
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