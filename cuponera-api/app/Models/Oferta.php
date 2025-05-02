<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Oferta
 * 
 * @property int $id_Ofertas
 * @property int $empresa_id
 * @property string $titulo
 * @property float $precio_regular
 * @property float $precio_oferta
 * @property Carbon $fecha_inicio
 * @property Carbon $fecha_fin
 * @property Carbon $fecha_limite_uso
 * @property int|null $cantidad_limite
 * @property string $descripcion
 * @property string|null $detalles
 * @property string $estado
 * @property string|null $justificacion_rechazo
 *
 * @package App\Models
 */
class Oferta extends Model
{
	protected $table = 'ofertas';
	protected $primaryKey = 'id_Ofertas';
	public $timestamps = false;

	protected $casts = [
		'empresa_id' => 'int',
		'precio_regular' => 'float',
		'precio_oferta' => 'float',
		'fecha_inicio' => 'datetime',
		'fecha_fin' => 'datetime',
		'fecha_limite_uso' => 'datetime',
		'cantidad_limite' => 'int'
	];

	protected $fillable = [
		'empresa_id',
		'titulo',
		'precio_regular',
		'precio_oferta',
		'fecha_inicio',
		'fecha_fin',
		'fecha_limite_uso',
		'cantidad_limite',
		'descripcion',
		'detalles',
		'estado',
		'justificacion_rechazo'
	];
}
