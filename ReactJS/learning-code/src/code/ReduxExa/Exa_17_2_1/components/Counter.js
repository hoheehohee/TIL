import React from 'react';

const Counter = ({ number, onIncrease, onDecrease }) => {
  const onClick = (e) => {
    e.persist();
    onIncrease();
  }
  return (
    <div>
      <h1>{number}</h1>
      <div>
        <button onClick={onClick}>+1</button>
        <button onClick={onDecrease}>-1</button>
      </div>
    </div>
  );
};

export default Counter;