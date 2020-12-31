
<header>
    <div class="container-fluid">
    
        <div class="row">
            <div class="col-sm-12">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="#">
                        <img src="{{asset('theme/images/logo.png')}}" alt="Amazing!" class="nav__logo" srcset="">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="{{route('fr.get.home')}}">Trang chủ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Danh mục
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    
                                    @foreach ($categories as $category)
                                        <a class="dropdown-item" href="{{route('fr.get.list.product', ['slug'=> $category->slug])}}">{{$category->name}}</a>  
                                    @endforeach

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{{route('fr.get.list.product', ['slug' => 'all'])}}">Tất cả</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Thương hiệu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    
                                    @foreach ($trademarks as $trademark)
                                        <a class="dropdown-item" href="#">{{$trademark->name}}</a>  
                                    @endforeach

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Tất cả</a>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ml-1">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            </li>
                            <li class="nav-item ml-1">
                                <a href="{{route('fr.get.list.cart')}}" class="my-2 my-sm-0"><button class="btn btn-outline-success">Giỏ hàng</button></a>
                            </li>
                             <li class="nav-item ml-1">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    
        <div class="row header slider">
            <div class="col-sm-9">
                <div id="carouselId" class="carousel slide _slider" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselId" data-slide-to="1"></li>
                        <li data-target="#carouselId" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img src="{{asset('theme/images/home.jpg')}}" class="slider__image" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                                <p>Description</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="{{asset('theme/images/home.jpg')}}" class="slider__image" alt="Second slide">
                            <div class="carousel-caption d-none d-md-block">
                                <p>Description</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="{{asset('theme/images/home.jpg')}}" class="slider__image" alt="Third slide">
                            <div class="carousel-caption d-none d-md-block">
                                <p>Description</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselId" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselId" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <img class="card-img-top" data-src="holder.js/100x180/?text=Image cap" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">Title</h4>
                        <p class="card-text">Text</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Item 1</li>
                        <li class="list-group-item">Item 2</li>
                        <li class="list-group-item">Item 3</li>
                    </ul>
                </div>
            </div>
        </div>
    
    </div>
</header>