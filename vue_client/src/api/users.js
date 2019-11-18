import session from './session';

export default {
  getUsers() {
    return session.get('api/users');
  },
  getUserDetail(id) {
    return session.get('api/users/'+id);
  },
  createUser(name, email, password, confirm_password, role) {
    return session.post('/api/users/create', {name, email, password, confirm_password, role});
  },
  updateUser(id, name, email, password, confirm_password, role) {
    return session.put('/api/users/'+id+'/update', {name, email, password, confirm_password, role});
  },
  deleteUser(id) {
    return session.delete('/api/users/'+id+'/delete');
  },
  getRoleList(){
    return session.get('/api/roles');
  }
};
