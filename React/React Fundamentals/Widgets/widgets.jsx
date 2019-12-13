import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

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

const names = ['Aengus', 'Lissa', 'Fern', 'Gomes', 'Waldo', 'Jennifer', 'Larry', 'Gary', 'Jack', 'Liam'];

function Root() {
  return(
    <div>
      <Clock />
      <Tabs tabData={ tabData } />
      <Weather />
      <Autocomplete names={ names } />
    </div>
  )
}
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root/>, root);
})
