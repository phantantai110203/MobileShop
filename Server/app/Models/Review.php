<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $fillable = [
        'phonemod_id',
        'user_id',
        'star',
        'content'
    ];
    public function phonemods()
    {
        return $this->belongsTo(PhoneMod::class);
    }
    public function User()
    {
        return $this->belongsTo(User::class);
    }
}
