import React from 'react';

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
  update(property) {
    return e => this.setState({
      [property]: e.target.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const benchData = {
      description: this.state.description,
      lat: this.props.lat,
      lng: this.props.lng
    }

    this.props.createBench(benchData);
    this.props.history.push('/');
  }

  render() {
    const { description } = this.state;
    const { lat, lng } = this.props;

    return (
      <div>
        <h3>Add a new Bench</h3>
        <form onSubmit={this.handleSubmit}>
          <label>Description</label>
          <input
            type="text"
            value={description}
            onChange={this.update("description")}
          />

          <label>Latitude</label>
          <input
            type="text"
            value={lat}
            disabled
          />

          <label>Longitude</label>
          <input
            type="text"
            value={lng}
            disabled
          />

          <input
            type="submit"
            value="Create Bench"
          />
        </form>
      </div>
    )
  }
}

export default BenchForm;
