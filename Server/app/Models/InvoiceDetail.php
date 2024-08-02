<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceDetail extends Model
{
    use HasFactory;
    public function phones()
    {
        return $this->belongsTo(Phone::class);
    }
    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}