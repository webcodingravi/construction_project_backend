<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\HomeBanner;
use Illuminate\Http\Request;

class HomeBannerController extends Controller
{
    public function HomeBanner() {
      $homeBanner = HomeBanner::where('id',1)->first();

      return response()->json([
           'status' => true,
           'data' => $homeBanner
      ],200);
    }
}