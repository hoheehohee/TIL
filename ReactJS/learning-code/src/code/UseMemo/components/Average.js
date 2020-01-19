import * as React from 'react';

const getAverage = number => {
  console.log('평균값 계산 중.');
  if (number.length === 0) return 0;
  const sum = number.reduce((a, b) =>  a + b);
  return sum / number.length;
};

const Average = () => {
  const { useState, useMemo, useCallback } = React;
  const [list, setList] = useState([]);
  const [number, setNumber] = useState('');

  // const onChange = e => {
  //   setNumber(e.target.value);
  // }
  const onChange = useCallback(e => {
    setNumber(e.target.value);
  }, []); // 컴포넌트가 처음 렌더링 때만 함수 생성

  // const onInsert = e => {
  //   const nextList = list.concat(parseInt(number));
  //   setList(nextList);
  //   setNumber('');
  // }


  /**
   * 함수 내부에서 상태 값에 의존해야 할 때는 그 값을 반드시 두 번째 파라미터 안에 포함시켜 주어야 한다.
   * 예를 들어 onChange의 경우 기존의 값을 조회하지 않고 바로 설정만 하기 때문에 배열이 비어 있어도 상관없지만, 
   * onInsert는 기존의 number와 list 조회해서 nextList를 생성하기 때문에 배열 안에 number와 list를 꼭 넣어 주어야 한다.
   * 
   * 
   * useCallback은 결국 useMemo로 함수를 반환하는 상황에서 더 편하게 사용할 수 있는 Hook이다.
   * 숫자, 문자열, 객체처럼 일반 값을 재사용하려면 useMemo를 사용하고, 
   * 함수를 재사용하려면 useCallback을 사용한다.
   */
  const onInsert = useCallback(e => {
    const nextList = list.concat(parseInt(number));
    setList(nextList);
    setNumber('');
  }, [number, list]);   // number 혹은 list가 바뀌었을 때만 함수 생성

  // useMemo : 렌더링 과정에서 특정 값이 바뀌었을 때만 연산을 실행하고, 원하는 값이 바뀌지 않으면 이전에 연산했던 결과를 다시 사용
  // list 배열의 내용이 바뀔 때만 getAverage 함수가 호출
  const avg = useMemo(() => getAverage(list), [list]);

  return (
    <div>
      <input value={number} onChange={onChange} />
      <button onClick={onInsert}>등록</button>
      <ul>
        {
          list.map((value, index) => (
            <li key={index}>{value}</li>
          ))
        }
      </ul>
      <div>
        {/* <b>평균값:</b> {getAverage(list)} */}
        <b>평균값:</b> {avg}
      </div>
    </div>
  );
};

export default Average;