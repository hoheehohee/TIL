import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import { Ref } from './code';



class App extends Component {
  render() {
    return (
      <div className="App">
        <Ref ref={(ref) => { this.scrollBox = ref }} />
        <button onClick={() => this.scrollBox.scrollToBotton()}>
          맨 밑으로
        </button>
      </div>
    );
  }
};

export default App;
