<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pago
 * 
 * @property int $id_pagos_empresas
 * @property int $empresa_id
 * @property float $monto
 * @property Carbon|null $fecha_pago
 *
 * @package App\Models
 */
class Pago extends Model
{
	protected $table = 'pagos';
	protected $primaryKey = 'id_pagos_empresas';
	public $timestamps = false;

	protected $casts = [
		'empresa_id' => 'int',
		'monto' => 'float',
		'fecha_pago' => 'datetime'
	];

	protected $fillable = [
		'empresa_id',
		'monto',
		'fecha_pago'
	];
}
