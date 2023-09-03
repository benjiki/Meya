<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index()
    {
        $movies = Movie::all();
        return view('admin.movies.index', compact('movies'));
    }

    public function create()
    {
        return view('admin.movies.create');
    }

    public function store(Request $request)
    {
        // Validate the form data
        $this->validate($request, [
            'title' => 'required',
            'genre' => 'required',
            'release_date' => 'required|date',
            'duration' => 'required|integer|min:1',
            // Add other validation rules for movie details
        ]);

        // Create a new movie
        $movie = new Movie();
        $movie->title = $request->input('title');
        $movie->genre = $request->input('genre');
        $movie->release_date = $request->input('release_date');
        $movie->duration = $request->input('duration');
        // Set other movie details

        // Save the movie
        $movie->save();

        return redirect()->route('admin.movies.index')->with('success', 'Movie created successfully.');
    }

    public function show($id)
    {
        $movie = Movie::findOrFail($id);
        return view('admin.movies.view', compact('movie'));
    }

    public function edit($id)
    {
        $movie = Movie::findOrFail($id);
        return view('admin.movies.edit', compact('movie'));
    }

    public function update(Request $request, $id)
    {
        // Validate the form data
        $this->validate($request, [
            'title' => 'required',
            'genre' => 'required',
            'release_date' => 'required|date',
            'duration' => 'required|integer|min:1',
            // Add other validation rules for movie details
        ]);

        // Find the movie
        $movie = Movie::findOrFail($id);

        // Update the movie
        $movie->title = $request->input('title');
        $movie->genre = $request->input('genre');
        $movie->release_date = $request->input('release_date');
        $movie->duration = $request->input('duration');
        // Update other movie details

        // Save the updated movie
        $movie->save();

        return redirect()->route('admin.movies.index')->with('success', 'Movie updated successfully.');
    }

    public function destroy($id)
    {
        // Find the movie
        $movie = Movie::findOrFail($id);

        // Delete the movie
        $movie->delete();

        return redirect()->route('admin.movies.index')->with('success', 'Movie deleted successfully.');
    }
}
