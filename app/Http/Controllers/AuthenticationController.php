<?php

namespace App\Http\Controllers;

use App\Mail\ForgotPasswordEmail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Password;


class AuthenticationController extends Controller
{
     public function authenticate(Request $request) {
    //    Apply Validation
    $validator = Validator::make($request->all(),[
        'email' => 'required|email',
        'password' => 'required'
    ]);

    if($validator->fails()) {
        return response()->json([
          'status' => false,
          'errors' => $validator->errors()
        ]);
    }

     if(Auth::attempt(['email'=>$request->email,'password' => $request->password])) {

        $user = User::find(Auth::user()->id);
        $token = $user->createToken('token')->plainTextToken;
        return response()->json([
            'status' => true,
            'token' => $token,
            'id' => Auth::user()->id
        ]);

     }else{
        return response()->json([
            'status' => false,
            'message' => 'Either email/password is incorrect'
        ]);
     }



     }


     public function logout() {
        $user = User::find(Auth::user()->id);
        $user->tokens()->delete();
        return response()->json([
            'status' => true,
            'message' => 'Logout successfully'
        ]);
     }





     public function forgotPassword(Request $request) {
          $validator = Validator::make($request->all(),[
            'email' => 'required|email'
          ]);
          if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);

          }

          $user = User::where('email',$request->email)->first();
          if(!empty($user)) {
            $user->remember_token = Str::random(40);
            $user->save();
            Mail::to($user->email)->send(new ForgotPasswordEmail($user));
            return response()->json([
                'status' => true,
                'message' => 'Please Check Your email and reset your password'
            ]);

          }else{
            return response()->json([
                'status' => false,
                'message' => 'Email Not Found in this System'
            ]);
          }


     }


     public function resetPassword(Request $request) {
      $validator = Validator::make($request->all(),[
         'password' => 'required',
         'confirm_password' => 'required'
      ]);
            if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);

          }

          $user = User::where('remember_token',$request->remember_token)->first();
          if(!empty($user)) {
             if($request->password == $request->confirm_password) {
              $user->password = Hash::make($request->password);
              if(!empty($user->email_verified_at)) {
               $user->email_verified_at = date('Y-m-d H:i:s');
              }
                 $user->remember_token = Str::random(40);
                $user->save();

                return response()->json([
                'status' => true,
                'message' => 'Password Successfully reset'
            ]);


             }else{
                 return response()->json([
                    'status' => false,
                    'message' => 'Password and Confirm Password Does Not Match.'
                 ]);
             }
          }else{
             return response()->json([
                'status' => false,
                'message' => 'Not Found !'
            ]);
          }


     }



}