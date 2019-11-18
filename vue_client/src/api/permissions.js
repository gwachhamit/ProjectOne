import session from './session';

export default {
  getPermissions() {
    return session.get('api/permissions');
  },
  getPermissionDetail(id) {
    return session.get('api/permissions/'+id);
  },
  createPermission(name) {
    return session.post('api/permissions/create', {name});
  },
  updatePermission(id, name) {
    return session.patch('api/permissions/'+id+'/update', {name});
  },
  deletePermission(id) {
    return session.delete('api/permissions/'+id+'/delete');
  },
};
