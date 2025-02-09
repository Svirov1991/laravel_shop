<?php

namespace App\Http\Controllers;

use App\Services\BlocksService;
use Illuminate\Http\Request;

class GutenbergController extends Controller
{
    public function block( Request $request) {
        $slug = $request->input('slug');
        $block = app(BlocksService::class)->findBlockBySlug( $slug ) ;
        if ( $block ) {
            $attributes = $request->input('attributes');
            $id = $request->input('id');
            return $block['class']::render( $attributes, $id );
        }
        return 'block not found';
    }

    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|image|max:2048',
        ]);

        if ($request->file('file')->isValid()) {
            $path = $request->file('file')->store('blocks', 'public');

            return response()->json([
                'success' => true,
                'file_path' => $path,
                'file_asset' => asset("storage/$path"),
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Ошибка при загрузке файла',
        ], 400);
    }
}
