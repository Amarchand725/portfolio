<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;

class ServiceController extends Controller
{
    public function index()
    {
        $services = Service::orderBy('id', 'desc')->get();
        return response()->json([
            'services' => $services
        ], 200);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);

        $service = new Service();
        $service->name = $request->name;
        $service->icon = $request->icon;
        $service->description = $request->description;
        $service->save();
    }

    public function update(Request $request, $id)
    {
        $service = Service::find($id);
        $this->validate($request, [
            'name' => 'required'
        ]);
        $service->name = $request->name;
        $service->icon = $request->icon;
        $service->description = $request->description;
        $service->save();
    }

    public function destroy($id)
    {
        $service = Service::findOrFail($id);
        $service->delete();
    }
}
