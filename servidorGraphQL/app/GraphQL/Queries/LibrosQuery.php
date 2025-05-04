<?php

declare(strict_types=1);

namespace App\GraphQL\Queries;

use App\Models\Libro;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Query;

class LibrosQuery extends Query
{
    protected $attributes = [
        'name' => 'libros',
    ];

    public function type(): Type
    {
        return Type::listOf(GraphQL::type('Libro'));
    }

    public function resolve($root, $args)
    {
        $query = Libro::with('autor');
    
        if (isset($args['id'])) {
            return $query->where('id', $args['id'])->get();
        }
    
        return $query->get();
    }
    public function args(): array
{
    return [
        'id' => [
            'name' => 'id',
            'type' => Type::int(),
        ],
    ];
}

}
