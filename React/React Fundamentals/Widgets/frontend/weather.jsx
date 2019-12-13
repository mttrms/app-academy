import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props)
    this.state = { location: null, temperature: null, feelsLike: null }
  }

  componentDidMount() {
    const location = navigator.geolocation.getCurrentPosition((pos) => {
      let latitude = (pos.coords.latitude).toFixed(2);
      let longitude = pos.coords.longitude.toFixed(2);

      let request = new XMLHttpRequest();
      let url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=ed85fdee76531b10832e2915da04ecab&units=imperial`
      request.open('GET', url, true);

      request.onload = () => {
        console.log(request.status);
        if (request.status === 200) {

        
          const data = JSON.parse(request.response);
          const location = data.name;
          const temperature = data.main.temp;
          const feelsLike = data.main.feels_like;
          this.setState({ location, temperature, feelsLike })
          console.log('test');
          console.log(this.state);

        }
      }

      request.send();
    });
  }

  render() {
    return(
      this.state.location ?
      <div className="weather">
        <p>Location: { this.state.location }</p>
        <p>Temperature: { this.state.temperature }° F</p>
        <p>Feels Like: { this.state.feelsLike }° F</p>
      </div>
      :
      <div className="weather">
        <p>Loading Weather</p>
      </div>
    )
  }
}

export default Weather
