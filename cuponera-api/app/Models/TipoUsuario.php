<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoUsuario
 * 
 * @property int $id_tipo_usuario
 * @property string $tipo_usuario
 *
 * @package App\Models
 */
class TipoUsuario extends Model
{
	protected $table = 'tipo_usuarios';
	protected $primaryKey = 'id_tipo_usuario';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_tipo_usuario' => 'int'
	];

	protected $fillable = [
		'tipo_usuario'
	];
}
