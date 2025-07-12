<?php

namespace App\Http\Controllers\admin;

use App\Models\Service;
use App\Models\TempImage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;


class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
         $services = Service::orderBy('created_at','desc')->get();

         return response()->json([
            'status' => true,
            'data' => $services
         ]);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'title' => 'required',
            'slug'=> 'required|unique:services,slug'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);

        }

    $service = new Service();
    $service->title = trim($request->title);
    $service->slug = trim(Str::slug($request->slug));
    $service->short_desc = trim($request->short_desc);
    $service->content = trim($request->content);
    $service->status = trim($request->status);
    $service->save();

        // Save Temp Image here
    if($request->imageId > 0) {
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
            $extArray = explode('.',$tempImage->name);
            $ext = last($extArray);

            $filenName = strtotime('now').$service->id.'.'.$ext;

            // Create small thumbnail here
            $sourcePath = public_path('uploads/temp/'.$tempImage->name);
            $destPath = public_path('uploads/services/small/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->coverDown(500,600);
            $image->save($destPath);


            // Create large thumbnail here
            $destPath = public_path('uploads/services/large/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->scaleDown(1200);
            $image->save($destPath);

            $service->image = $filenName;
            $service->save();

        }
    }


        return response()->json([
            'status' => true,
            'message' => 'Services added Successfully'
        ]);
        }


        public function show(string $id) {
          $service = Service::find($id);
          if($service == null) {
            return response()->json([
                'status'=> false,
                'message' => 'Service not found'
            ]);
          }

          return response()->json([
            'status' => true,
            'data' => $service
          ]);

        }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $service = Service::find($id);
        if($service == null) {
            return response()->json([
                'status'=>false,
                'message' =>'Service not found'
            ]);
        }

        $validator = Validator::make($request->all(),[
            'title' => 'required',
            'slug' => 'required|unique:services,slug,'.$id.',id'
        ]);

        if($validator->fails()) {
           return response()->json([
             'status' => false,
              'errors' => $validator->errors()
           ]);
        }

        $service->title = trim($request->title);
        $service->slug = trim(Str::slug($request->slug));
        $service->short_desc = trim($request->short_desc);
        $service->content = trim($request->content);
        $service->status = trim($request->status);
        $service->save();

        // Save Temp Image here
        if($request->imageId > 0) {
            $oldImage = $service->image;
            $tempImage = TempImage::find($request->imageId);
            if($tempImage != null) {
                 $extArray = explode('.',$tempImage->name);
                 $ext = last($extArray);

                 $filenName = strtotime('now').$service->id.'.'.$ext;

                 // Create small thumbnail here
                $sourcePath = public_path('uploads/temp/'.$tempImage->name);
                $destPath = public_path('uploads/services/small/'.$filenName);
                $manager = new ImageManager(Driver::class);
                $image = $manager->read($sourcePath);
                $image->coverDown(500,600);
                $image->save($destPath);


                // Create large thumbnail here
                $destPath = public_path('uploads/services/large/'.$filenName);
                $manager = new ImageManager(Driver::class);
                $image = $manager->read($sourcePath);
                $image->scaleDown(1200);
                $image->save($destPath);

                 $service->image = $filenName;
                 $service->save();

                 if($oldImage != '') {
                   File::delete(public_path('uploads/services/large/'.$oldImage));
                   File::delete(public_path('uploads/services/small/'.$oldImage));
                 }
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Service Updated Successfully'
        ]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
      $service = Service::find($id);
      if($service == null) {
        return response()->json([
            'status' => false,
            'message' => 'Service not found'
        ]);
      }
      $service->delete();

      return response()->json([
        'status' => true,
        'message' => 'Service deleted Successfully'
      ]);
    }
}
