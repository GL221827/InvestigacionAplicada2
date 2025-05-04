<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Cupon
 * 
 * @property int $id_cupon
 * @property string $codigo_cupon
 * @property int $id_oferta
 * @property int $id_usuario
 * @property Carbon $fecha_generacion
 * @property string|null $estado
 *
 * @package App\Models
 */
class Cupon extends Model
{
	protected $table = 'cupones';
	protected $primaryKey = 'id_cupon';
	public $timestamps = false;

	protected $casts = [
		'id_oferta' => 'int',
		'id_usuario' => 'int',
		'fecha_generacion' => 'datetime'
	];

	protected $fillable = [
		'codigo_cupon',
		'id_oferta',
		'id_usuario',
		'fecha_generacion',
		'estado'
	];
}
