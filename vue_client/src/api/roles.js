import session from './session';

export default {
  getRoles() {
    return session.get('api/roles');
  },
  getRoleDetail(id) {
    return session.get('api/roles/'+id);
  },
  createRole(name, permissions) {
    return session.post('api/roles/create', {name, permissions});
  },
  updateRole(id, name, permissions) {
    return session.patch('api/roles/'+id+'/update', {name, permissions});
  },
  deleteRole(id) {
    return session.delete('api/roles/'+id+'/delete');
  },
  getPermissionList() {
    return session.get('api/permissions');
  },
};
