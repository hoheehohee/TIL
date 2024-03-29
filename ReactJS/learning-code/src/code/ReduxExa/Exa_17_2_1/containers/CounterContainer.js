import React from 'react';
import { connect, useSelector } from 'react-redux';
import Counter from '../components/Counter';
import { decrease, increase } from '../modules/counter';

const CounterContainer = ({ number, increase, decrease }) => {
  return (
    <Counter number={number} onIncrease={increase} onDecrease={decrease} />
  );
};

/*
const mapStateToProps = state => ({
  number: state.counter.number
});

const mapDispatchToProps = dispatch => ({
  // 임시 함수
  increase: () => {
    dispatch(increase())
  },
  decrease: () => {
    dispatch(decrease())
  }
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CounterContainer);
*/

// bindActionCreators 유틸 함수를 사용
export default connect(
  state => ({
    number: state.counter.number,
  }),
  {
    increase, decrease
  }
)(CounterContainer)