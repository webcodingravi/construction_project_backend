<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Project;
use App\Models\Article;
use App\Models\Member;
use App\Models\TempImage;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;


class DashboardController extends Controller
{
    public function index() {
        $data['totalServices'] = Service::where('status',1)->count();
        $data['totalProjects'] = Project::where('status',1)->count();
        $data['totalAricles'] = Article::where('status',1)->count();
         $data['totalMembers'] = Member::where('status',1)->count();


 //Delete Temp images
    $dayBeforeToday = Carbon::now()->subDays(1)->format('Y-m-d H:i:s');

    $tempImages= TempImage::where('created_at', '>=', $dayBeforeToday)->get();

    foreach($tempImages as $tempImage) {
    $path = public_path('uploads/temp/'.$tempImage->name);
    $thumbPath = public_path('uploads/temp/thumb/'.$tempImage->name);

// Delete Main Image
    if(File::exists($path)) {
    File::delete($path);
    }

    // Delete Thumb Image
    if(File::exists($thumbPath)) {
    File::delete($thumbPath);
    }

    TempImage::where('id',$tempImage->id)->delete();

}


        return response()->json([
            'status' => true,
            'data' => $data,

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
