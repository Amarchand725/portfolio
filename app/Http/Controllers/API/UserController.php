<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;

class UserController extends Controller
{
    public function index()
    {
        $users = User::orderBy('id', 'desc')->get();
        return response()->json([
            'users' => $users
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2|max:50',
            'email' => 'required'
        ]);

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $request->type;
        $user->bio = $request->bio;
        $user->password = Hash::make($request->password);

        if($request->photo){
            $strpos = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $photo = time().".".$ex;
            $img = Image::make($request->photo)->resize(700, 500);
            $upload_path = public_path()."/img/upload/";
            $image = $upload_path.$user->photo;
            $img->save($upload_path.$photo);
            if(file_exists($image)){
                @unlink($image);
            }
        }else{
            $photo = 'avatar.png';
        }
        $user->photo = $photo;
        $user->save();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|min:2|max:50',
            'email' => 'required'
        ]);
        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $request->type;
        $user->bio = $request->bio;

        if(!empty($request->password)){
            $user->password = Hash::make($request->password);
        }

        if($user->photo != $request->photo){
            $strpos = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $photo = time().".".$ex;
            $img = Image::make($request->photo)->resize(700, 500);
            $upload_path = public_path()."/img/upload/";
            $image = $upload_path.$user->photo;
            $img->save($upload_path.$photo);
            if(file_exists($image)){
                @unlink($image);
            }
        }else{
            $photo = 'avatar.png';
        }
        $user->photo = $photo;
        $user->save();

    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $image_path = public_path()."/img/upload/";
        $image = $image_path.$user->photo;
        if(file_exists($image)){
            @unlink($image);
        }
        $user->delete();
    }

    public function profile()
    {
        return Auth::user();
    }
}
