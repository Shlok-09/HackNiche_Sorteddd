// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
import {getAuth} from 'firebase/auth'

const firebaseConfig = {
  apiKey: "AIzaSyCfPHUmEskLmRfTbZAzNWovmjpFVVa1e0A",
  authDomain: "hackniche-finance.firebaseapp.com",
  databaseURL: "https://hackniche-finance-default-rtdb.firebaseio.com",
  projectId: "hackniche-finance",
  storageBucket: "hackniche-finance.appspot.com",
  messagingSenderId: "476529227768",
  appId: "1:476529227768:web:71fd8c762a5d36ca1e480d"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
export { app,auth };