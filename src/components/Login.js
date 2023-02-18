import React,{useState} from 'react'
import {Link,useNavigate} from 'react-router-dom'
import { UserAuth } from '../contexts/AuthContext'
const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();
  const { signIn } = UserAuth();
  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('')
    try {
      await signIn(email, password)
      navigate('/account')
    } catch (e) {
      setError(e.message)
      console.log(e.message)
    }
  };
  return (
    <div className='max-w-[600px] mx-auto my-16 p-10 font-poppins bg-secondary-dark-bg/90 text-white'>
    <div className='mx-auto'>
    <h1 className='text-2xl font-bold py-2'>Login to your account</h1>
    <p className='py-2'>
        Don't have an account yet?{' '}
        <Link to='/signup' className='underline'>
          Signup.
        </Link>
      </p>
      <form onSubmit={handleSubmit}>
      <div className='flex flex-col py-2'>
        <label className='py-2 font-medium'>Email Address</label>
        <input
          onChange={(e) => setEmail(e.target.value)}
          className='border p-3 text-main-dark-bg'
          type='email'
        />
      </div>
      <div className='flex flex-col py-2'>
        <label className='py-2 font-medium'>Password</label>
        <input
          onChange={(e) => setPassword(e.target.value)}
          className='border p-3 text-main-dark-bg'
          type='password'
        />
      </div>
      <button className=' bg-cyan hover:bg-main-dark-bg w-full p-4 my-2 text-white'>
        Login
      </button>
    </form>
    </div>
  </div>
  )
}

export default Login
