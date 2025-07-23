<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\HomeBanner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\Models\TempImage;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;

class HomeBannerController extends Controller
{

    public function show(string $id) {
     $homeBanner = homeBanner::find($id);
     if($homeBanner == null) {
        return response()->json([
          'status' => false,
          'massage' => 'home banner Not Found'
        ],404);

         }

        return response()->json([
            'status' => true,
            'data' => $homeBanner
        ],200);


    }



    public function update(Request $request,string $id) {
    // $homeBanner = homeBanner::find($id);
    // if($homeBanner == null) {
    //     return response()->json([
    //       'status' => false,
    //     'message' => 'Not Found'
    //     ],404);
    // }
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
    //   $homeBanner->title = trim($request->title);
    //   $homeBanner->description = trim($request->description);
    //   $homeBanner->save();

          $homeBanner = HomeBanner::updateOrCreate(
        ['id' => $id],  // lookup criteria
        [
            'title'       => trim($request->title),
            'description' => trim($request->description),
        ]
        );


    //    Save temp image here
     if($request->imageId > 0) {
         $oldImage = $homeBanner->image;
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
           $extArray = explode('.',$tempImage->name);
           $ext = last($extArray);

           $fileName = strtotime('now').$homeBanner->id.'.'.$ext;

        // Create small thumbnail here
        $sourcePath = public_path('uploads/temp/'.$tempImage->name);
        $destPath = public_path('uploads/homeBanner/large/'.$fileName);
        $manager = new ImageManager(Driver::class);
        $image = $manager->read($sourcePath);
        $image->coverDown(5000,3000);
        $image->save($destPath);

        $homeBanner->image = $fileName;
        $homeBanner->save();

        if($oldImage != '') {
        File::delete(public_path('uploads/homeBanner/large/'.$oldImage));
        }
        }
     }
      return response()->json([
        'status' => true,
        'message' => 'Home Banner Updated Successfully'
    ]);
}

}
