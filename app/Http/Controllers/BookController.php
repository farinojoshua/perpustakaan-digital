<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookRequest;
use App\Models\Book;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
        $query = Book::with(['category']);

        return DataTables::of($query)
            ->editColumn('cover', function ($book) {
                return '<img src="'. $book->cover .'" alt="Thumbnail" class="w-20 mx-auto rounded-md">';
            })
            ->addColumn('action', function ($book) {
                return '
                    <a class="block w-full px-2 py-1 mb-1 text-xs text-center text-white transition duration-500 bg-gray-700 border border-gray-700 rounded-md select-none ease hover:bg-gray-800 focus:outline-none focus:shadow-outline"
                        href="' . route('book.edit', $book->id) . '">
                        Sunting
                    </a>
                    <form class="block w-full" onsubmit="return confirm(\'Apakah anda yakin?\');" -block" action="' . route('book.destroy', $book->id) . '" method="POST">
                    <button class="w-full px-2 py-1 text-xs text-white transition duration-500 bg-red-500 border border-red-500 rounded-md select-none ease hover:bg-red-600 focus:outline-none focus:shadow-outline" >
                        Hapus
                    </button>
                        ' . method_field('delete') . csrf_field() . '
                    </form>';
            })
            ->rawColumns(['action', 'thumbnail'])
            ->make();
    }

    return view('book.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();

        return view('book.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $data['slug'] = Str::slug($data['title']) . '-' . Str::lower(Str::random(5));

        Book::create($data);

        return redirect()->route('book.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Book $book)
    {
      //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Book $book)
    {
        $book->load(['category']);

        $categories = Category::all();

        return view('book.edit', compact('book', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(BookRequest $request, Book $book)
    {
        $data = $request->all();

        $data['slug'] = Str::slug($data['title']) . '-' . Str::lower(Str::random(5));
        $book->update($data);

        return redirect()->route('book.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Book $book)
    {
        $book->delete();

        return redirect()->route('book.index');
    }
}
