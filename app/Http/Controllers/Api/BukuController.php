<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Buku;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BukuController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Buku::query();

        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->input('search') . '%');
        }
    
        $data = $query->paginate(10);

            return response()->json([
            'status'=>true,
            'message'=>'Data ditemukan',
            'data'=>$data
        ],400);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'judul'=>'required',
            'pengarang'=>'required',
            'tanggal_publikasi'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Data gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        $dataBuku = [
            'judul'=>$request->input('judul'),
            'pengarang'=>$request->input('pengarang'),
            'tanggal_publikasi'=>$request->input('tanggal_publikasi'),
        ];

        Buku::create($dataBuku);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil disimpan',
            'data'=>$dataBuku
        ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $dataBuku = Buku::find($id);
        if($dataBuku){
            return response()->json([
                'status'=>true,
                'message'=>'Data ditemukan',
                'data'=>$dataBuku
            ],400);
        }else{
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',
            ],404);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $dataBuku = Buku::find($id);
        if(empty($dataBuku)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',

            ],404);
        }

        $rules = [
            'judul'=>'required',
            'pengarang'=>'required',
            'tanggal_publikasi'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Data gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        $dataBuku = [
            'judul'=>$request->input('judul'),
            'pengarang'=>$request->input('pengarang'),
            'tanggal_publikasi'=>$request->input('tanggal_publikasi'),
        ];

        Buku::where('id',$id)->update($dataBuku);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil diubah',
            'data'=>$dataBuku
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dataBuku = Buku::find($id);
        if(empty($dataBuku)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',

            ],404);
        }

        Buku::where('id',$id)->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus',
        ],200);

    }
}