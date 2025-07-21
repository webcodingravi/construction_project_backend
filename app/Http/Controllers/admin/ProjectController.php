<?php

namespace App\Http\Controllers\admin;

use App\Models\Project;
use App\Models\TempImage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;


class ProjectController extends Controller
{
    // this method will return all projects
   public function index(Request $request) {
    $projects = Project::orderBy('created_at','desc');
    if(!empty($request->get('query'))) {
        $projects = $projects->where('title','like','%'.$request->get('query').'%');
    }
    $projects = $projects->paginate($request->get('limit'));

    return response()->json([
        'status' => true,
        'data' => $projects
    ]);

   }

//    this method will insert a project in db
   public function store(Request $request) {
   $validator = Validator::make($request->all(),[
    'title' => 'required',
    'slug'=> 'required|unique:projects,slug'
   ]);

   $request->merge(['slug' => Str::slug($request->slug)]);

   if($validator->fails()) {
    return response()->json([
        'status' => false,
        'errors' => $validator->errors()
    ]);
   }

   $project = new Project();
   $project->title = trim($request->title);
   $project->slug = trim(Str::slug($request->slug));
   $project->short_desc = trim($request->short_desc);
   $project->content = trim($request->content);
   $project->construction_type = trim($request->construction_type);
    $project->sector = trim($request->sector);
   $project->location = trim($request->location);
   $project->status = trim($request->status);
   $project->save();

    // Save Temp Image here
    if($request->imageId > 0) {
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
            $extArray = explode('.',$tempImage->name);
            $ext = last($extArray);

            $filenName = strtotime('now').$project->id.'.'.$ext;

            // Create small thumbnail here
            $sourcePath = public_path('uploads/temp/'.$tempImage->name);
            $destPath = public_path('uploads/projects/small/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->coverDown(500,600);
            $image->save($destPath);


            // Create large thumbnail here
            $destPath = public_path('uploads/projects/large/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->scaleDown(1200);
            $image->save($destPath);

            $project->image = $filenName;
            $project->save();

        }
    }

   return response()->json([
     'status' => true,
     'message' => 'Project added successfully'
   ]);
   }


   public function show(string $id) {
     $project = Project::find($id);
     if($project == null) {
        return response()->json([
           'status' => false,
           'message' => 'Project not found'
        ]);
     }

     return response()->json([
        'status' => true,
        'data' => $project
     ]);
   }



   public function update(Request $request, string $id) {
   $project = Project::find($id);
   if($project == null) {
     return response()->json([
        'status' => false,
        'message' => 'Project not found'
     ]);
   }

   $validator = Validator::make($request->all(),[
    'title' => 'required',
    'slug'=> 'required|unique:projects,slug,'.$id.',id'
   ]);


   $request->merge(['slug' => Str::slug($request->slug)]);

   if($validator->fails()) {
    return response()->json([
        'status' => false,
        'errors' => $validator->errors()
    ]);
   }

   $project->title = trim($request->title);
   $project->slug = trim(Str::slug($request->slug));
   $project->short_desc = trim($request->short_desc);
   $project->content = trim($request->content);
   $project->construction_type = trim($request->construction_type);
   $project->sector = trim($request->sector);
   $project->location = trim($request->location);
   $project->status = trim($request->status);
   $project->save();


     // Save Temp Image here
    if($request->imageId > 0) {
      $oldImage = $project->image;
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
            $extArray = explode('.',$tempImage->name);
            $ext = last($extArray);

            $filenName = strtotime('now').$project->id.'.'.$ext;

            // Create small thumbnail here
            $sourcePath = public_path('uploads/temp/'.$tempImage->name);
            $destPath = public_path('uploads/projects/small/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->coverDown(500,600);
            $image->save($destPath);


            // Create large thumbnail here
            $destPath = public_path('uploads/projects/large/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->scaleDown(1200);
            $image->save($destPath);

            $project->image = $filenName;
            $project->save();

             if($oldImage != '') {
            File::delete(public_path('uploads/projects/large/'.$oldImage));
            File::delete(public_path('uploads/projects/small/'.$oldImage));
            }

        }
    }

    return response()->json([
        'status' => true,
        'message' => 'Project Updated Successfully'
    ]);


   }


   public function destroy(string $id) {
      $project = Project::find($id);
      if($project == null) {
        return response()->json([
            'status' => false,
            'message' => 'Project Not Found'
        ]);
      }
        $project->delete();

        File::delete(public_path('uploads/projects/large/'.$project->image));
       File::delete(public_path('uploads/projects/small/'.$project->image));

        return response()->json([
              'status' => true,
              'message' => 'Project Deleted Successfully'
        ]);
   }
}
