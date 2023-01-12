<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Project;
use App\Models\Service;
use App\Models\Skill;
use App\Models\Testimonial;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);

        if($validator->fails()){
            $response = [
                'success' => false,
                'message' => $validator->errors()
            ];
            return response()->json($response, 400);
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);

        $success['token'] = $user->createToken('MyApp')->plainTextToken;
        $success['name'] = $user->name;

        $response = [
            'success' => true,
            'data' => $success,
            'message' => 'User registered successfully.',
        ];

        return response()->json($response, 200);
    }

    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password ])){
            $user = $request->user();
            $success['token'] = $user->createToken('MyApp')->plainTextToken;
            $success['name'] = $user->name;

            $response = [
                'success' => true,
                'data' => $success,
                'message' => 'User login successfully.',
            ];

            return response()->json($response, 200);
        }else{
            $response = [
                'success' => false,
                'message' => 'Unauthorized',
            ];

            return response()->json($response);
        }
    }

    public function getData()
    {
        $data = [];
        $data['projects'] = Project::orderBy('id', 'desc')->get();
        $data['testimonials'] = Testimonial::orderBy('id', 'desc')->get();
        $data['services'] = Service::with('haveSkills')->orderBy('id', 'desc')->get();
        $data['skills_count'] = Skill::count();
        $data['educations_count'] = Education::count();
        $data['experiences_count'] = Experience::count();
        $data['services_count'] = Service::count();
        $data['projects_count'] = Project::count();
        $data['testimonials_count'] = Testimonial::count();
        $data['messages_count'] = Message::count();
        $data['users_count'] = User::count();

        return response()->json([
            'user_data' => $data,
        ], 200);
    }
}
