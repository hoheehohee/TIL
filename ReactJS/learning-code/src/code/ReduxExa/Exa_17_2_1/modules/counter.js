import { createAction, handleActions } from 'redux-actions';

// 액션 타입
const INCREASE = 'counter/INCREASE';
const DECREASE = 'counter/DECREASE';

// 액션 생성 함수
/*
export const increase = () => ({ type: INCREASE });
export const decrease = () => ({ type: DECREASE });
 */

// 액션 생성 함수 (crateAction 사용)
/**
 * redux-actions를 사용하면 액션 함수를 더 짧은 코드로 작성할 있다.
 * 그리고 리듀서를 작성할 때도 switch/case 문이 아닌 handleActions라는 함수를 사용하여
 * 각 액션마다 업데이트 함수를 설정하는 형식으로 작성해 줄 수있다.
 */
export const increase = createAction(INCREASE);
export const decrease = createAction(DECREASE);



// 초기값
const initialState = {
  number: 0
}

//리듀서
/*
function counter(state = initialState, action) {
  switch (action.type) {
    case INCREASE:
      return {
        number: state.number + 1
      }
    case DECREASE: 
      return {
        number: state.number -1
      }
    default:
      return state;
  }
}
 */

//리듀셔 (handleActions 사용)
const counter = handleActions(
  {
    [INCREASE]: (state, action) => ({ number: state.number + 1 }),
    [DECREASE]: (state, action) => ({ number: state.number - 1 }),
  },
  initialState
);

export default counter;