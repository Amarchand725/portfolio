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

        $service = new Skill();
        $service->service_id = $request->service_id;
        $service->name = $request->name;
        $service->proficiency = $request->proficiency;
        $service->save();
    }

    public function update(Request $request, $id)
    {
        $skill = Skill::find($id);
        $this->validate($request, [
            'name' => 'required'
        ]);
        $skill->name = $request->name;
        $skill->icon = $request->icon;
        $skill->description = $request->description;
        $skill->save();
    }

    public function destroy($id)
    {
        $skill = Skill::findOrFail($id);
        $skill->delete();
    }
}
