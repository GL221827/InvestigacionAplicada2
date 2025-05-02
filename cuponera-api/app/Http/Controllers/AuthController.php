<?php
// Controlador encargado del registro y autenticación de usuarios
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Usuario;

class AuthController extends Controller
{
    //registra un nuevo usuario en la base
    public function register(Request $request)
    {  //
    // Validar datos del formulario
    $validator = Validator::make($request->all(), [
        'nombre' => 'required|string|max:50',
        'apellido' => 'required|string|max:50',
        'telefono' => 'required|string|min:8', 
        'correo' => 'required|email|unique:usuario,correo',
        'direccion' => 'required|string|max:50',
        'DUI' => 'required|string|max:50',
        'contra' => 'required|string|min:6',
        'id_tipo_usuario' => 'int',
      'verificado' => 'boolean'
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    $usuario = Usuario::create([
        'nombre' => $request->nombre,
    'apellido' => $request->apellido,
    'telefono' => $request->telefono,
    'correo' => $request->correo,
    'direccion' => $request->direccion,
    'DUI' => $request->DUI,
    'contra' => bcrypt($request->contra),
    'id_tipo_usuario' => $request->id_tipo_usuario,
    'verificado' => 0
    ]);

    $token = $usuario->createToken('api-token')->plainTextToken;

    return response()->json([
        'message' => 'Usuario registrado exitosamente.',
        'token' => $token,
    ], 201);
    }


    // Autentica un usuario y devuelve un token de acceso
    public function login(Request $request)
    {
        $request->validate([
            'correo' => 'required|email',
            'contra' => 'required'
        ]);

        $usuario = Usuario::where('correo', $request->correo)->first();

        // Verifica existencia
        if (!$usuario || !Hash::check($request->contra, $usuario->contra)) {
            throw ValidationException::withMessages([
                'correo' => ['Las credenciales son incorrectas.'],
            ]);
        }

        // Crea el token de acceso
        $token = $usuario->createToken('api-token')->plainTextToken;

        return response()->json([
            'message' => 'Sesión iniciada exitosamente',
            'token' => $token
           
        ]);
    }

    // Cierre de sesión
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Sesión cerrada.']);
    }
}
