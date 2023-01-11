<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Message;

class MessageController extends Controller
{
    public function index()
    {
        $messages = Message::orderBy('id', 'desc')->get();
        return response()->json([
            'messages' => $messages
        ], 200);
    }

    public function changeStatus(Request $request, $id)
    {
        $message = Message::findOrFail($id);
        $message->status = $request->status;
        $message->save();
        return response()->json($request->status, 200);
    }

    public function destroy($id)
    {
        $message = Message::findOrFail($id);
        $message->delete();
    }
}
