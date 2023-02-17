// import React,{useState} from 'react'
// import { Link, useNavigate } from "react-router-dom";
// import { useUserAuth } from "../context/UserAuthContext";

// const Signup = () => {
//     const [email, setEmail] = useState("");
//     const [password, setPassword] = useState("");
//     // const [name, setName] = useState("");
//     const [error, setError] = useState("");
//     const { signUp } = useUserAuth();
//     let navigate = useNavigate();

//     const handleSubmit = async (e) => {
//       e.preventDefault();
//       setError("");
//       try {
//         await signUp(email, password);
//         navigate("/");
//       } catch (err) {
//         setError(err.message);
//       }
//     };

//   return (
//     <div className='font-poppins bg-light h-screen items-center flex justify-center'>
//       <div>
//         <h2 className="mb-3 font-bold text-dark text-3xl text-center"> Signup </h2>
//         <div className="h-auto border border-black justify-center m-auto items-center p-10">
          
//           {error && <alert variant="danger" className='bg-red-500 w-full h-full rounded text-center mx-auto text-white'>{error}</alert>}
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
//               <button >
//                 Sign Up
//               </button>
//             </div> 
//           </form>
//           <div>
//           </div>
//         </div>
//         <div className="p-4 mt-3 text-center">
//           Already have an account? <Link to="/" className='text-dark underline'>Login</Link>
//         </div>
//         </div>
//     </div>
//   )
// }

// export default Signup