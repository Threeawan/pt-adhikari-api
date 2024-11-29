<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PegawaiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Pegawai::query();

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
            'no_telepon'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        
        $dataPegawai = [
            'nama'=>$request->input('nama'),
            'alamat'=>$request->input('alamat'),
            'no_telepon'=>$request->input('no_telepon')
        ];

        Pegawai::create($dataPegawai);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil disimpan',
            'data'=>$dataPegawai
        ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $dataPegawai = Pegawai::find($id);
        if($dataPegawai){
            return response()->json([
                'status'=>true,
                'message'=>'Data ditemukan',
                'data'=>$dataPegawai
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
        $dataPegawai = Pegawai::find($id);
        if(empty($dataPegawai)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',
            ],404);
        }

        $rules = [
            'nama'=>'required',
            'alamat'=>'required',
            'no_telepon'=>'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'message'=>'Gagal disimpan',
                'data'=>$validator->errors()
            ]);
        }

        
        $dataPegawai = [
            'nama'=>$request->input('nama'),
            'alamat'=>$request->input('alamat'),
            'no_telepon'=>$request->input('no_telepon')
        ];

        Pegawai::where('id',$id)->update($dataPegawai);
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil diubah',
            'data'=>$dataPegawai
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dataPegawai = Pegawai::find($id);
        if(empty($dataPegawai)){
            return response()->json([
                'status'=>false,
                'message'=>'Data tidak ditemukan',
            ],404);
        }

        Pegawai::where('id',$id)->delete();
        return response()->json([
            'status'=>true,
            'message'=>'Data berhasil dihapus',
        ],200);
    }
}
