import { createStore } from 'vuex'; // Sử dụng createStore thay vì Vuex trực tiếp

const store = createStore({
    state() {
        return {
            userId: null, // Lưu trữ user_id
            // Các state khác nếu có
        };
    },
    mutations: {
        SET_USER_ID(state, userId) {
            state.userId = userId;
        },
        // Các mutations khác nếu có
    },
    actions: {
        setUserId({ commit }, userId) {
            commit('SET_USER_ID', userId);
        },
        // Các actions khác nếu có
    },
    getters: {
        userId: state => state.userId,
        // Các getters khác nếu có
    }
});

export default store;
