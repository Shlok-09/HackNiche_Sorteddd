import React from 'react'
import { loanData} from '../data/dummy';

const Loan = ({age,setAge}) => {
  return (
    <div className='mx-auto w-4/5'>
        <div className="grid grid-cols-2 m-10 justify-center gap-5 items-center">
          {loanData.map((item) => (
            <div key={item.title} className="bg-white h-full w-full dark:text-gray-200 dark:bg-secondary-dark-bg pt-9 p-8 rounded-2xl">
              <button
                type="button"
                style={{ color: item.iconColor, backgroundColor: item.iconBg }}
                className="text-2xl opacity-0.9 rounded-full mx-auto p-4 hover:drop-shadow-xl"
              >
                {item.icon}
              </button>
              {/* <p className="mt-3 mx-auto0">
                <span className="text-lg font-semibold">{item.amount}</span>
                <span className={`text-sm text-${item.pcColor} ml-2`}>
                  {item.percentage}
                </span>
              </p> */}
              <p className="text-sm text-gray-400  mt-1">{item.title}</p>
            </div>
          ))}
        </div>
    </div>
  )
}

export default Loan