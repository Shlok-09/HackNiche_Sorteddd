// import React,{useState} from 'react'
// import {Link, useNavigate} from 'react-router-dom'
// import GoogleButton from "react-google-button";
// import { useUserAuth } from '../context/UserAuthContext';


// const Login = () => {
//     const [email, setEmail] = useState("");
//     const [password, setPassword] = useState("");
//     const [error, setError] = useState("");
//     const { logIn, googleSignIn } = useUserAuth();
//     const navigate = useNavigate();
  
//     const handleSubmit = async (e) => {
//       e.preventDefault();
//       setError("");
//       try {
//         await logIn(email, password);
//         navigate("/home");
//       } catch (err) {
//         setError(err.message);
//       }
//     };
  
//     const handleGoogleSignIn = async (e) => {
//       e.preventDefault();
//       try {
//         await googleSignIn();
//         navigate("/home");
//       } catch (error) {
//         console.log(error.message);
//       }
//     };
  
//     return (
//       <div className='font-poppins bg-light h-screen items-center flex justify-center'>
//         <div className='mt-5'>
//         <h2 className="mb-3 font-bold text-dark text-3xl text-center"> Login</h2>
//         <div className="h-auto border border-black justify-center m-auto items-center p-10">
          
//         {error && <alert variant="danger" className='bg-red-500 w-full h-full rounded text-center mx-auto text-white'>{error}</alert>}
//           <form className='flex flex-col' onSubmit={handleSubmit}>
            
//             <input type="email"
//                 placeholder="Email address"
//                 className='border shadow-dark w-auto p-3 m-3'
//                 onChange={(e) => setEmail(e.target.value)}
//             />
//             <input type="password"
//                 placeholder="Password"
//                 className='border shadow-dark w-auto p-3 m-3'
//                 onChange={(e) => setPassword(e.target.value)}
//             />
  
//             <div className="bg-dark text-light mx-auto px-4 py-2 rounded my-5">
//               <button variant="primary" type="Submit">
//                 Log In
//               </button>
//             </div> 
//           </form>
//           <hr />
//           <div>
//             <GoogleButton
//             className='mx-auto my-5'
//               onClick={handleGoogleSignIn}
//             />
//           </div>
//         </div>
//         <div className="p-4 mt-3 text-center">
//           Don't have an account? <Link to="/signup" className='text-dark underline'>Sign up</Link>
//         </div>
//         </div>
//       </div>
//     );
//   };
  
// export default Login