<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Empresa
 * 
 * @property int $id_Empresa
 * @property string $codigo_empresa
 * @property string $nombre_empresa
 * @property string $direccion_empresa
 * @property string $nombre_contacto
 * @property string $telefono
 * @property string $correo_empresa
 * @property string $rubro
 * @property float $porcentaje_comision
 * @property int $usuario_id
 *
 * @package App\Models
 */
class Empresa extends Model
{
	protected $table = 'empresas';
	protected $primaryKey = 'id_Empresa';
	public $timestamps = false;

	protected $casts = [
		'porcentaje_comision' => 'float',
		'usuario_id' => 'int'
	];

	protected $fillable = [
		'codigo_empresa',
		'nombre_empresa',
		'direccion_empresa',
		'nombre_contacto',
		'telefono',
		'correo_empresa',
		'rubro',
		'porcentaje_comision',
		'usuario_id'
	];
}
