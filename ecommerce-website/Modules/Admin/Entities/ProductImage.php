<?php

namespace Modules\Admin\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductImage extends Model
{
    use HasFactory;

    protected $fillable = [];
    protected $table = 'product_images';
 
    public function product () {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

}
