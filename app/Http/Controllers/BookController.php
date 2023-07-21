<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Requests\BookRequest;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
        $query = Book::with(['category']);
        // user only can see their own book data by author_id
        if (auth()->user()->roles == 'user') {
            $query->where('author_id', auth()->user()->id);
        }

        return DataTables::of($query)
            ->editColumn('cover', function ($book) {
                // image not load
                return '<img src="'. asset('storage/' . $book->cover) .'" alt="cover" class="w-20 mx-auto rounded-md">';
                // return '<img src="'. $book->cover .'" alt="cover" class="w-20 mx-auto rounded-md">';
            })
            ->editColumn('file', function ($book) {
                return '<a href="'. asset('storage/' . $book->file) .'" target="_blank" class="block w-full px-2 py-1 mb-1 text-xs text-center text-white transition duration-500 bg-blue-500 border border-blue-500 rounded-md select-none ease hover:bg-blue-600 focus:outline-none focus:shadow-outline">
                    Download
                </a>';
            })
            ->addColumn('action', function ($book) {
                return '
                    <a class="block w-full px-2 py-1 mb-1 text-xs text-center text-white transition duration-500 bg-gray-700 border border-gray-700 rounded-md select-none ease hover:bg-gray-800 focus:outline-none focus:shadow-outline"
                        href="' . route('book.edit', $book->id) . '">
                        Sunting
                    </a>
                    <a class="block w-full px-2 py-1 mb-1 text-xs text-center text-white transition duration-500 bg-blue-600 border border-gray-700 rounded-md select-none ease hover:bg-gray-800 focus:outline-none focus:shadow-outline"
                        href="' . route('book.detail', $book->id) . '">
                        Detail
                    </a>
                    <form class="block w-full" onsubmit="return confirm(\'Apakah anda yakin?\');" -block" action="' . route('book.destroy', $book->id) . '" method="POST">
                    <button class="w-full px-2 py-1 text-xs text-white transition duration-500 bg-red-500 border border-red-500 rounded-md select-none ease hover:bg-red-600 focus:outline-none focus:shadow-outline" >
                        Hapus
                    </button>
                        ' . method_field('delete') . csrf_field() . '
                    </form>';
            })
            ->rawColumns(['action', 'cover', 'file'])
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

        // store image to storage
        $data['cover'] = $request->file('cover')->store(
            'assets/covers',
            'public'
        );

        // make condition if image not load return default image from placeholder.com
        if (!$data['cover']) {
            $data['cover'] = 'https://via.placeholder.com/550';
        }

        $data['file'] = $request->file('file')->storeAs(
            'assets/files',
            $data['title'] . '.' . $request->file('file')->extension(),
            'public'
        );

        // author id from user id
        $data['author_id'] = auth()->user()->id;

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

        // if user want to update image
        if ($request->file('cover')) {
            // delete old image
            Storage::disk('public')->delete($book->cover);

            // store new image
            $data['cover'] = $request->file('cover')->store(
                'assets/covers',
                'public'
            );
        }

        // if user want to update pdf file
        if ($request->file('file')) {
            // delete old pdf file
            Storage::disk('public')->delete($book->file);

            // store new pdf file
            $data['file'] = $request->file('file')->store(
                'assets/files',
                'public'
            );
        }


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
