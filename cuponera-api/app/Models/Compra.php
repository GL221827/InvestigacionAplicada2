<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Compra
 * 
 * @property int $id_Compra
 * @property int $usuario_id
 * @property int $oferta_id
 * @property int $cantidad
 * @property Carbon|null $fecha_compra
 *
 * @package App\Models
 */
class Compra extends Model
{
	protected $table = 'compras';
	protected $primaryKey = 'id_Compra';
	public $timestamps = false;

	protected $casts = [
		'usuario_id' => 'int',
		'oferta_id' => 'int',
		'cantidad' => 'int',
		'fecha_compra' => 'datetime'
	];

	protected $fillable = [
		'usuario_id',
		'oferta_id',
		'cantidad',
		'fecha_compra'
	];
}
