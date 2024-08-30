<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComputerTrasaction extends Model
{
    public $table = "computer_transactions";
    public function room()
    {
        return $this->belongsTo(Room::class);
    }
    public function computerparts()
    {
        return $this->hasMany(Computerpart::class);
    }
}
