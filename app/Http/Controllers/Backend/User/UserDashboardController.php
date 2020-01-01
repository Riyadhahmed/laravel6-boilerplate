<?php

namespace App\Http\Controllers\Backend\User;

use App\Http\Controllers\Controller;
use App\Models\RequestProblem;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use View;
use DB;
use Session;

class UserDashboardController extends Controller
{
   public function index()
   {
      return view('backend.user.home');
   }

   public function profile()
   {
      $user = Auth::user();
      return view('backend.user.profile', compact('user'));
   }

   public function edit()
   {
      $user = Auth::user();
      return view('backend.user.edit_profile', compact('user'));
   }

   public function update(Request $request)
   {
      if ($request->ajax()) {

         $user = User::findOrFail(Auth::user()->id);

         $rules = [
           'name' => 'required',
           'email' => 'required|email|unique:users,email,' . $user->id,
         ];

         $validator = Validator::make($request->all(), $rules);
         if ($validator->fails()) {
            return response()->json([
              'type' => 'error',
              'errors' => $validator->getMessageBag()->toArray()
            ]);
         } else {


            $upload_ok = 1;
            $file_path = $request->input('SelectedFileName');;

            if ($request->hasFile('photo')) {
               if ($request->file('photo')->isValid()) {
                  $extension = $request->file('photo')->getClientOriginalExtension(); // getting image extension
                  $fileName = time() . '.' . $extension;
                  $file_path = 'assets/images/users/' . $fileName;
                  $request->file('photo')->move('assets/images/users/', $fileName); // uploading file to given path
                  $upload_ok = 1;
               } else {
                  return response()->json([
                    'type' => 'error',
                    'message' => "<div class='alert alert-warning'>Please! File is not valid</div>"
                  ]);
               }
            }

            if ($upload_ok == 0) {
               return response()->json([
                 'type' => 'error',
                 'message' => "<div class='alert alert-warning'>Sorry Failed</div>"
               ]);
            } else {

               DB::beginTransaction();
               try {
                  $user->name = $request->input('name');
                  $user->email = $request->input('email');
                  $user->mobile = $request->input('mobile');
                  $user->file_path = $file_path;
                  $user->save();

                  DB::commit();
                  return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);

               } catch (\Exception $e) {
                  DB::rollback();
                  return response()->json(['type' => 'error', 'message' => $e->getMessage()]);
               }

            }

         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   public function change_password()
   {
      return view('backend.user.change_password');
   }

   public function update_password(Request $request)
   {
      if ($request->ajax()) {

         $user = User::findOrFail(Auth::user()->id);

         $rules = [
           'password' => 'required'
         ];

         $validator = Validator::make($request->all(), $rules);
         if ($validator->fails()) {
            return response()->json([
              'type' => 'error',
              'errors' => $validator->getMessageBag()->toArray()
            ]);
         } else {
            $user->password = Hash::make($request->input('password'));
            $user->save(); //
            return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }
}
