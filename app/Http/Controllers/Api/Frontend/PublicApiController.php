<?php

namespace App\Http\Controllers\Api\Frontend;

use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\ResponseController;
use DB;

class PublicApiController extends ResponseController
{
   public function allDepartment(Request $request)
   {
      $departments = Department::all();

      if ($departments) {
         return $this->sendResponse($departments, 'success');
      } else {
         return $this->sendError('No records have found');
      }

   }
}
