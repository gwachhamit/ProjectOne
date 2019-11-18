import auth from '@/api/auth';
import session from '@/api/session';
import {
  LOGIN_BEGIN,
  LOGIN_FAILURE,
  LOGIN_SUCCESS,
  LOGOUT,
  REMOVE_TOKEN,
  SET_TOKEN,
  SET_ACCOUNT_DETAIL,
  REMOVE_ACCOUNT_DETAIL,
} from './types';

const TOKEN_STORAGE_KEY = 'TOKEN_STORAGE_KEY';

const initialState = {
  authenticating: false,
  error: null,
  token: null,
  accountDetail: {
    name:null,
    email:null,
  },
};

const getters = {
  isAuthenticated: state => !!state.token,
  accountDetail: state => state.accountDetail,
};

const actions = {
  login({ commit }, { username, password }) {
    commit(LOGIN_BEGIN);
    return auth.login(username, password)
      .then(( {data} ) => { 
        commit(SET_TOKEN, data.access_token)
        commit(LOGIN_SUCCESS)
      })
      .catch((error) => { 
        commit(LOGIN_FAILURE)
        return Promise.reject(error.response.data);
      }
      );
  },
  logout({ commit }) {
    return auth.logout()
      .then(() => commit(LOGOUT))
      .finally(() => {
        commit(REMOVE_TOKEN),
        commit(REMOVE_ACCOUNT_DETAIL)
      });
  },
  initialize({ commit }) {
    const token = localStorage.getItem(TOKEN_STORAGE_KEY);
    
    if (token) {
      commit(SET_TOKEN, token);
    } else {
      commit(REMOVE_TOKEN);
    }
  },
  getAccountDetail({commit}) {
    return auth.getAccountDetails()
    .then((res) => {
      commit (SET_ACCOUNT_DETAIL,res.data)
      return Promise.resolve(res.data)
    })
    .catch((error) => {
      console.log(error)
      // commit(REMOVE_TOKEN),
      // commit(REMOVE_ACCOUNT_DETAIL)
    })
  }
};

const mutations = {
  [LOGIN_BEGIN](state) {
    state.authenticating = true;
    state.error = false;
  },
  [LOGIN_FAILURE](state) {
    state.authenticating = false;
    state.error = true;
  },
  [LOGIN_SUCCESS](state) {
    state.authenticating = false;
    state.error = false;
  },
  [LOGOUT](state) {
    state.authenticating = false;
    state.error = false;
  },
  [SET_TOKEN](state, token) {
    localStorage.setItem(TOKEN_STORAGE_KEY, token);
    session.defaults.headers.Authorization = `Bearer ${token}`;
    state.token = token;
  },
  [REMOVE_TOKEN](state) {
    localStorage.removeItem(TOKEN_STORAGE_KEY);
    delete session.defaults.headers.Authorization;
    state.token = null;
  },
  [SET_ACCOUNT_DETAIL](state, value) {
    state.accountDetail = value;
  },
  [REMOVE_ACCOUNT_DETAIL](state) {
    state.accountDetail = null;
  },
};

export default {
  namespaced: true,
  state: initialState,
  getters,
  actions,
  mutations,
};
