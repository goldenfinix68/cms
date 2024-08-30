<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Computer extends Model
{
    protected $guarded = [];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }
    public function computerparts()
    {
        return $this->hasMany(Computerpart::class);
    }

}
