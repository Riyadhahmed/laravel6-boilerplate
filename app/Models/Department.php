<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{

   public function users()
   {
      return $this->hasMany(User::class, 'department_id');
   }

   public function problems()
   {
      return $this->hasMany(RequestProblem::class, 'department_id');
   }
}
