import React from 'react';

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: '',
      seating: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.navigateToIndex = this.navigateToIndex.bind(this);
  }

  navigateToIndex() {
    this.props.history.push('/');
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
      seating: this.state.seating,
      lat: this.props.lat,
      lng: this.props.lng
    }

    this.props.createBench(benchData);
    this.navigateToIndex();
  }

  render() {
    const { description, seating } = this.state;
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

          <label>Seats</label>
          <input
            type="number"
            value={seating}
            onChange={this.update("seating")}
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
        <br />
        <button onClick={this.navigateToIndex}>Go Back</button>
      </div>
    )
  }
}

export default BenchForm;
