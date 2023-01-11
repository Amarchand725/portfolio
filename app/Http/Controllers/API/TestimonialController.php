<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\Testimonial;

class TestimonialController extends Controller
{
    public function index()
    {
        $testimonials = Testimonial::orderBy('id', 'desc')->get();
        return response()->json([
            'testimonials' => $testimonials
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'title' => 'required'
        ]);

        $testimonial = new Testimonial();
        $testimonial->title = $request->title;
        $testimonial->description = $request->description;
        $testimonial->link = $request->link;

        // if($request->photo){
        //     $strpos = strpos($request->photo, ';');
        //     $sub = substr($request->photo, 0, $strpos);
        //     $ex = explode('/', $sub)[1];
        //     $photo = time().".".$ex;
        //     $img = Image::make($request->photo)->resize(700, 500);
        //     $upload_path = public_path()."/img/upload/";
        //     $image = $upload_path.$project->photo;
        //     $img->save($upload_path.$photo);
        //     if(file_exists($image)){
        //         @unlink($image);
        //     }
        // }else{
        //     $photo = $project->photo;
        // }
        // $project->photo = $photo;
        // $project->save();
    }

    public function edit($id)
    {
        $project = Testimonial::find($id);
        return response()->json([
            'project' => $project
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $project = Testimonial::find($id);
        $this->validate($request, [
            'title' => 'required'
        ]);

        $project->title = $request->title;
        $project->description = $request->description;
        $project->link = $request->link;

        if($project->photo != $request->photo){
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
            }
        }else{
            $photo = $project->photo;
        }

        $project->photo = $photo;
        $project->save();
    }

    public function destroy($id)
    {
        $project = Testimonial::findOrFail($id);
        $image_path = public_path()."/img/upload/";
        $image = $image_path.$project->photo;
        if(file_exists($image)){
            @unlink($image);
        }
        $project->delete();
    }
}
