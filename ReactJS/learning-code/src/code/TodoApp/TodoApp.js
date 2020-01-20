import React, { useState, useRef, useCallback } from 'react';

import TodoTemplate from './TodoTemplate';
import TodoInsert from './TodoInsert';
import TodoList from './TodoList';
import './index.css';

function createBulkTodos() {
  const array = [];
  for (let i = 1; i <= 2500; i++) {
    array.push({
      id: i,
      text: `할 일 ${i}`,
      checked: false
    });
  }
  return array;
}

const TodoApp = () => {
  // 여기서 주의할 점은 useState의 기본값에 함수를 넣어 주었다는 것.
  // 여기서 useState(createBulkTodos())라고 작성하면 리렌더링될 때마다 createBulkTodos 함수가 호출되지만,
  // useState(createBulkTodos)처럼 파라미터를 함수 형태로 넣어 주면 컴포넌트가 처음 렌더링될 때만 createBulkTodos 함수가 실행될 것이다.
  const [todos, setTodos] = useState(createBulkTodos);

  // 고윳값으로 사용될 id
  // ref를 사용하여 변수 담기
  const nextId = useRef(4);
  const onInsert = useCallback((text) => {
    const todo = {
      id: nextId.current,
      text,
      checked: false
    };
    
    //setTodos(todos.concat(todo));
    setTodos(todos => todos.concat(todo));
    nextId.current += 1;  // nextId 1씩 더하기
  // }, [todos]);
  }, []);

  const onRemove = useCallback((id) => {
    // setTodos(todos.filter(todo => todo.id !== id));
    setTodos(totos => todos.filter(todo => todo.id !== id));
  // }, [todos]);
  }, []);

  const onToggle = useCallback((id) => {
    setTodos((todos) =>
      todos.map((todo) => 
        todo.id === id ? { ...todo, checked: !todo.checked } : todo
      )
    )
  }, []);

  return (
    <div>
      <TodoTemplate>
        <TodoInsert onInsert={onInsert} />
        <TodoList todos={todos} onRemove={onRemove} onToggle={onToggle} />
      </TodoTemplate>
    </div>
  );
};

export default TodoApp;