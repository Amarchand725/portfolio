<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Skill;

class SkillController extends Controller
{
    public function index()
    {
        $skills = Skill::with('service')->orderBy('id', 'desc')->get();
        return response()->json([
            'skills' => $skills
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);

        $skill = new Skill();
        $skill->service_id = $request->service_id;
        $skill->name = $request->name;
        $skill->proficiency = $request->proficiency;
        $skill->save();
    }

    public function update(Request $request, $id)
    {
        $skill = Skill::find($id);
        $this->validate($request, [
            'name' => 'required'
        ]);
        $skill->service_id = $request->service_id;
        $skill->name = $request->name;
        $skill->proficiency = $request->proficiency;
        $skill->save();
    }

    public function destroy($id)
    {
        $skill = Skill::findOrFail($id);
        $skill->delete();
    }
}
