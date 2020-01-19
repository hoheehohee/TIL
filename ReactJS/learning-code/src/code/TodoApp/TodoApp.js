import React from 'react';

import TodoTemplate from './TodoTemplate';
import TodoInsert from './TodoInsert';
import TodoList from './TodoList';
import './index.css';

const TodoApp = () => {
  return (
    <div>
      <TodoTemplate>
        <TodoInsert />
        <TodoList />
      </TodoTemplate>
    </div>
  );
};

export default TodoApp;