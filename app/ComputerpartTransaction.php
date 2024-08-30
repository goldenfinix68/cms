<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComputerpartTransaction extends Model
{
    public function computerpart()
    {
        return $this->belongsTo(Computerpart::class);
    }

    public function archiveComputerpart()
    {
        return $this->belongsTo(ComputerpartArchive::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function computer()
    {
        return $this->belongsTo(Computer::class);
    }

    public function computercateg()
    {
        return $this->belongsTo(Computercateg::class);
    }
}
