<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SlideShow extends Model
{
    use HasFactory;
    public function phonemods()
    {
        return $this->belongsTo(PhoneMod::class);
    }
}