<?php

namespace App\Http\Controllers;

use App\Models\SlideShow;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ApiSlideController extends Controller
{
    //
    public function index()
    {
        $slides = SlideShow::all()->map(function ($slide) {
            // Giả sử bạn lưu hình ảnh trong thư mục 'storage/phone_images'
            $slide->image = asset('storage/SlideShow/' . $slide->image);

            return $slide;
        });


        return response()->json($slides);

    }
}