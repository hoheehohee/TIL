import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <div>
      <ul><li><Link to="ref">Ref</Link></li></ul>
      <ul><li><Link to="useMemo">useMemo</Link></li></ul>
      <ul><li><Link to="todoList">Todo List</Link></li></ul>
    </div>
  );
};

export default Header;