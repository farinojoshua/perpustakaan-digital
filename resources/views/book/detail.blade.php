<x-app-layout>
  <x-slot name="title">Admin</x-slot>
  <x-slot name="header">
    <h2 class="text-xl font-semibold leading-tight text-gray-800">
      <a href="#!" onclick="window.history.go(-1); return false;">
        ←
      </a>
      {!! __('Book &raquo; Detail') !!}
    </h2>
  </x-slot>

    <div class="py-12">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div>
        <img src="{{ asset('storage/' . $book->cover) }}" alt="cover" class="w-20">
        <h1 class="mt-4 text-2xl font-semibold leading-tight text-gray-800">
          {{ $book->title }}
        </h1>
        <p class="mt-2 text-sm text-gray-500">
          {{ $book->category->name }}
        </p>
        <p class="mt-4 text-sm text-gray-500">
          {{ $book->description }}
        </p>
        <p class="mt-3 text-sm text-gray-500">
          Total Book : {{ $book->total_books }}
        </p>
        {{-- download button --}}
        <div class="mt-4">
            <a href="{{ asset('storage/' . $book->file) }}"
               class="px-4 py-2 font-bold text-white bg-blue-500 rounded shadow-lg hover:bg-green-700">
              Download
            </a>
            <a href="{{ route('book.edit', $book->id) }}"
               class="px-4 py-2 ml-4 font-bold text-white bg-gray-500 rounded shadow-lg hover:bg-green-700">
              Edit
            </a>
        </div>

      </div>
    </div>
  </div>

</x-app-layout>
