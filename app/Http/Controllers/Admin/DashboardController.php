<?php

namespace App\Http\Controllers\Admin;

use App\Models\District;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Division;
use App\Models\User;

class DashboardController extends Controller
{
    public function index(Request $request){
        if($request->format() == 'html'){
            return view('layouts.admin.app');
        }
        $divisions = Division::count();
        $districts = District::count();
        $users = User::count();
        return response()->json([
            'divisions' => $divisions,
            'districts' => $districts,
            'users' => $users
        ]);
    }
}
