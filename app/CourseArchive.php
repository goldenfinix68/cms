<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseArchive extends Model
{
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }
    public function department()
    {
        return $this->belongsTo(Department::class);
    }
    public function departmentArchive()
    {
        return $this->belongsTo(DepartmentArchive::class,'department_id');
    }
}
