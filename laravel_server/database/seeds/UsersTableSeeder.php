<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Models\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
                        'name' => 'Amit Gwachha',
                        'email' => 'gwachhamit@gmail.com',
                        'password' => bcrypt('secret'),
                        'type' => 'super_admin',
                        'is_verified' => 1,
                        ]);

        $role = Role::where('name','=','super_admin')->first();
        $user->assignRole($role);
    }
}
