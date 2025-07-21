<?php

namespace App\Http\Controllers\admin;

use App\Models\TempImage;
use App\Models\Testimonial;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;

class TestimonialController extends Controller
{
    // This method will return all testimonals
    public function index(Request $request) {
      $testimonials = Testimonial::orderBy('created_at','desc');
      if(!empty($request->get('query'))) {
          $testimonials = $testimonials->where('testimonial','like','%'.$request->get('query').'%');
      }
      $testimonials = $testimonials->paginate($request->get('limit'));
      return response()->json([
         'status' => true,
          'data' => $testimonials
      ]);
    }

    // This method will return single testimonial
    public function show(string $id) {
     $testimonial = Testimonial::find($id);
     if($testimonial == null) {
        return response()->json([
            'status' => false,
            'message' => 'Testimonial Not Found'
        ]);
     }

      return response()->json([
        'status' => true,
         'data' => $testimonial
      ]);
    }

    // This method will store/insert a testimonals
    public function store(Request $request) {
       $validator = Validator::make($request->all(),[
         'testimonial' => 'required',
         'citation' => 'required',
       ]);

       if($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ]);
       }

       $testimonial = new Testimonial();
       $testimonial->testimonial = trim($request->testimonial);
       $testimonial->citation = trim($request->citation);
       $testimonial->designation = trim($request->designation);
       $testimonial->status = trim($request->status);
       $testimonial->save();

       if($request->imageId > 0) {
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
           $extArray = explode('.',$tempImage->name);
           $ext = last($extArray);

           $filename = strtotime('now').$testimonial->id.'.'.$ext;

        //Create Small thumbnail here
        $sourcePath = public_path('uploads/temp/'.$tempImage->name);
        $destPath = public_path('uploads/testimonials/small/'.$filename);
        $manager = new ImageManager(Driver::class);
        $image = $manager->read($sourcePath);
        $image->coverDown(300,300);
        $image->save($destPath);

          $testimonial->image = $filename;
        $testimonial->save();

        }
       }

       return response()->json([
         'status' => true,
         'message' =>  'Testimonial added Successfully'
       ]);
    }


    // This method will update a Testimonail
    public function update(Request $request, string $id) {
        $testimonial = Testimonial::find($id);
        if($testimonial == null) {
            return response()->json([
                'status' => false,
                'message' => 'Testimonial Not Found'
            ]);

        }

        $validator = Validator::make($request->all(),[
         'testimonial' => 'required',
         'citation' => 'required',
       ]);

       if($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ]);
       }

       $testimonial->testimonial = trim($request->testimonial);
       $testimonial->citation = trim($request->citation);
       $testimonial->designation = trim($request->designation);
       $testimonial->status = trim($request->status);
       $testimonial->save();

       if($request->imageId > 0) {
         $oldImage = $testimonial->image;
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
           $extArray = explode('.',$tempImage->name);
           $ext = last($extArray);

           $filename = strtotime('now').$testimonial->id.'.'.$ext;

        //Create Small thumbnail here
        $sourcePath = public_path('uploads/temp/'.$tempImage->name);
        $destPath = public_path('uploads/testimonials/small/'.$filename);
        $manager = new ImageManager(Driver::class);
        $image = $manager->read($sourcePath);
        $image->coverDown(300,300);
        $image->save($destPath);

        $testimonial->image = $filename;
        $testimonial->save();


        if($oldImage != '') {
        File::delete(public_path('uploads/testimonials/large/'.$oldImage));
        File::delete(public_path('uploads/testimonials/small/'.$oldImage));
        }

        }
       }

       return response()->json([
         'status' => true,
         'message' =>  'Testimonial Updated Successfully'
       ]);

    }


    public function destroy(string $id) {
      $testimonial = Testimonial::find($id);
      if($testimonial == null) {
        return response()->json([
            'status' => false,
            'message' => 'Testimonial Not Found'
        ]);
         }
        $testimonial->delete();

         File::delete(public_path('uploads/testimonials/small/'.$testimonial->image));

        return response()->json([
            'status' => true,
            'message' => 'Testimonial Deleted Successfully'
        ]);

    }
}