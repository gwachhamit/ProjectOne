<?php

use Illuminate\Database\Seeder;
use App\Models\Role;
use App\Models\Permission;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = [
            ['name' => 'super_admin', 'guard_name' => 'api',],
            ['name' => 'admin', 'guard_name' => 'api',],
            ['name' => 'customer', 'guard_name' => 'api',],
        ];

        Role::insert($roles);
        $permissions = Permission::all();
        $super_admin = Role::where('name','=','super_admin')->first();
        $super_admin->givePermissionTo($permissions);
    }
}
