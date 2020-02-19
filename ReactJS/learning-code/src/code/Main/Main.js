import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import { Ref, Header, UseMemo, TodoApp } from 'code';
import { Exa_17_2_1 } from 'code/ReduxExa/containers/';

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
        <Route path="/exa17_2_1" component={Exa_17_2_1} />
      </Router >
    );
  }
}

export default Main;