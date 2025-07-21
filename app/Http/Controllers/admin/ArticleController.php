<?php

namespace App\Http\Controllers\admin;

use App\Models\Article;
use App\Models\TempImage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;

class ArticleController extends Controller
{
    // This is method will fetch all articles
    public function index(Request $request) {
          $articles = Article::orderBy('created_at','desc');
          if(!empty($request->get('query'))) {
            $articles = $articles->where('title','like','%'.$request->get('query').'%');
          }
          $articles = $articles->paginate($request->get('limit'));
          return response()->json([
            'status' => true,
            'data' => $articles
          ]);
    }


    // This method will single article
    public function show(string $id) {
       $articles = Article::find($id);
       if($articles == null) {
        return response()->json([
            'status' => false,
            'message' => 'Article not found'
        ]);

       }

        return response()->json([
            'status' => true,
            'data' => $articles

        ]);

    }

    // This method will insert article in DB
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'title' => 'required',
            'slug' => 'required|unique:articles,slug'
        ]);

        $request->merge(['slug' => Str::slug($request->slug)]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);

            }

            $article = new Article();
            $article->title = trim($request->title);
            $article->slug = trim(Str::slug($request->slug));
            $article->author = trim($request->author);
            $article->content = trim($request->content);
            $article->status = trim($request->status);
            $article->save();

            // Save Temp Image here
           if($request->imageId > 0) {
           $tempImage = TempImage::find($request->imageId);
           if($tempImage != null) {
            $extArray = explode('.',$tempImage->name);
            $ext = last($extArray);

            $filenName = strtotime('now').$article->id.'.'.$ext;

            // Create small thumbnail here
            $sourcePath = public_path('uploads/temp/'.$tempImage->name);
            $destPath = public_path('uploads/articles/small/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->coverDown(450,300);
            $image->save($destPath);


            // Create large thumbnail here
            $destPath = public_path('uploads/articles/large/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->scaleDown(1200);
            $image->save($destPath);

            $article->image = $filenName;
            $article->save();

        }
    }

            return response()->json([
                'status' => true,
                'message' => 'Article added successfully'
            ]);

    }



    public function update(Request $request,string $id) {

        $article = Article::find($id);
          if($article == null) {
            return response()->json([
                'status' => false,
                'message' => 'Article Not Found'
            ]);
          }
        $validator = Validator::make($request->all(),[
            'title' => 'required',
            'slug' => 'required|unique:articles,slug,'.$id.',id'
        ]);

        $request->merge(['slug' => Str::slug($request->slug)]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);

        }

            $article->title = trim($request->title);
            $article->slug = trim(Str::slug($request->slug));
            $article->author = trim($request->author);
            $article->content = trim($request->content);
            $article->status = trim($request->status);
            $article->save();

            // Save Temp Image here
           if($request->imageId > 0) {
           $oldImage = $article->image;
           $tempImage = TempImage::find($request->imageId);
           if($tempImage != null) {
            $extArray = explode('.',$tempImage->name);
            $ext = last($extArray);

            $filenName = strtotime('now').$article->id.'.'.$ext;

            // Create small thumbnail here
            $sourcePath = public_path('uploads/temp/'.$tempImage->name);
            $destPath = public_path('uploads/articles/small/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->coverDown(450,300);
            $image->save($destPath);


            // Create large thumbnail here
            $destPath = public_path('uploads/articles/large/'.$filenName);
            $manager = new ImageManager(Driver::class);
            $image = $manager->read($sourcePath);
            $image->scaleDown(1200);
            $image->save($destPath);

            $article->image = $filenName;
            $article->save();

            if($oldImage != '') {
            File::delete(public_path('uploads/articles/large/'.$oldImage));
            File::delete(public_path('uploads/articles/small/'.$oldImage));
            }
        }

          }

            return response()->json([
                'status' => true,
                'message' => 'Article Updated successfully'
            ]);

    }


    public function destroy(string $id) {
        $article = Article::find($id);
        if($article == null) {
            return response()->json([
                'status' => false,
                'message' => 'Article Not Found'
            ]);

        }

      $article->delete();
       File::delete(public_path('uploads/aticles/large/'.$article->image));
       File::delete(public_path('uploads/articles/small/'.$article->image));

        return response()->json([
            'status' => true,
            'message' => 'Article Deleted Successfully'
        ]);
    }
}