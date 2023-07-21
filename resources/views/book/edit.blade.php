<x-app-layout>
  <x-slot name="title">Admin</x-slot>
  <x-slot name="header">
    <h2 class="text-xl font-semibold leading-tight text-gray-800">
      <a href="#!" onclick="window.history.go(-1); return false;">
        ←
      </a>
      {!! __('Book &raquo; Sunting &raquo; #') . $book->id . ' &middot; ' . $book->name !!}
    </h2>
  </x-slot>

  <div class="py-12">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div>
        @if ($errors->any())
          <div class="mb-5" role="alert">
            <div class="px-4 py-2 font-bold text-white bg-red-500 rounded-t">
              Ada kesalahan!
            </div>
            <div class="px-4 py-3 text-red-700 bg-red-100 border border-t-0 border-red-400 rounded-b">
              <p>
              <ul>
                @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
                @endforeach
              </ul>
              </p>
            </div>
          </div>
        @endif
        <form class="w-full" action="{{ route('book.update', $book->id) }}" method="post"
              enctype="multipart/form-data">
          @csrf
          @method('put')
            <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
             <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                Judul*
              </label>
              <input value="{{ old('title') ?? $book->title}}" name="title"
                     class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                     id="grid-last-name" type="text" placeholder="Nama" required>
              <div class="mt-2 text-sm text-gray-500">
               Judul Buku. Wajib diisi. Maksimal 255 karakter.
              </div>
            </div>
          </div>
          <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
            <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                Kategori*
              </label>
              <select name="category_id"  class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500" required>
               <option value="{{ $book->category->id }}">Tidak Diubah({{ $book->category->name }})</option>
                <option disabled>-------------------</option>
                @foreach ($categories as $category)
                    <option value="{{ $category -> id }}" {{ old('category_id') ==  $category->id ? 'selected' : ''}}>
                        {{ $category -> title }}
                    </option>
                @endforeach
              </select>
              <div class="mt-2 text-sm text-gray-500">
                Kategori Buku. Contoh: Fiksi. Wajib Diisi
              </div>
            </div>
          </div>
          <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
            <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                Deskripsi*
              </label>
              <input value="{{ old('description') ?? $book->description}}" name="description"
                     class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                     id="grid-last-name" type="text">
              <div class="mt-2 text-sm text-gray-500">
                Deskripsi Buku. Wajib diisi. Pisahkan dengan koma (,), Opsional
              </div>
            </div>
          </div>
          <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
            <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                Jumlah Buku*
              </label>
              <input value="{{ old('total_books') ?? $book->total_books }}" name="total_books"
                     class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                     id="grid-last-name" type="number">
              <div class="mt-2 text-sm text-gray-500">
                Jumblah Buku. Wajib diisi.
              </div>
            </div>
          </div>
          <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
            <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                Foto*
              </label>
              <input value="{{ old('cover') }}" name="cover"
                     class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                     id="grid-last-name" accept="image/png, image/jpeg, image/jpg, image/webp" type="file">
              <div class="mt-2 text-sm text-gray-500">
                Foto Item. Lebih dari satu foto dapat diupload. Opsional
              </div>
            </div>
          </div>
           <div class="flex flex-wrap px-3 mt-4 mb-6 -mx-3">
            <div class="w-full">
              <label class="block mb-2 text-xs font-bold tracking-wide text-gray-700 uppercase" for="grid-last-name">
                File Buku*
              </label>
              <input value="{{ old('file') }}" name="file"
                     class="block w-full px-4 py-3 leading-tight text-gray-700 bg-gray-200 border border-gray-200 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                     id="grid-last-name" accept="pdf" type="file">
              <div class="mt-2 text-sm text-gray-500">
                File Buku. Lebih dari satu foto dapat diupload. Opsional
              </div>
            </div>
          </div>

          <div class="flex flex-wrap mb-6 -mx-3">
            <div class="w-full px-3 text-right">
              <button type="submit"
                      class="px-4 py-2 font-bold text-white bg-green-500 rounded shadow-lg hover:bg-green-700">
                Simpan Buku
              </button>
            </div>
          </div>
        <div></div>
        </form>
      </div>
    </div>
  </div>
</x-app-layout>
