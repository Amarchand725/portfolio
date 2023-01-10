<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Education;

class EducationController extends Controller
{
    public function index()
    {
        $educations = Education::orderBy('id', 'desc')->get();
        return response()->json([
            'educations' => $educations
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'institution' => 'required'
        ]);

        $education = new Education();
        $education->institution = $request->institution;
        $education->period = $request->period;
        $education->degree = $request->degree;
        $education->department = $request->department;
        $education->save();
    }

    public function update(Request $request, $id)
    {
        $education = Education::find($id);
        $this->validate($request, [
            'institution' => 'required'
        ]);
        $education->institution = $request->institution;
        $education->period = $request->period;
        $education->degree = $request->degree;
        $education->department = $request->department;
        $education->save();
    }

    public function destroy($id)
    {
        $education = Education::findOrFail($id);
        $education->delete();
    }
}
