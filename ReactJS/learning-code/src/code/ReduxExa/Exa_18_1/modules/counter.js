import { createAction, handleActions } from 'redux-actions';

// 액션 타입
const INCREASE = 'counter/INCREASE';
const DECREASE = 'counter/DECREASE';

//액션 생성 함수 (createAction 사용)
export const increase = createAction(INCREASE);
export const decrease = createAction(DECREASE);

// 1초 뒤에 increase 혹은 decrease 함수를 디스패치함
export const increaseAsync = () => (dispatch) => {
  setTimeout(() => {
    dispatch(increase());
  }, 1000);
};
export const decreaseAsync = () => (dispatch) => {
  setTimeout(() => {
    dispatch(decrease());
  }, 1000);
};

// 초기값
const initalState = 0;
// 리듀서
const counter = handleActions({
  [INCREASE]: (state) => state + 1,
  [DECREASE]: (state) => state - 1
}, initalState);

export default counter;