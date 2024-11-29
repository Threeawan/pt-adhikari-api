<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Peminjaman;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PeminjamanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $dataPeminjaman = Peminjaman::orderBy('id','asc')->get();
        return response()->json([
            'status'=>true,
            'message'=>'Data ditemukan',
            'data'=>$dataPeminjaman
        ],400);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'nama_peminjam'=>'required',
            'tanggal_pengembalian'=>'required',
            'tanggal_peminjaman'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        $dataPeminjaman = [
            'nama_peminjam'=>$request->input('nama_peminjam'),
            'tanggal_peminjaman'=>$request->input('tanggal_peminjaman'),
            'tanggal_pengembalian'=>$request->input('tanggal_pengembalian')
        ];

        Peminjaman::create($dataPeminjaman);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil disimpan',
            'data'=>$dataPeminjaman
        ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $dataPeminjaman = Peminjaman::find($id);
        if($dataPeminjaman){
            return response()->json([
                'status'=>true,
                'message'=>'Data ditemukan',
                'data'=>$dataPeminjaman
            ],400);
        }else{
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan'
            ],404);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $dataPeminjaman = Peminjaman::find($id);
        if(empty($dataPeminjaman)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan'
            ],404);
        }

        $rules = [
            'nama_peminjam'=>'required',
            'tanggal_pengembalian'=>'required',
            'tanggal_peminjaman'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        $dataPeminjaman = [
            'nama_peminjam'=>$request->input('nama_peminjam'),
            'tanggal_peminjaman'=>$request->input('tanggal_peminjaman'),
            'tanggal_pengembalian'=>$request->input('tanggal_pengembalian')
        ];

        Peminjaman::where('id',$id)->update($dataPeminjaman);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil diubah',
            'data'=>$dataPeminjaman
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dataPeminjaman = Peminjaman::find($id);
        if(empty($dataPeminjaman)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan'
            ],404);
        }

        
        Peminjaman::where('id',$id)->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus',
        ],200);
    }
}
