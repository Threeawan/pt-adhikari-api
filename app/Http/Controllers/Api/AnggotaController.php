<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Anggota;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AnggotaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Anggota::query();

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
            'nama'=>'required',
            'alamat'=>'required',
            'no_telepon'=>'required',
            'tanggal_daftar'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }


        $dataAnggota = [
            'nama'=>$request->input('nama'),
            'alamat'=>$request->input('alamat'),
            'no_telepon'=>$request->input('no_telepon'),
            'tanggal_daftar'=>$request->input('tanggal_daftar')
        ];

        Anggota::create($dataAnggota);
        return response()->json([
            'status'=>true,
            'message'=>'Data Berhasil Disimpan',
            'data'=>$dataAnggota
        ],200);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $dataAnggota = Anggota::find($id);
        if($dataAnggota){
            return response()->json([
                'status'=>true,
                'message'=>'Data ditemukan',
                'data'=>$dataAnggota
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
        $dataAnggota = Anggota::find($id);
        if(empty($dataAnggota)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',
            ],404);
        }

        $rules = [
            'nama'=>'required',
            'alamat'=>'required',
            'no_telepon'=>'required',
            'tanggal_daftar'=>'required'

        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Data gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        $dataAnggota = [
            'nama'=>$request->input('nama'),
            'alamat'=>$request->input('alamat'),
            'no_telepon'=>$request->input('no_telepon'),
            'tanggal_daftar'=>$request->input('tanggal_daftar')

        ];

        Anggota::where('id',$id)->update($dataAnggota);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil diubah',
            'data'=>$dataAnggota
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dataAnggota = Anggota::find($id);
        if(empty($dataAnggota)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',
            ],404);
        }

        Anggota::where('id',$id)->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus',
        ],200);
    }
}
