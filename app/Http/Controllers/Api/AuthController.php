<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\ResponseController as ResponseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use Validator;

class AuthController extends ResponseController
{
   public function login(Request $request)
   {
      if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
         $user = Auth::user();
         $success['token'] = $user->createToken('Laravel')->accessToken;
         $success['name'] = $user->name;
         return $this->sendResponse($success, 'User logged successfully.');
      } else {
         return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);
      }
   }
}
