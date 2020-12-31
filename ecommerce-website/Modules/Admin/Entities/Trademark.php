<?php

namespace Modules\Admin\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Trademark extends Model
{
    protected $table = 'trademarks';
    protected $guarded = [];

    public function products()
    {
        return $this->hasMany(Product::class, 'trademark_id', 'id');
    }
}
