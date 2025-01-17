<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [ 'type', 'first_name', 'last_name', 'phone', 'email', 'message', 'data' ];

}
