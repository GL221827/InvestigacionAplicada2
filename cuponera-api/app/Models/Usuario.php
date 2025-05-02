<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
/**
 * Class Usuario
 * 
 * @property int $id_Usuario
 * @property string $nombre
 * @property string $apellido
 * @property string $telefono
 * @property string $correo
 * @property string $direccion
 * @property string $DUI
 * @property string $contra
 * @property int $id_tipo_usuario
 * @property string|null $codigo_verificacion
 * @property bool|null $verificado
 *
 * @package App\Models
 */
class Usuario extends Authenticatable
{
	use HasApiTokens, Notifiable;

	protected $table = 'usuario';
	protected $primaryKey = 'id_Usuario';
	public $timestamps = false;

	protected $casts = [
		'id_tipo_usuario' => 'int',
		'verificado' => 'bool'
	];

	protected $fillable = [
		'nombre',
		'apellido',
		'telefono',
		'correo',
		'direccion',
		'DUI',
		'contra',
		'id_tipo_usuario',
		'codigo_verificacion',
		'verificado'
	];

	protected $hidden = [
        'contra',
      
    ];

	  // Nombre de la columna para autenticación (por defecto es "email", aquí usamos "correo")
	  public function getAuthIdentifierName()
	  {
		  return 'correo';
	  }

	public function getAuthPassword()
    {
        return $this->contra;
    }
}
