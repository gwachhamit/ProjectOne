import roles from '../api/roles';

export function getRoleById (roles, id) {
    const index = roles.findIndex(
      roles => roles.id === id
    )
    let role = null
    if (index !== -1) {
        role = roles[index]
    }
  
    return {
      index,
      role,
    }
}

const SET_ROLES ='SET_ROLES'
const ROLE_LOADING ='ROLE_LOADING'
const REMOVE_ROLE_BY_ID = 'REMOVE_ROLE_BY_ID'
const SET_ROLE_DETAIL = 'SET_ROLE_DETAIL'
const SET_PERMISSIONS ='SET_PERMISSIONS'
const SET_PERMISSION_DENIED = 'SET_PERMISSION_DENIED'
const RESET_PERMISSION_DENIED = 'RESET_PERMISSION_DENIED'

const initialState = {
  roles: [],
  roleLoading: false,
  roleDetail:{},
  permissions:[],
  permissionDenied: false,
};

const getters = {
    roles: state => {
          return state.roles
    },

    roleDetail: state => {
        return state.roleDetail
    },

    permissions: state => {
      return state.permissions
    },
    searchText: state => state.searchText,
    permissionDenied: state => state.permissionDenied,
};

const actions = {
    fetchRoles({ commit }) {
        return roles.getRoles()
            .then(({ data }) => {
                commit(SET_ROLES,data)
            })
            .catch((error) => {
              if(error.response.status === 403){
                commit(SET_PERMISSION_DENIED)
              }
              return Promise.reject(error.response.data);
            }
        );
    },

    fetchRoleDetail({ commit }, {id}) {
        return roles.getRoleDetail(id)
            .then(({ data }) => {
                commit(SET_ROLE_DETAIL,data)
                return Promise.resolve(data);
            })
            .catch((error) => {
                return Promise.reject(error.response.data);
            }
        );
    },

    fetchPermissions({ commit }) {
      return roles.getPermissionList()
          .then(({ data }) => {
              commit(SET_PERMISSIONS,data)
          })
          .catch((error) => {
              return Promise.reject(error.response.data);
          }
      );
    },

    createRole({ commit }, { name, permissions }) {
        commit(ROLE_LOADING, true)
        return new Promise((resolve, reject) => {
            roles.createRole(name, permissions)
          .then((res) => {
            commit(ROLE_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(ROLE_LOADING, false)
            reject(error.response)
          });
        })
    },

    updateRole({ commit }, {id, name, permissions}) {
        commit(ROLE_LOADING, true)
        return new Promise((resolve, reject) => {
            roles.updateRole(id, name, permissions)
          .then((res) => {
            commit(ROLE_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(ROLE_LOADING, false)
            reject(error.response)
          });
        })
    },

    deleteRole({ commit }, { id }) {
        commit(ROLE_LOADING, true)
        return new Promise((resolve, reject) => {
            roles.deleteRole(id)
          .then((res) => {
            commit(ROLE_LOADING, false)
            commit(REMOVE_ROLE_BY_ID,id)
            resolve(res.data)
          })
          .catch((error) => {
            commit(ROLE_LOADING, false)
            reject(error.response)
          });
        })
    },
    resetPermissionDenied ({ commit }) {
      commit(RESET_PERMISSION_DENIED)
    },
};

const mutations = {
  [SET_ROLES](state, roles) {
    state.roles = roles;
  },
  [ROLE_LOADING](state, value) {
    state.roleLoading = value;
  },
  [REMOVE_ROLE_BY_ID](state,value){
    const { index } = getRoleById(state.roles, value)

    if (index !== -1) {
        state.roles.splice(index, 1)
    }
  },
  [SET_ROLE_DETAIL](state, value) {
    state.roleDetail = value;
  },
  [SET_PERMISSIONS](state, value) {
    state.permissions = value;
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
