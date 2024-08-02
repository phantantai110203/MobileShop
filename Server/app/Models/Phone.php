<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Phone extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $guarded = [];

    public function phonemods()
    {
        return $this->belongsTo(PhoneMod::class);
    }
    public function carts()
    {
        return $this->hasMany(Cart::class);
    }
    public function invoiceDetails()
    {
        return $this->hasMany(InvoiceDetail::class);
    }
}
