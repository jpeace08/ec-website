<?php

namespace Modules\Admin\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [];
    
    public function products () {
        return $this->belongsToMany(Product::class, 'order_detail', 'order_id', 'product_id');
    }
}
