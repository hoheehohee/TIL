import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import { Ref, Header, UseMemo, TodoApp } from 'code';

class Main extends Component {
  render() {
    return (
      <Router>
        <Header />
        <Route path="/ref" component={() => (
          <div className="App">
            <Ref ref={(ref) => { this.scrollBox = ref }} />
            <button onClick={() => this.scrollBox.scrollToBotton()}>
              맨 밑으로
              </button>
          </div>
        )} />
        <Route path="/useMemo" component={UseMemo} />
        <Route path="/todoList" component={TodoApp} />
      </Router >
    );
  }
}

export default Main;