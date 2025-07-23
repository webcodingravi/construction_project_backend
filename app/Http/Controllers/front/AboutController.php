<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\About;
use Illuminate\Http\Request;

class AboutController extends Controller
{

    public function aboutUs() {
      $aboutUs = About::where('id',1)->first();

      return response()->json([
           'status' => true,
           'data' => $aboutUs
      ],200);
    }
}