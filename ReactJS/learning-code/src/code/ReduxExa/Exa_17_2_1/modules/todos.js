import { createAction, handleActions } from 'redux-actions';
import produce from 'immer';
// 액션 타입
const CHANGE_INPUT = 'todos/CHANGE_INPUT';  //인풋 값을 변경함
const INSERT = 'todos/INSERT';  // 새로운 todo를 등록함
const TOGGLE = 'todos/TOGGLE';  // todo를 체크/체크 해제함
const REMOVE = 'todos/REMOVE';  // todo를 제거함

// 액션 함수
/*
export const changeInput = input => ({
  type: CHANGE_INPUT,
  input
});

let id = 3; // insert가 호출될 때마다 1씩 더해진다.
export const insert = (text) => ({
  type: INSERT,
  todo: {
    id: id++,
    text,
    done: false
  }
});

export const toggle = id => ({
  type: TOGGLE,
  id
});

export const remove = id => ({
  type: REMOVE,
  id
});
 */

// 액션 함수 (creactAction 사용)
export const changeInput = createAction(CHANGE_INPUT, (input) => input);

let id = 3; // insert가 호출될 때마다 1씩 더해진다.
export const insert = createAction(INSERT, (text) => ({
  id: id++,
  text,
  done: false
}));

// 액션 함수 (createAction 사용)
export const toggle = createAction(TOGGLE, (id) => id);
export const remove = createAction(REMOVE, (id) => id);

// 초기 상태
const initialState = {
  input: '',
  todos: [
    { id: 1, text: '리럭스 기초 배우기', done: true },
    { id: 2, text: '리액트와 리덕스 사용하기', done: false },
  ]
};

// 리듀서
/*
function todos(state = initialState, action) {
  switch (action.type) {
    case CHANGE_INPUT:
      return {
        ...state,
        input: action.input
      }
    case INSERT:
      return {
        ...state,
        todos: state.todos.concat(action.todo)
      };
    case TOGGLE:
      return {
        ...state,
        todos: state.todos.map(todo => 
          todo.id === action.id ? { ...todo, done: !todo.done } : todo
        )
      };
    case REMOVE:
      return {
        ...state,
        todos: state.todos.filter(todo => todo.id !== action.id)
      }

    default:
      return state;
  }
}
 */

// 리듀서 (handleActions 사용)
/**
 * 액션 생성 함수는 파라미터로 받아 온 값을 객체 안에 넣을 때 원하는 이름으로 넣는 것이 아니라!
 * action.id, action.todo와 같이 action.payload라는 이름을 공통!적으로 넣어 주게 된다.
 * 그렇기 때문에, 기존의 업데이트 로직에서도 모두 action.payload 값을 조회하여 업데이트 하도록 구현해 주어야 한다.
 * 즉 여기서 action.id, action.todo를 조회하는 대신 모두 공통적으로 action.payload 값을 조회하도록 해야함.
 */
const todos = handleActions(
  {
    [CHANGE_INPUT]: (state, action) => ({ ...state, input: action.payload }),
    [INSERT]: (state, action) => ({
      ...state,
      todos: state.todos.concat(action.payload)
    }),
    /*
    [TOGGLE]: (state, { payload: id }) => ({    // 객체 비구조화 할당 문법으로 사용
      ...state,
      todos: state.todos.map((todo) => (
        todo.id === id ? { ...todo, done: !todo.done } : todo
      ))
    }),
     */
    // immer 모듈사용
    [TOGGLE]: (state, { payload: id }) => (
      produce(state, (draft) => {
        const todo = draft.todos.find((todo) => todo.id === id);
        todo.done = !todo.done;
      })
    ),
    [REMOVE]: (state, { payload: id }) => ({    // 객체 비구조화 할당 문법으로 사용
      ...state,
      todos: state.todos.filter(todo => todo.id !== id)
    })
  },
  initialState
)

export default todos;