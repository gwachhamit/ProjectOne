<?php

use Illuminate\Database\Seeder;
use App\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = [
        	[
                'name' => 'list_user',
                'guard_name' => 'api',
        	],
        	[
                'name' => 'create_user',
                'guard_name' => 'api',
        	],
        	[
                'name' => 'edit_user',
                'guard_name' => 'api',
            ],
            [
                'name' => 'show_user',
                'guard_name' => 'api',
        	],
        	[
                'name' => 'delete_user',
                'guard_name' => 'api',
        	],
            [
                'name' => 'list_role',
                'guard_name' => 'api',
            ],
            [
                'name' => 'create_role',
                'guard_name' => 'api',
            ],
            [
                'name' => 'edit_role',
                'guard_name' => 'api',
            ],
            [
                'name' => 'show_role',
                'guard_name' => 'api',
            ],
            [
                'name' => 'delete_role',
                'guard_name' => 'api',
            ],
            [
                'name' => 'list_permission',
                'guard_name' => 'api',
            ],
            [
                'name' => 'create_permission',
                'guard_name' => 'api',
            ],
            [
                'name' => 'edit_permission',
                'guard_name' => 'api',
            ],
            [
                'name' => 'show_permission',
                'guard_name' => 'api',
            ],
            [
                'name' => 'delete_permission',
                'guard_name' => 'api',
            ],
        ];

        Permission::insert($permissions);
    }
}
