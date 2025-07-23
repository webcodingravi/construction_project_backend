<?php

namespace Database\Seeders;

use App\Models\About;
use App\Models\HomeBanner;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Ravi kumar',
        //     'email' => 'ravi@gmail.com',
        // ]);

        About::factory(1)->create();
        HomeBanner::factory(1)->create();
    }
}