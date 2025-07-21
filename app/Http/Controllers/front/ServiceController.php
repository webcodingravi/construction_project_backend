<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{

    // This method will return all active services
    public function index() {
    $services =  Service::where('status',1)->orderBy('created_at','desc')->get();

    return response()->json([
        'status' => true,
        'data' => $services
    ]);


    }


    // this method will return latest active services
    public function latestServices(Request $request) {
        $services = Service::where('status',1)->take($request->get('limit'))
        ->orderBy('created_at','desc')->get();
        return $services;

         return response()->json([
        'status' => true,
        'data' => $services
    ]);

    }


    // This method will return single services
    public function singleService(string $slug) {
    $service = Service::where('slug',$slug)->first();
    if($service == null) {
       return response()->json([
        'status' => false,
        'message' => 'Service Not Found'
       ],404);
    }

    return response()->json([
        'status' => true,
        'data' => $service
    ]);


    }
}