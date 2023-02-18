import React from 'react';
import ReactDOM from 'react-dom';
import { Routes, Route } from "react-router-dom";
import './index.css';
import App from './App';
import { ContextProvider } from './contexts/ContextProvider';
import Home from './Home';
import Signup from './components/Signup';


ReactDOM.render(
  <React.StrictMode>
      <ContextProvider>
      <App />
      
      {/* <Home /> */}
      
      </ContextProvider>
  </React.StrictMode>,
  document.getElementById('root'),
);
