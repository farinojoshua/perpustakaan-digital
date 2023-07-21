<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;

class DetailBookController extends Controller
{
    // function for detail book by id
    public function index($id)
    {
        $book = Book::findOrFail($id);
        return view('book.detail', compact('book'));
    }
}
