<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Project;
use App\Models\Article;
use App\Models\Member;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;


class DashboardController extends Controller
{
    public function index() {
        $data['totalServices'] = Service::where('status',1)->count();
        $data['totalProjects'] = Project::where('status',1)->count();
        $data['totalAricles'] = Article::where('status',1)->count();
         $data['totalMembers'] = Member::where('status',1)->count();

        return response()->json([
            'status' => true,
            'data' => $data
        ]);

    }

    // login user information
    public function userInfo(){
        $user = User::find(Auth::user()->id);
        return response()->json([
            'status' => true,
            'data' => $user
        ]);
    }


    // profile pics update
    public function ProfilePic(Request $request) {
        $profilePic = User::find(Auth::user()->id); 
        if($profilePic == null) {
         return response()->json([
            'status' => false,
            'message' => 'user Not Found'
        ]);
      }
      
 
       $image = $request->image;
       if(!empty($image)) {
    
        File::delete(public_path('uploads/profilePic/'.$profilePic->image));
       
                
       $ext = $image->getClientOriginalExtension();
       $imageName = strtotime('now').'.'.$ext;
      

        $profilePic->image = $imageName;
        $profilePic->save();
 
         $image->move(public_path('uploads/profilePic'),$imageName);
   
     

       return response()->json([
         'status' => true,
         'message' => 'Image uploaded successfully'
       ]);

        }
      
  
}
}