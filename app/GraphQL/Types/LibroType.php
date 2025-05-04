<?php

declare(strict_types=1);

namespace App\GraphQL\Types;

use App\Models\Libro;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;
use GraphQL;

class LibroType extends GraphQLType
{
    protected $attributes = [
        'name' => 'Libro',
        'description' => 'Un libro',
        'model' => Libro::class,
    ];

    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::nonNull(Type::int()),
            ],
            'titulo' => [
                'type' => Type::string(),
            ],
            'autor' => [
                'type' => GraphQL::type('Autor'),
                'resolve' => fn($root) => $root->autor,
            ],
        ];
    }
}