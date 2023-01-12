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
            'name' => 'required'
        ]);

        $testimonial = new Testimonial();
        $testimonial->name = $request->name;
        $testimonial->function = $request->function;
        $testimonial->testinomy = $request->testinomy;
        $testimonial->rating = $request->rating;

        if($request->photo){
            $strpos = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $photo = time().".".$ex;
            $img = Image::make($request->photo)->resize(700, 500);
            $upload_path = public_path()."/img/upload/";
            $image = $upload_path.$testimonial->photo;
            $img->save($upload_path.$photo);
            if(file_exists($image)){
                @unlink($image);
            }
        }else{
            $photo = $testimonial->photo;
        }
        $testimonial->photo = $photo;
        $testimonial->save();
    }

    public function edit($id)
    {
        $testimonial = Testimonial::find($id);
        return response()->json([
            'testimonial' => $testimonial
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $testimonial = Testimonial::find($id);
        $this->validate($request, [
            'name' => 'required'
        ]);

        $testimonial->name = $request->name;
        $testimonial->function = $request->function;
        $testimonial->testinomy = $request->testinomy;
        $testimonial->rating = $request->rating;

        if($testimonial->photo != $request->photo){
            $strpos = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $photo = time().".".$ex;
            $img = Image::make($request->photo)->resize(700, 500);
            $upload_path = public_path()."/img/upload/";
            $image = $upload_path.$testimonial->photo;
            $img->save($upload_path.$photo);
            if(file_exists($image)){
                @unlink($image);
            }
        }else{
            $photo = $testimonial->photo;
        }

        $testimonial->photo = $photo;
        $testimonial->save();
    }

    public function destroy($id)
    {
        $testimonial = Testimonial::findOrFail($id);
        $image_path = public_path()."/img/upload/";
        $image = $image_path.$testimonial->photo;
        if(file_exists($image)){
            @unlink($image);
        }
        $testimonial->delete();
    }
}
