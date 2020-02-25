import React from 'react';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import { createLogger } from 'redux-logger';
import rootReducer from 'code/ReduxExa/Exa_18_1/modules';

import CounterContainer from './containers/CounterContainer';
import SampleContainer from './containers/SampleContainer';
import loggerMiddleware from './lib/loggerMiddleware';
import ReduxThunk from 'redux-thunk';

// const store = createStore(rootReducer, composeWithDevTools());
// const store = createStore(rootReducer, applyMiddleware(loggerMiddleware));
const logger = createLogger();
const store = createStore(rootReducer, applyMiddleware(logger, ReduxThunk));


const Exa_18_1 = () => {
  return (
    <Provider store={store}>
      <div>
        <CounterContainer />
        <SampleContainer />
      </div>
    </Provider>
  );
};

export default Exa_18_1;