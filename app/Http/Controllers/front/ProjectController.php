<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Project;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function index() {
        $projects = Project::where('status',1)->orderBy('created_at','desc')->get();
        return response()->json([
            'status' => true,
            'data' => $projects
        ],200);
    }

    public function latestProjects(Request $request) {
        $projects = Project::where('status',1)->take($request->get('limit'))
        ->orderBy('created_at','desc')->get();
        return response()->json([
            'status' => true,
            'data' => $projects
        ],200);
    }

      public function singleProject(string $slug) {
        $project = Project::where('slug',$slug)->first();
        if($project == null) {
            return response()->json([
                'status' => false,
                'message' => 'Project Not Found'
            ],404);
        }
        return response()->json([
            'status' => true,
            'data' => $project
        ],200);
    }

}
