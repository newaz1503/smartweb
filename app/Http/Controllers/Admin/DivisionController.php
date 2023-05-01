<?php

namespace App\Http\Controllers\Admin;

use App\Models\Division;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DivisionController extends Controller
{
    public function index(Request $request){
        if($request->format() == 'html'){
            return view('layouts.admin.app');
        }
        $divisions = Division::orderBy('id','Desc')->get();
        return response()->json($divisions);
    }
    public function store(Request $request){
        $this->validate($request, [
            'name' => 'bail|required|string|max:100|unique:divisions'
        ]);
        $slug = Str::slug($request->name);
        Division::create([
            'name' => $request->name,
            'slug' => $slug
        ]);
        return response()->json([
            'status' => 200,
            'msg' => 'Division Stored'
        ]);
    }
    public function update(Request $request, $id){
        $this->validate($request, [
            'name' => 'bail|required|string|max:100|unique:divisions,name,'.$id
        ]);
        $slug = Str::slug($request->name);
        Division::where('id', $id)->update([
            'name' => $request->name,
            'slug' => $slug
        ]);
        return response()->json([
            'status' => 200,
            'msg' => 'Division Updated'
        ]);
    }

    public function destroy($id){
        $division = Division::findOrFail($id);
        if($division){
            $division->delete();
        }else{
            return response()->json([
                'Division not found'
            ], 404);
        }
        return response()->json([
            'msg' => 'Division deleted'
        ], 200);

    }
}
