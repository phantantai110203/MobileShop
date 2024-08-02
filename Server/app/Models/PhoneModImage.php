<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PhoneModImage extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function phonemods()
    {
        return $this->belongsTo(PhoneMod::class);
    }
}