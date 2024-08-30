<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PhoneMod extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'phonemods';
    protected $guarded = [];
    // khóa ngoại
    public function Brands()
    {
        return $this->belongsTo(Brand::class);
    }
    public function phones()
    {
        return $this->hasMany(Phone::class);
    }
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
    public function phonemodimages()
    {
        return $this->hasMany(PhoneModImage::class);
    }
    public function favorites()
    {
        return $this->hasMany(Favorite::class);
    }
    public function slideshows()
    {
        return $this->hasMany(SlideShow::class);
    }

}