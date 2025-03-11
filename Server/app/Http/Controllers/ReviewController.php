<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    //
    public function index($phoneModId)
    {
        $reviews = Review::with('user') // Eager load thông tin người dùng
            ->where('phonemod_id', $phoneModId)
            ->get();

        return response()->json($reviews);
    }

    public function store(Request $request, $productId)
    {
        try {
            $request->validate([
                'content' => 'required|string',
                'star' => 'required|integer|between:1,5'
            ]);

            $review = new Review();
            $review->phonemod_id = $productId;
            $review->user_id = $request->user_id;
            $review->star = $request->star;
            $review->content = $request->content;
            $review->save();

            // Trả về đánh giá mới kèm thông tin người dùng
            return response()->json($review->load('user'), 201);
        }catch (\Exception $e) {
            // Log lỗi
            Log::error('Lỗi khi lưu đánh giá: ' . $e->getMessage());
            return response()->json(['error' => 'Có lỗi xảy ra.'], 500);
        }
    }
}