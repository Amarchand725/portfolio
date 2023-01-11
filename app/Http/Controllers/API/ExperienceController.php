<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Experience;

class ExperienceController extends Controller
{
    public function index()
    {
        $experiences = Experience::orderBy('id', 'desc')->get();
        return response()->json([
            'experiences' => $experiences
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'company' => 'required'
        ]);

        $experience = new Experience();
        $experience->company = $request->company;
        $experience->period = $request->period;
        $experience->position = $request->position;
        $experience->save();
    }

    public function update(Request $request, $id)
    {
        $experience = Experience::find($id);
        $this->validate($request, [
            'company' => 'required'
        ]);
        $experience->company = $request->company;
        $experience->period = $request->period;
        $experience->position = $request->position;
        $experience->save();
    }

    public function destroy($id)
    {
        $experience = Experience::findOrFail($id);
        $experience->delete();
    }
}
