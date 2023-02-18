import React from 'react'
import Chatbot from "react-simple-chatbot"
import { ThemeProvider } from 'styled-components';

const config ={
  width: "400px",
  height: "500px", 
};


const theme = {
  background: '#f5f8fb',
  fontFamily: 'poppins',
  headerBgColor: '#1D1D41',
  headerFontColor: '#FBFBF3',
  headerFontSize: '15px',
  botBubbleColor: '#1D1D41',
  botFontColor: '#FBFBF3',
  userBubbleColor: '#141332',
  userFontColor: '#fff',
};

const Chat = () => {
    const steps =[
        {
            id: "Greet",
            message: "Hello, What is your Name?",
            trigger: "waiting1",
        },
          {
            id: "waiting1",
            user: true,      
            trigger: "Name",      
          },
          {
            id: "Name",
            message: "Hi {previousValue}, What would you like to discuss about?",
            trigger: "issues",
          },
          {
            id: "issues",
            options: [
              {
                value: "Savings",
                label: "Savings",
                trigger: "Savings",
              },
              { 
                value: "Insurance", 
                label: "Insurance", 
                trigger: "Insurance" },
            ],
          },
          {
            id: "Savings",
            message:
              "Okay! What percentage of your income are you currently saving?",
            trigger: "waiting2",
          },
          {
            id: "waiting2",
            user: true,      
            trigger: "SolutionSavings",      
          },
          {
            id: "SolutionSavings",
            message:
              "Ok. Ideally, you should aim to save at least 20% of your income.",
            end: true,
          },
          {
            id: "Insurance",
            message:
              "Sure, I'm happy to help. What would you like to ask about insurance ?",
              trigger: "waiting3",
           },
          {
            id: "waiting3",
            user: true,      
            trigger: "SolutionInsurance",      
          },
          {
            id: "SolutionInsurance",
            message:
              " Research the different types of insurance policies that are available and compare the coverage, costs, and benefits of each policy. Look for policies that align with your needs and budget.",
            end: true,
          },
          {...config}
    ]
  return (
    <div >
      <ThemeProvider theme={theme}>
        <Chatbot steps={steps}/>
      </ThemeProvider>
    </div>
  )
}

export default Chat
