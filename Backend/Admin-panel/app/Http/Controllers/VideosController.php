<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Video;


// ...

class VideosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $videos = Video::all();
        return view('app control.videos.index', compact('videos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('app control.videos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'video_link' => 'required',
        ]);

        $video = new Video();
        $video->name = $request->input('name');
        $video->video_link = $request->input('video_link');

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $thumbnailPath = $thumbnail->store('thumbnails', 'public');
            $video->thumbnail = $thumbnailPath;
        }

        $video->save();

        return redirect()->route('app control.videos.index')->with('success', 'Video created successfully.');
    }


    public function edit(Video $video)
    {
        return view('app control.videos.edit', compact('video'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Video $video)
    {
        $request->validate([
            'name' => 'required',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'video_link' => 'required',
        ]);

        $video->name = $request->input('name');
        $video->video_link = $request->input('video_link');

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $thumbnailPath = $thumbnail->store('thumbnails', 'public');
            $video->thumbnail = $thumbnailPath;
        }

        $video->save();

        return redirect()->route('app control.videos.index')->with('success', 'Video updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Video $video)
    {
        $video->delete();

        return redirect()->route('app control.videos.index')->with('success', 'Video deleted successfully.');
    }
}
