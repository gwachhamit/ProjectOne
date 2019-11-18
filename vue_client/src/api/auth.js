import session from './session';

export default {
  login(username, password) {
    return session.post('api/login', { username:username, password:password });
  },
  logout() {
    return session.post('api/logout', {});
  },
  getAccountDetails() {
    return session.get('api/profile');
  },
};
