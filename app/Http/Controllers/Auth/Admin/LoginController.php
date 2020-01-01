<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
   /*
   |--------------------------------------------------------------------------
   | Login Controller
   |--------------------------------------------------------------------------
   |
   | This controller handles authenticating users for the application and
   | redirecting them to your home screen. The controller uses a trait
   | to conveniently provide its functionality to your applications.
   |
   */
   use AuthenticatesUsers;

   /**
    * Where to redirect users after login.
    *
    * @var string
    */
   // protected $redirectTo = '/home';
   public function __construct()
   {
      $this->middleware('guest:admin')->except('logout');
   }

   /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
   public function login()
   {
      return view('auth.admin.login');
   }

   public function loginAdmin(Request $request)
   {
      // Validate the form data
      $this->validate($request, [
        'email' => 'required',
        'password' => 'required'
      ]);
      // Attempt to log the user in
      if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password, 'status' => 1], $request->remember)) {
         // if successful, then redirect to their intended location
         return redirect()->route('admin.dashboard');
      }
      // if unsuccessful, then redirect back to the login with the form data
      $errors = ['email' => 'Sorry! Wrong email or password '];
      return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors($errors);
   }


   public function logout()
   {
      Auth::guard('admin')->logout();
      return redirect()->route('admin.auth.login');
   }
}