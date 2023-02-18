import React,{useState} from 'react'
import { Link,useNavigate } from 'react-router-dom'
import {UserAuth} from '../contexts/AuthContext'

const UserInfo = ({age,setAge}) => {
    // const [Age, setAge] = useState('');
    const [Gender, setGender] = useState('');
    const [Education, setEducation] = useState('')
    const [Profession, setProfession] = useState('');
    const [Maritial, setMaritial] = useState('')
    const [Children, setChildren] = useState('');
    const [Noc, setNoc] = useState('')
    const { createUser } = UserAuth();
    const [Income, setIncome] = useState('');
    const navigate = useNavigate()
    const handleSubmit = async(e) => {
        e.preventDefault()
        // console.log(e);
        console.log([Age,Gender,Education,Profession,Maritial,Children,Noc,Income]);
        var age = [Age];
    }

  return (
    <div className='max-w-[600px] mx-auto my-16 p-10 font-poppins bg-secondary-dark-bg/90 text-white'>
      <div>
      <h1 className='text-2xl font-bold py-2'>UserInfo</h1>
      <p className='py-2'>
          Already have an account yet?{' '}
          <Link to='/' className='underline'>
            Login.
          </Link>
        </p>
        <form onSubmit={handleSubmit}>
        <div className='flex flex-col py-2'>
          <label className='py-2 font-medium'>Age</label>
          <input
            onChange={(e) => setAge(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
          <label className='py-2 font-medium'>Gender</label>
          <input
            onChange={(e) => setGender(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
          <label className='py-2 font-medium'>Education</label>
          <input
            onChange={(e) => setEducation(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
        <label className='py-2 font-medium'>Profession</label>
          <input
            onChange={(e) => setProfession(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
        </div>
        <div className='flex flex-col py-2'>
          <label className='py-2 font-medium'>Maritial Status</label>
          <input
            onChange={(e) => setMaritial(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
        <label className='py-2 font-medium'>Children</label>
          <input
            onChange={(e) => setChildren(e)}
            className='border p-3 text-main-dark-bg'
            type='text'
          />
        <label className='py-2 font-medium'>Number of Children</label>
          <input
            onChange={(e) => setNoc(e)}
            className='border p-3 text-main-dark-bg'
            type='number'
          />
        <label className='py-2 font-medium'>Income</label>
          <input
            onChange={(e) => setIncome(e)}
            className='border p-3 text-main-dark-bg'
            type='number'
          />
        </div>
        <button className='bg-cyan hover:bg-main-dark-bg w-full p-4 my-2 text-white mx-auto'>
          Add Details
        </button>
      </form>
      </div>
    </div>
  )
}

export default UserInfo