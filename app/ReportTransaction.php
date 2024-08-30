<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ReportTransaction extends Model
{
    protected $guarded = [];

    public function report()
    {
        return $this->belongsTo(Report::class, 'report_id');
    }

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

}
