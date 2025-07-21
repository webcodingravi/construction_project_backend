<?php

namespace App\Http\Controllers\admin;

use App\Models\Member;
use App\Models\TempImage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;

class MemberController extends Controller
{
    // This is method will return all members
    public function index(Request $request) {
      $members = Member::orderBy('created_at','desc');
      if(!empty($request->get('query'))) {
        $members = $members->where('name','like','%'.$request->get('query').'%');
      }
      $members = $members->paginate($request->get('limit'));

      return response()->json([
        'status' => true,
        'data' => $members
      ],200);
    }

    // This is method will store/insert members
    public function store(Request $request) {
      $validator = Validator::make($request->all(),[
        'name' => 'required',
        'job_title' => 'required',

      ]);

      if($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ]);
      }

      $member = new Member();
      $member->name = trim($request->name);
      $member->job_title = trim($request->job_title);
      $member->linkedin_url = trim($request->linkedin_url);
      $member->status = trim($request->status);
      $member->save();

    //    Save temp image here
     if($request->imageId > 0) {
        $tempImage = TempImage::find($request->imageId);
        if($tempImage != null) {
           $extArray = explode('.',$tempImage->name);
           $ext = last($extArray);

           $fileName = strtotime('now').$member->id.'.'.$ext;

        // Create small thumbnail here
        $sourcePath = public_path('uploads/temp/'.$tempImage->name);
        $destPath = public_path('uploads/members/'.$fileName);
        $manager = new ImageManager(Driver::class);
        $image = $manager->read($sourcePath);
        $image->coverDown(400,500);
        $image->save($destPath);

        $member->image = $fileName;
        $member->save();
        }
     }

      return response()->json([
        'status' => true,
        'message' => 'Member added Successfully'
      ],201);
    }

    // This is method will return single member data
    public function show(string $id) {
     $member = Member::find($id);
     if($member == null) {
        return response()->json([
          'status' => false,
          'massage' => 'Member Not Found'
        ],404);

         }

        return response()->json([
            'status' => true,
            'data' => $member
        ],200);


    }

    // This is method will update a single member data
    public function update(Request $request, string $id) {
        $member = Member::find($id);
        if($member == null) {
            return response()->json([
                'status' => false,
                'message' => 'Member Not Found'
            ],404);
        }

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'job_title' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        $member->name = trim($request->name);
        $member->job_title = trim($request->job_title);
        $member->linkedin_url = trim($request->linkedin_url);
        $member->status = trim($request->status);
        $member->save();

        //Save temp image here
        if($request->imageId > 0) {
            $oldImage = $member->image;
            $tempImage = TempImage::find($request->imageId);
            if($tempImage != null) {
                $extArray = explode('.',$tempImage->name);
                $ext = last($extArray);
                $fileName = strtotime('now').$member->id.'.'.$ext;

                //  create small thumbnail here
                $sourcePath = public_path('uploads/temp/'.$tempImage->name);
                $destPath = public_path('uploads/members/'.$fileName);
                $manager = new ImageManager(Driver::class);
                $image = $manager->read($sourcePath);
                $image->coverDown(400,500);
                $image->save($destPath);

                $member->image = $fileName;
                $member->save();

                 if($oldImage != '') {
                  File::delete(public_path('uploads/members/'.$oldImage));
                 }
            }
        }
        return response()->json([
            'status' => true,
            'message' => 'Member updated Successfully'
          ],201);

    }

    // This is mehtod will delete a member from db
    public function destroy(string $id) {
        $member = Member::find($id);
        if($member == null) {
            return response()->json([
                'status' => false,
                'message' => 'Member Not Found'
            ],404);
        }
        $member->delete();

        File::delete(public_path('uploads/members/'.$member->image));

        return response()->json([
            'status' => true,
            'message' => 'Member Deleted Successfully'
        ],200);

    }
}
