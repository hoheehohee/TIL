
import React from 'react';
import CounterContainer from './containers/CounterContainer';
import TodosContainer from './containers/TodosContainer';


import { createStore } from 'redux';
import { Provider } from 'react-redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import rootReducer from 'code/ReduxExa/Exa_17_2_1/modules';

const store = createStore(rootReducer);

const Exa_17_2_1 = () => {
  return (
    <Provider store={store}>
      <div>
        <CounterContainer />
        <hr/>
        <TodosContainer />
      </div>
    </Provider>
  );
};

export default Exa_17_2_1;