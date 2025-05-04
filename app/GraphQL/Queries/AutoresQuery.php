<?php

declare(strict_types=1);

namespace App\GraphQL\Queries;

use App\Models\Autor;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Query;

class AutoresQuery extends Query
{
    protected $attributes = [
        'name' => 'autores',
    ];

    public function type(): Type
    {
        return Type::listOf(GraphQL::type('Autor'));
    }

    public function resolve($root, $args)
    {
        if (isset($args['id'])) {
            return Autor::with('libros')->where('id', $args['id'])->get();
        }
    
        return Autor::with('libros')->get();
    }
    public function args(): array
    {
        return [
            'id' => [
                'type' => Type::int(),
                'description' => 'ID del autor',
            ],
        ];
    }
}