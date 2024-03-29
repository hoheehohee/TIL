import { handleActions } from 'redux-actions';
import * as api from '../lib/api';
import createRequestThunk from '../lib/createRequestThunk';

// 액션 타입을 선언한다.
// 한 요청당 세 개를 만들어야한다.

const GET_POST = 'sample/GET_POST';
const GET_POST_SUCCESS = 'sample/GET_POST_SUCCESS';
const GET_POST_FAILURE = 'sample/GET_POST_FAILURE';

const GET_USERS = 'sample/GET_USERS';
const GET_USERS_SUCCESS = 'sample/GET_USERS_SUCCESS';
const GET_USERS_FAILURE = 'sample/GET_USERS_FAILURE';

// thunk 함수를 생성한다.
// thunk 함수 내부에서는 시작할 때, 성공했을 때, 실패했을 때 다른 액션을 디스패치한다.

/*
export const getPost = (id) => async (dispatch) => {
  dispatch({ type: GET_POST }); // 요청을 시작한 것을 알림.
  try {
    const response = await api.getPost(id);
    dispatch({
      type: GET_POST_SUCCESS,
      payload: response.data
    }); // 요청 성공
  } catch (error) {
    dispatch({
      type: GET_POST_FAILURE,
      payload: error,
      error: true
    }); // 에러 발생
    throw error;  // 나중에 컴포넌트단에서 에러를 조회할 수 있게 해 줌.
  }
}

export const getUsers = () => async(dispatch) => {
  dispatch({ type: GET_USERS });  // 요청을 시작한 것을 알림
  try {
    const response = await api.getUsers();
    console.log('%c##### debug-response: ', 'color: #058FD7', response);
    dispatch({
      type: GET_USERS_SUCCESS,
      payload: response.data
    }); // 요청 성공
  } catch (error) {
    dispatch({
      type: GET_USERS_FAILURE,
      payload: error,
      error: true
    }); // 에러 발생
    throw error;  // 나중에 컴포넌트단에서 에러를 조회할 수 있게 해 줌.
  }
}
 */

// thunk 함수를 생성한다.
// thunk 함수 내부에서는 시작할 때, 성공했을 때, 실패했을 때 다른 액션을 디스패치한다.
// 반복되는 로직을 따로 분리하여 코드의 양을 줄임.(createRequestThunk)
export const getPost = createRequestThunk(GET_POST, api.getPost);
export const getUsers = createRequestThunk(GET_USERS, api.getUsers);

// 초기 상태를 선언한다.
// 요청의 로딩 중 상태는 loading이라는 개첵에서 관리한다.


/*
const initialState = {
  loading: {
    GET_POST: false,
    GET_USERS: false
  },
  post: null,
  users: null
}
const sample = handleActions({
  [GET_POST]: (state) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_POST: true  // 요청 시작
    }
  }),
  [GET_POST_SUCCESS]: (state, action) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_POST: false // 요청 완료
    },
    post: action.payload
  }),
  [GET_POST_FAILURE]: (state, action) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_POST: false // 요청 완료
    }
  }),
  [GET_USERS]: (state) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_USERS: true  // 요청 시작
    }
  }),
  [GET_USERS_SUCCESS]: (state, action) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_USERS: false // 요청 완료
    },
    users: action.payload
  }),
  [GET_USERS_FAILURE]: (state, action) => ({
    ...state,
    loading: {
      ...state.loading,
      GET_POST: false // 요청 완료
    }
  }),
}, initialState );
*/

const initialState = {
  post: null,
  users: null
}

const sample = handleActions({
  [GET_POST_SUCCESS]: (state, action) => ({
    ...state,
    post: action.payload
  }),
  [GET_USERS_SUCCESS]: (state, action) => ({
    ...state,
    users: action.payload
  })
}, initialState)

export default sample;