<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\Project;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::orderBy('id', 'desc')->get();
        return response()->json([
            'projects' => $projects
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'title' => 'required'
        ]);

        $project = new Project();
        $project->title = $request->title;
        $project->description = $request->description;
        $project->link = $request->link;

        if($request->photo){
            $strpos = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $photo = time().".".$ex;
            $img = Image::make($request->photo)->resize(700, 500);
            $upload_path = public_path()."/img/upload/";
            $image = $upload_path.$project->photo;
            $img->save($upload_path.$photo);
            if(file_exists($image)){
                @unlink($image);
            }else{
                $photo = $project->photo;
            }
        }
        $project->photo = $photo;
        $project->save();
    }

    public function edit($id)
    {
        $project = Project::find($id);
        return response()->json([
            'project' => $project
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $project = Project::find($id);
        $this->validate($request, [
            'title' => 'required'
        ]);
        $project->title = $request->title;
        $project->description = $request->description;
        $project->link = $request->link;
        $project->photo = $request->photo;
        $project->save();
    }

    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();
    }
}
