import React from 'react'
import { GoPrimitiveDot } from 'react-icons/go';
import SparkLine from './Charts/SparkLine';
import { Button } from '../components';
import Stacked from './Charts/Stacked';
import { useStateContext } from '../contexts/ContextProvider';
import { SparklineAreaData } from '../data/dummy';

const Insurance = () => {
    const { currentColor, currentMode } = useStateContext();
  return (
    <div className="flex gap-10 flex-wrap justify-center font-poppins">
    <div className="bg-white dark:text-gray-200 dark:bg-secondary-dark-bg m-3 p-4 rounded-2xl md:w-780  ">
      <div className="flex justify-between">
        <p className="font-semibold text-xl items-center">My Expenses</p>
        <div className="flex items-center gap-4">
          <p className="flex items-center gap-2 text-gray-600 hover:drop-shadow-xl">
            <span>
              <GoPrimitiveDot />
            </span>
            <span>Expense</span>
          </p>
          <p className="flex items-center gap-2 text-green-400 hover:drop-shadow-xl">
            <span>
              <GoPrimitiveDot />
            </span>
            <span>Budget</span>
          </p>
        </div>
      </div>
      <div className="mt-10 flex gap-10 flex-wrap justify-center">
        <div className=" border-r-1 border-color m-4 pr-10">
          <div>
            <p>
              <span className="text-3xl font-semibold">₹93,438</span>
              <span className="p-1.5 hover:drop-shadow-xl cursor-pointer rounded-full text-white bg-green-400 ml-3 text-xs">
                23%
              </span>
            </p> 
            <p className="text-gray-500 mt-1">Income</p>
          </div>
          <div className="mt-8">
            <p className="text-3xl font-semibold">₹48,487</p>

            <p className="text-gray-500 mt-1">Expenditure</p>
          </div>

          <div className="mt-5">
            <SparkLine currentColor={currentColor} id="line-sparkLine" type="Line" height="80px" width="250px" data={SparklineAreaData} color={currentColor} />
          </div>
          <div className="mt-10">
            <Button
              color="white"
              bgColor={currentColor}
              text="Download Report"
              borderRadius="10px"
            />
          </div>
        </div>
        <div>
          <Stacked currentMode={currentMode} width="320px" height="360px" />
        </div>
      </div>
    </div>
    <div>
      {/* <div
        className=" rounded-2xl md:w-400 p-4 m-3"
        style={{ backgroundColor: currentColor }}
      >
        <div className="flex justify-between items-center ">
          <p className="font-semibold text-white text-2xl">Earnings</p>

          <div>
            <p className="text-2xl text-white font-semibold mt-8">$63,448.78</p>
            <p className="text-gray-200">Monthly revenue</p>
          </div>
        </div>

        <div className="mt-4">
          <SparkLine currentColor={currentColor} id="column-sparkLine" height="100px" type="Column" data={SparklineAreaData} width="320" color="rgb(242, 252, 253)" />
        </div>
      </div> */}
{/* 
      <div className="bg-white dark:text-gray-200 dark:bg-secondary-dark-bg rounded-2xl md:w-400 p-8 m-3 flex justify-center items-center gap-10">
        <div>
          <p className="text-2xl font-semibold ">$43,246</p>
          <p className="text-gray-400">Yearly sales</p>
        </div>

        <div className="w-40">
          <Pie id="pie-chart" data={ecomPieChartData} legendVisiblity={false} height="160px" />
        </div>
      </div> */}
    </div>
  </div>
  )
}

export default Insurance

