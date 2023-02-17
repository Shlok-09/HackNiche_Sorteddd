import React from 'react';
import ReactDOM from 'react-dom';

import './index.css';
import App from './App';
import { ContextProvider } from './contexts/ContextProvider';
// import Home from './Home';

ReactDOM.render(
  <React.StrictMode>
    <ContextProvider>
      {/* <Home /> */}
      <App />
    </ContextProvider>
  </React.StrictMode>,
  document.getElementById('root'),
);
