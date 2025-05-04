<?php
//Controlador encargado de la gestión de cupones (consulta y canje)
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cupon;

class CuponesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     //Muestra la información de un cupón según su código.
    public function show($codigo)
    {
        // GET /api/cupon/{codigo} para poder obtener la info del cupon
        $cupon = Cupon::where('codigo_cupon', $codigo)->first();

        if (!$cupon) {
            return response()->json(['error' => 'Cupón no encontrado'], 404);
        }

        return response()->json($cupon);
    }



    //Canjea un cupón si no ha sido usado y no está vencido
    // PUT /api/cupon/{codigo}/canjear
    public function canjear($codigo)
    {
        $cupon = Cupon::where('codigo_cupon', $codigo)->first();

        if (!$cupon) {
            return response()->json(['error' => 'Cupón no encontrado'], 404);
        }

        if ($cupon->estado === 'canjeado') {
            return response()->json(['error' => 'El cupón ya fue canjeado'], 400);
        }

        if ($cupon->estado === 'vencido') {
            return response()->json(['error' => 'El cupón está vencido'], 400);
        }

        $cupon->estado = 'canjeado';
        $cupon->save();

        return response()->json(['mensaje' => 'Cupón canjeado exitosamente']);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
