<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DateTime;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'Phan Tấn Tài',
                'email' => 'ptai0866@gmail.com',
                'password' => Hash::make('123456'),
                'phone' => '0344312253',
                'address' => 'Bến Tre',
                'role' => 1,
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'Nguyễn Quang Nam',
                'email' => 'quangnam@gmail.com',
                'password' => Hash::make('123456'),
                'phone' => '0344312254',
                'address' => 'Tiền Giang',
                'role' => 1,
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'Bùi Quốc Việt',
                'email' => 'quocviet@gmail.com',
                'password' => Hash::make('123456'),
                'phone' => '0344312255',
                'address' => 'TP HCM',
                'role' => 0,
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()
            ],
        ]);
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}