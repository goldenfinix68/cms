<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    protected $guarded = [];

    public function component()
    {
        return $this->belongsTo(Component::class, 'component_id');
    }
    public function computerpart()
    {
        return $this->belongsTo(Computerpart::class, 'component_id');
    }

    public function componentArchive()
    {
        return $this->belongsTo(ComponentArchive::class, 'component_id');
    }
    public function computerpartArchive()
    {
        return $this->belongsTo(ComputerpartArchive::class, 'component_id');
    }
    public function computerArchive()
    {
        return $this->belongsTo(ComputerArchive::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function transactions()
    {
        return $this->hasMany(ReportTransaction::class);
    }
}
