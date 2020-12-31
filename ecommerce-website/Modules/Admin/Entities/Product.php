<?php

namespace Modules\Admin\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [];

    use SoftDeletes;
    protected $guarded = [];

    // nhiều nhiều
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
    public function trademark()
    {
        return  $this->hasOne(Trademark::class, 'trademark_id', 'id');
    }

    public function product_images (){
        return $this->hasMany(ProductImage::class, 'product_id', 'id');
    }

    public function orders () {
        return $this->belongsToMany(Order::class, 'order_detail', 'product_id', 'order_id');
    }
}
