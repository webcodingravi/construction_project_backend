<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Article;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    // This method will fetch all articles
    public function index() {
        $articles = Article::where('status',1)
        ->orderBy('created_at','desc')
        ->get();
        return response()->json([
            'status' => true,
            'data' => $articles
        ],200);

    }

    //  This method will fetch latest Articles
    public function latestArticles(Request $request) {
        $articles = Article::where('status',1)
        ->take($request->get('limit'))
        ->orderBy('created_at','desc')
        ->get();
        return response()->json([
            'status' => true,
            'data' => $articles
        ],200);
    }


// This method will fetch all articles
    public function singleArticle(string $slug) {
        $article = Article::where('slug',$slug)->first();
        if($article == null) {
            return response()->json([
                'status' => false,
                'message' => 'Article Not Found'
            ],404);
        }
        return response()->json([
            'status' => true,
            'data' => $article
        ],200);

    }


}