<?php

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

Route::prefix('admin')->group(function() {
    Route::get('/', 'AdminController@index')->name('admin.get.home');
    Route::group(['prefix' => 'product'], function () {
        Route::get('/', 'AdminProductController@index')->name('admin.get.list.product');
        Route::get('/add', 'AdminProductController@create')->name('admin.get.create.product');
        Route::get('/update/{id}', 'AdminProductController@edit')->name('admin.get.edit.product');
        Route::get('/remove/${id}', 'AdminProductController@remove')->name('admin.get.remove.product');
        Route::post('/add', 'AdminProductController@store')->name('admin.post.create.product');
        Route::post('/save-product-images', 'AdminProductController@saveProductImages');
        Route::post('remove-product-images', 'AdminProductController@removeImage');
        Route::post('/update/{id}', 'AdminProductController@update')->name('admin.post.update.product');
    });

    Route::group(['prefix' => 'category'], function () {
        Route::get('/', 'AdminCategoryController@index')->name('admin.get.list.category');
        Route::get('/add', 'AdminCategoryController@create')->name('admin.get.create.category');
        Route::post('/add', 'AdminCategoryController@store')->name('admin.post.create.category');
        Route::post('/active', 'AdminCategoryController@setActive');
        Route::post('/update', 'AdminCategoryController@update');
        Route::get('/remove/{id}', 'AdminCategoryController@remove');
    });

    Route::group(['prefix' => 'trademark'], function () {
        Route::get('/', 'AdminTradeMarkController@index')->name('admin.get.list.trademark');
        Route::get('/add', 'AdminTradeMarkController@create')->name('admin.get.create.trademark');
        Route::post('/add', 'AdminTradeMarkController@store')->name('admin.post.create.trademark');
        Route::post('/active', 'AdminTradeMarkController@setActive');
        Route::post('/update', 'AdminTradeMarkController@update');
        Route::get('/remove/{id}', 'AdminTradeMarkController@remove');
    });
});
