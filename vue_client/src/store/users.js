import users from '../api/users';

export function getUserById (users, id) {
    const index = users.findIndex(
      user => user.id === id
    )
    let user = null
    if (index !== -1) {
      user = users[index]
    }
  
    return {
      index,
      user,
    }
}

const SET_USERS ='SET_USERS'
const USER_LOADING ='USER_LOADING'
const REMOVE_USER_BY_ID = 'REMOVE_USER_BY_ID'
const SET_USER_DETAIL = 'SET_USER_DETAIL'
const SET_ROLE_LIST = 'SET_ROLE_LIST'
const SET_SEARCH_TEXT ='SET_SEARCH_TEXT'
const SET_PERMISSION_DENIED = 'SET_PERMISSION_DENIED'
const RESET_PERMISSION_DENIED = 'RESET_PERMISSION_DENIED'

const initialState = {
  users: [],
  searchText: '',
  userLoading: false,
  userDetail:{},
  roleList:[],
  permissionDenied: false,
};

const getters = {
    users: state => {
        if (state.searchText) {
          const reg = new RegExp(state.searchText.trim().toLowerCase().replace(/\s+/g, '|'))
          return state.users.filter(
            user => user.first_name.toLowerCase().search(reg) !== -1
          )
        } else {
          return state.users
        }
    },

    userDetail: state => {
        return state.userDetail
    },

    roleList: state => {
        return state.roleList
    },
    searchText: state => state.searchText,
    permissionDenied: state => state.permissionDenied,
};

const actions = {
    fetchUsers({ commit }) {
        return users.getUsers()
            .then(({ data }) => {
                commit(SET_USERS,data)
            })
            .catch((error) => {
              if(error.response.status === 403){
                commit(SET_PERMISSION_DENIED)
              }
              return Promise.reject(error.response.data);
            }
        );
    },

    fetchUserDetail({ commit }, {id}) {
        return users.getUserDetail(id)
            .then(({ data }) => {
                commit(SET_USER_DETAIL,data)
                return Promise.resolve(data);
            })
            .catch((error) => {
                return Promise.reject(error.response.data);
            }
        );
    },

    fetchRoleList({ commit }) {
        return users.getRoleList()
        .then(({data}) => {
            commit(SET_ROLE_LIST,data)
        })
        .catch((error) => {
            return Promise.reject(error.response.data);
        })
    },

    createUser({ commit }, { name, email, password, confirm_password, role }) {
        commit(USER_LOADING, true)
        return new Promise((resolve, reject) => {
          users.createUser(name, email, password, confirm_password, role)
          .then((res) => {
            commit(USER_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(USER_LOADING, false)
            reject(error.response)
          });
        })
    },

    updateUser({ commit }, {id, name, email, password, confirm_password, role}) {
        commit(USER_LOADING, true)
        return new Promise((resolve, reject) => {
          users.updateUser(id, name, email, password, confirm_password, role)
          .then((res) => {
            commit(USER_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(USER_LOADING, false)
            reject(error.response)
          });
        })
    },

    deleteUser({ commit }, { id }) {
        commit(USER_LOADING, true)
        return new Promise((resolve, reject) => {
          users.deleteUser(id)
          .then((res) => {
            commit(USER_LOADING, false)
            commit(REMOVE_USER_BY_ID,id)
            resolve(res)
          })
          .catch((error) => {
            commit(USER_LOADING, false)
            reject(error.response)
          });
        })
    },

    setSearchText ({ commit }, value) {
      commit(SET_SEARCH_TEXT, value)
    },
    resetPermissionDenied ({ commit }) {
      commit(RESET_PERMISSION_DENIED)
    },
};

const mutations = {
  [SET_USERS](state, users) {
    state.users = users;
  },
  [USER_LOADING](state, value) {
    state.userLoading = value;
  },
  [REMOVE_USER_BY_ID](state,value){
    const { index } = getUserById(state.users, value)
    if (index !== -1) {
        state.users.splice(index, 1)
    }
  },
  [SET_USER_DETAIL](state, value) {
    state.userDetail = value;
  },
  [SET_ROLE_LIST](state, value) {
    state.roleList = value;
  },
  [SET_SEARCH_TEXT](state, value) {
    state.searchText = value;
  },
  [SET_PERMISSION_DENIED](state) {
    state.permissionDenied = true;
  },
  [RESET_PERMISSION_DENIED](state) {
    state.permissionDenied = false;
  },
};

export default {
  namespaced: true,
  state: initialState,
  getters,
  actions,
  mutations,
};
