<?php

namespace Modules\Admin\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'parent_id', 'slug', 'icon', 'active'];

    public function products(){
        return $this->hasMany(Product::class, 'category_id', 'id');
    }

    public function categoryChilds(){
        return $this->hasMany(Category::class, 'parent_id', 'id');
    }
}
