import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { FiSettings } from 'react-icons/fi';
import { TooltipComponent } from '@syncfusion/ej2-react-popups';
import { useAuth } from './contexts/AuthContext';
import { Navbar, Footer, Sidebar, ThemeSettings } from './components';
import './App.css';
import { useStateContext } from './contexts/ContextProvider';
import Kanban from './pages/Kanban';
import Calendar from './pages/Calendar';
import Line from './pages/Charts/LineChart';
import Finance from './pages/Finance';
import Chatbot from './components/Chatbot';
import Insurance from './pages/Insurance';
import Home from './Home';
import Loan from './pages/Loan';
import Policy from './pages/Policy';
import Bond from './pages/Bond';
import MutualFunds from './pages/MutualFunds';
import Crypto from './pages/Crypto';
import Stocks from './pages/Stocks';
import Chat from './components/Chatbot';
import Login from './components/Login/Login';
// import Signup from './components/Signup';

const App = () => {
  const { setCurrentColor, setCurrentMode, currentMode, activeMenu, currentColor, themeSettings, setThemeSettings } = useStateContext();
  const currentUser = 'ayushShah123';
  // const [currUser,setCurrUser] = useAuth(currentUser);
  useEffect(() => {
    const currentThemeColor = localStorage.getItem('colorMode');
    const currentThemeMode = localStorage.getItem('themeMode');
    if (currentThemeColor && currentThemeMode) {
      setCurrentColor(currentThemeColor);
      setCurrentMode(currentThemeMode);
    }
  }, []);
  return (
    <div className={currentMode === 'Dark' ? 'dark' : ''}>
      <BrowserRouter>
        <div className="flex relative dark:bg-main-dark-bg">
          <div className="fixed right-4 bottom-4" style={{ zIndex: '1000' }}>
            <TooltipComponent
              content="Settings"
              position="Top"
            >
              <button
                type="button"
                onClick={() => setThemeSettings(true)}
                style={{ background: currentColor, borderRadius: '50%' }}
                className="text-3xl text-white p-3 hover:drop-shadow-xl hover:bg-light-gray"
              >
                <FiSettings />
              </button>

            </TooltipComponent>
          </div>
          {activeMenu ? (
            <div className="w-72 fixed sidebar dark:bg-secondary-dark-bg bg-white ">
              <Sidebar />
            </div>
          ) : (
            <div className="w-0 dark:bg-secondary-dark-bg">
              <Sidebar />
            </div>
          )}
          <div
            className={
              activeMenu
                ? 'dark:bg-main-dark-bg  bg-main-bg min-h-screen md:ml-72 w-full  '
                : 'bg-main-bg dark:bg-main-dark-bg  w-full min-h-screen flex-2 '
            }
          >
            <div className="fixed md:static bg-main-bg dark:bg-main-dark-bg navbar w-full ">
              <Navbar />
            </div>
            <div>
              {themeSettings && (<ThemeSettings />)}
              <Routes>
                <Route path="/kanban" element={<Kanban />} />  
                <Route path="/calendar" element={<Calendar />} />
                <Route path="/line" element={<Line />} />
                <Route path="/" element={<Finance />} />
                <Route path="/chatbot" element={<Chat />} />
                <Route path="/insurance" element={<Insurance />} />
                <Route path="/loan" element={<Loan />} />
                <Route path="/policy" element={<Policy />} />
                <Route path="/bond" element={<Bond />} />
                <Route path="/mutualfunds" element={<MutualFunds />} />
                <Route path="/crypto" element={<Crypto />} />
                <Route path="/stocks" element={<Stocks />} />
                <Route path='/login' element={<Login setCurrUser={setCurrUser}/>} />
                {/* <Route exact path='/signup' element={<Signup setCurrUser={setCurrUser}/>} /> */}
              </Routes>
            </div>         
            <Footer />
          </div>
        </div>
      </BrowserRouter>
    </div>
  );
};

export default App;
