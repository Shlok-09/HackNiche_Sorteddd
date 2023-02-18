import React from 'react';
import ReactDOM from 'react-dom';
import { Routes, Route } from "react-router-dom";
import './index.css';
import App from './App';
import { ContextProvider } from './contexts/ContextProvider';
import Chat from './components/Chatbot';
import Home from './Home';
import Signup from './components/Signup';


ReactDOM.render(
  <React.StrictMode>
    <ContextProvider>
      {/* <Home /> */}
      <App />
    </ContextProvider>
  </React.StrictMode>,
  document.getElementById('root'),
);
