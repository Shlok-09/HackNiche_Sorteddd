import React from 'react';
import ReactDOM from 'react-dom';
import { Routes, Route } from "react-router-dom";
import './index.css';
import App from './App';
import { ContextProvider } from './contexts/ContextProvider';
import Chat from './components/Chatbot';
import Home from './Home';

ReactDOM.render(
  <React.StrictMode>
    <ContextProvider>
      {/* <Home /> */}
      {/* <Chat/> */}
      <App />
    </ContextProvider>
  </React.StrictMode>,
  document.getElementById('root'),
);
