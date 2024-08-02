<?php

namespace Database\Seeders;

use DateTime;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('brands')->insert([
            [
                'name' => 'Vivo',
                'image' => '/asset/img/Vivo.jpg',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'IPhone',
                'image' => '/asset/img/Image/Brand/IPhone.png',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'Oppo',
                'image' => '/asset/img/Image/Brand/Oppo.png',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'Realme',
                'image' => '/asset/img/Image/Brand/Oppo.png',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'SamSung',
                'image' => '/asset/img/Image/Brand/SamSung.jpg',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
            [
                'name' => 'Xiaomi',
                'image' => '/asset/img/Image/Brand/Xiaomi.png',
                'created_at' => new DateTime(),
                'updated_at' => new DateTime()

            ],
        ]);
    }
}