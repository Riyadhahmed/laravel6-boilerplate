<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Http\Controllers\Controller;
use App\Models\Department;
use Illuminate\Http\Request;
use App\Models\User;
use Yajra\DataTables\DataTables;
use View;
use DB;


class DashboardController extends Controller
{

   /**
    * Show the application dashboard.
    *
    * @return \Illuminate\Contracts\Support\Renderable
    */
   public function index()
   {
      $users = $department = $pending = $working = $solved = $cancelled = 0;
      $users = User::all()->count();
      $department = Department::all()->count();
      return View::make('backend.admin.home', compact('users', 'department'));
   }

}
