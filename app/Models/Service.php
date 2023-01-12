<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function haveSkills()
    {
        return $this->hasMany(Skill::class, 'service_id', 'id');
    }
}
