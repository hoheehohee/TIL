import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <div>
      <ul><li><Link to="ref">Ref</Link></li></ul>
      <ul><li><Link to="useMemo">useMemo</Link></li></ul>
      <ul><li><Link to="todoList">Todo List</Link></li></ul>
      <ul><li><Link to="exa17_2_1">eax_17.2.1</Link></li></ul>
      <ul><li><Link to="exa18_1">eax_18.1</Link></li></ul>
    </div>
  );
};

export default Header;