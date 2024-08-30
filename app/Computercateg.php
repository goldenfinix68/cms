<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Computercateg extends Model
{
    protected $guarded = [];

    public function computerparts()
    {
        return $this->hasMany(Computerpart::class);
    }
}
