<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\About;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\Models\TempImage;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;

class AboutController extends Controller
{


    public function show(string $id) {
     $aboutUs = About::find($id);
     if($aboutUs == null) {
        return response()->json([
          'status' => false,
          'massage' => 'About Not Found'
        ],404);

         }

        return response()->json([
            'status' => true,
            'data' => $aboutUs
        ],200);


    }

     public function update(Request $request,string $id) {

    $aboutUs = About::find($id);
    if($aboutUs == null) {
        return response()->json([
          'status' => false,
        'message' => 'Not Found'
        ],404);
    }

      $validator = Validator::make($request->all(),[
        'title' => 'required',
        'description' => 'required',

      ]);

      if($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ]);
      }

      $aboutUs->title = trim($request->title);
      $aboutUs->description = trim($request->description);
      $aboutUs->save();

    //    Save temp image here
     if($request->imageId > 0) {
         $oldImage = $aboutUs->image;
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
           $extArray = explode('.',$tempImage->name);
           $ext = last($extArray);

           $fileName = strtotime('now').$aboutUs->id.'.'.$ext;

        // Create small thumbnail here
        $sourcePath = public_path('uploads/temp/'.$tempImage->name);
        $destPath = public_path('uploads/abouts/small/'.$fileName);
        $manager = new ImageManager(Driver::class);
        $image = $manager->read($sourcePath);
        $image->coverDown(400,207);
        $image->save($destPath);


        $aboutUs->image = $fileName;
        $aboutUs->save();
        if($oldImage != '') {
        File::delete(public_path('uploads/abouts/small/'.$oldImage));
        }

        }
     }
      return response()->json([
        'status' => true,
        'message' => 'About Us Updated Successfully'
    ]);
}
}
