<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Message>
 */
class MessageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => 'Jay Smith',
            'email' => 'customer@mail.com',
            'subject' => 'Subject of message',
            'description' => 'Description of message',
            'status' => '0'
        ];
    }
}
