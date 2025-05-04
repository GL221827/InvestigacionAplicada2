<?php

declare(strict_types=1);

namespace App\GraphQL\Types;

use App\Models\Autor;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;

class AutorType extends GraphQLType
{
    protected $attributes = [
        'name' => 'Autor',
        'description' => 'Un autor de libros',
        'model' => Autor::class,
    ];
    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::nonNull(Type::int()),
            ],
            'nombre' => [
                'type' => Type::string(),
            ],
            'nacionalidad' => [
                'type' => Type::string(),
            ],
            'libros' => [
                'type' => Type::listOf(\Rebing\GraphQL\Support\Facades\GraphQL::type('Libro')),
                'resolve' => fn($root) => $root->libros,
            ],
        ];
    }
}