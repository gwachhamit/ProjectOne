import permissions from '../api/permissions';

export function getPermissionById (permissions, id) {
    const index = permissions.findIndex(
        permissions => permissions.id === id
    )
    let permission = null
    if (index !== -1) {
        permission = permissions[index]
    }
  
    return {
      index,
      permission,
    }
}

const SET_PERMISSIONS ='SET_PERMISSIONS'
const PERMISSION_LOADING ='PERMISSION_LOADING'
const REMOVE_PERMISSION_BY_ID = 'REMOVE_PERMISSION_BY_ID'
const SET_PERMISSION_DETAIL = 'SET_PERMISSION_DETAIL'
const SET_PERMISSION_DENIED = 'SET_PERMISSION_DENIED'
const RESET_PERMISSION_DENIED = 'RESET_PERMISSION_DENIED'

const initialState = {
  permissions: [],
  permissionLoading: false,
  permissionDetail:{},
  permissionDenied: false,
};

const getters = {
    permissions: state => {
          return state.permissions
    },

    permissionDetail: state => {
        return state.permissionDetail
    },

    permissionDenied: state => state.permissionDenied,
};

const actions = {
    fetchPermissions({ commit }) {
        return permissions.getPermissions()
            .then(({ data }) => { 
                commit(SET_PERMISSIONS,data)
            })
            .catch((error) => {
              if(error.response.status === 403){
                commit(SET_PERMISSION_DENIED)
              }
              return Promise.reject(error.response.data);
            }
        );
    },

    fetchPermissionDetail({ commit }, {id}) {
        return permissions.getPermissionDetail(id)
            .then(({ data }) => {
                commit(SET_PERMISSION_DETAIL,data)
                return Promise.resolve(data);
            })
            .catch((error) => {
                return Promise.reject(error.response.data);
            }
        );
    },

    createPermission({ commit }, { permission }) {
        commit(PERMISSION_LOADING, true)
        return new Promise((resolve, reject) => {
            permissions.createPermission(permission)
          .then((res) => {
            commit(PERMISSION_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(PERMISSION_LOADING, false)
            reject(error.response)
          });
        })
    },

    updatePermission({ commit }, {id, name}) {
        commit(PERMISSION_LOADING, true)
        return new Promise((resolve, reject) => {
            permissions.updatePermission(id, name)
          .then((res) => {
            commit(PERMISSION_LOADING, false)
            resolve(res.data)
          })
          .catch((error) => {
            commit(PERMISSION_LOADING, false)
            reject(error.response)
          });
        })
    },

    deletePermission({ commit }, { id }) {
        commit(PERMISSION_LOADING, true)
        return new Promise((resolve, reject) => {
            permissions.deletePermission(id)
          .then((res) => {
            commit(PERMISSION_LOADING, false)
            commit(REMOVE_PERMISSION_BY_ID,id)
            resolve(res.data)
          })
          .catch((error) => {
            commit(PERMISSION_LOADING, false)
            reject(error.response)
          });
        })
    },
    resetPermissionDenied ({ commit }) {
      commit(RESET_PERMISSION_DENIED)
    },
};

const mutations = {
  [SET_PERMISSIONS](state, permissions) {
    state.permissions = permissions;
  },
  [PERMISSION_LOADING](state, value) {
    state.permissionLoading = value;
  },
  [REMOVE_PERMISSION_BY_ID](state,value){
    const { index } = getPermissionById(state.permissions, value)

    if (index !== -1) {
        state.permissions.splice(index, 1)
    }
  },
  [SET_PERMISSION_DETAIL](state, value) {
    state.permissionDetail = value;
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
