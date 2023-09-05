<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UpcomingVideo;

class UpcomingVideosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $upcomingVideos = UpcomingVideo::all();
        return view('app control.upcoming-videos.index', compact('upcomingVideos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('app control.upcoming-videos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);

        $upcomingVideo = new UpcomingVideo();
        $upcomingVideo->name = $request->input('name');

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $thumbnailPath = $thumbnail->store('thumbnails', 'public');
            $upcomingVideo->thumbnail = $thumbnailPath;
        }

        $upcomingVideo->save();

        return redirect()->route('app control.upcoming-videos.index')->with('success', 'Upcoming video created successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UpcomingVideo $upcomingVideo)
    {
        return view('app control.upcoming-videos.edit', compact('upcomingVideo'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UpcomingVideo $upcomingVideo)
    {
        $request->validate([
            'name' => 'required',
            'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);

        $upcomingVideo->name = $request->input('name');

        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $thumbnailPath = $thumbnail->store('thumbnails', 'public');
            $upcomingVideo->thumbnail = $thumbnailPath;
        }

        $upcomingVideo->save();

        return redirect()->route('app control.upcoming-videos.index')->with('success', 'Upcoming video updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UpcomingVideo $upcomingVideo)
    {
        $upcomingVideo->delete();

        return redirect()->route('app control.upcoming-videos.index')->with('success', 'Upcoming video deleted successfully.');
    }
}
