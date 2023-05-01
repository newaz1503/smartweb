<?php

namespace App\Http\Controllers\Admin;

use App\Models\District;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DistrictController extends Controller
{
    public function index(Request $request){
        if($request->format() == 'html'){
            return view('layouts.admin.app');
        }
        $districts = District::orderBy('id','Desc')->get();
        return response()->json($districts);
    }
    public function store(Request $request){
        $this->validate($request, [
            'division' => 'bail|required',
            'name' => 'bail|required|string|max:100|unique:districts'
        ]);
        $slug = Str::slug($request->name);
        District::create([
            'division_id' => $request->division,
            'name' => $request->name,
            'slug' => $slug
        ]);
        return response()->json([
            'status' => 200,
            'msg' => 'District Stored'
        ]);
    }
    public function update(Request $request, $id){
        $this->validate($request, [
            'division' => 'bail|required',
            'name' => 'bail|required|string|max:100|unique:districts,name,'.$id
        ]);
        $slug = Str::slug($request->name);
        District::where('id', $id)->update([
            'division_id' => $request->division,
            'name' => $request->name,
            'slug' => $slug
        ]);
        return response()->json([
            'status' => 200,
            'msg' => 'District Stored'
        ]);
    }

    public function destroy($id){
        $district = District::findOrFail($id);
        if($district){
            $district->delete();
        }else{
            return response()->json([
                'District not found'
            ], 404);
        }
        return response()->json([
            'msg' => 'District deleted'
        ], 200);

    }
}
