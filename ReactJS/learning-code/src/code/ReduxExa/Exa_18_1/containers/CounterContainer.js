import React from 'react';
import { connect } from 'react-redux';
import { decrease, increase, increaseAsync, decreaseAsync } from '../modules/counter';
import Counter from '../components/Counter';

const CounterContainer = ({ number, increase, decrease, increaseAsync, decreaseAsync}) => {
  return (
    <div>
      {/* <Counter number={number} onIncrease={increase} onDecrease={decrease} /> */}
      <Counter number={number} onIncrease={increaseAsync} onDecrease={decreaseAsync} />
    </div>
  );
};

export default connect(
  (state) => ({
    number: state.counter
  }),
  // { increase, decrease }
  { increaseAsync, decreaseAsync }
)(CounterContainer);