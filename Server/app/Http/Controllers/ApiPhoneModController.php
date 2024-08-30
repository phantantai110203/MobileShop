<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Models\PhoneMod;

class ApiPhoneModController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function search(Request $request)
    {
        $query = $request->input('query');
        $products = PhoneMod::where('name', 'like', '%' . $query . '%')->get()->map(function ($phone) {
            // Giả sử bạn lưu hình ảnh trong thư mục 'storage/phone_images'
            $phone->image = asset('storage/phone_image/' . $phone->image);
            // Định dạng giá tiền với dấu phân cách hàng nghìn
            $phone->price = number_format($phone->price, 0, ',', '.');
            return $phone;
        });
        return response()->json($products);
    }
    public function index()
    {
        $phonemod = PhoneMod::all()->map(function ($phone) {
            // Giả sử bạn lưu hình ảnh trong thư mục 'storage/phone_images'
            $phone->image = asset('storage/phone_image/' . $phone->image);
            // Định dạng giá tiền với dấu phân cách hàng nghìn
            $phone->price = number_format($phone->price, 0, ',', '.');
            return $phone;
        });


        return response()->json($phonemod);
        // $phonemod =PhoneMod::all();
        // return response()->json($phonemod);
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        //
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        //
        return  PhoneMod::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
