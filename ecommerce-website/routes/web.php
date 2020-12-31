<?php

use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PageController::class, 'index'])->name('fr.get.home');

Route::get('/products/{slug}', [PageController::class, 'getProductsByCategory'])->name('fr.get.list.product');
Route::get('/product-detail/{slug}.{id}', [PageController::class, 'getDetailProduct'])->name('fr.get.detail.product');

Route::post('/cart/add', [PageController::class, 'addProductToCart']);

Route::get('/cart/show', [PageController::class, 'showCart'])->name('fr.get.list.cart');

Route::get('/cart/remove/{id}', [PageController::class, 'removeItemCart']);

Route::post('/cart/change-quantity', [PageController::class, 'changeQuantity']);

Route::post('/cart/save', [PageController::class, 'save']);
