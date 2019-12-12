import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const tabData = [
  {
    title: 'Tab 1',
    content: 'Hello from first tab!'
  },
  {
    title: 'Tab 2',
    content: 'Hi from tab #2'
  },
  {
    title: 'Tab 3',
    content: 'Last but not least.'
  }
]

const Root = () => (
  <div>
    <Clock />
    <Tabs tabData={tabData} />
  </div>
)

export default Root;
