import React from 'react';
import Job from './job';
import { selectLocation } from './../actions';

class Widget extends React.Component {

  constructor(props) {
    super(props);
    this.forceUpdate = this.forceUpdate.bind(this);

    // require this component to re-render whenever the store's state changes
    this.props.store.subscribe(this.forceUpdate);
    this.cities = ["San Francisco", "Seattle", "New York", "Austin", "Remote"];
    this.selectLocation = selectLocation.bind(this);
  }

  fetchJobListings(city) {
    console.log('fetching');
    fetch(`https://jobs.github.com/positions.json?location=${city}`)
      .then( response => response.json() );
  }
    // .then( json => { console.log(json) });
        // this.props.store.dispatch(this.selectLocation(city, resp))
  

  render() {

    // get the store's current state and deconstruct it into 'jobs'
    // and 'city' variables
    const { city, jobs } = this.props.store.getState();
    const cityOptions = this.cities.map(city => (
        <button onClick={ () => { this.fetchJobListings(city) }}
             key={city}
             className="job-option">
          {city}
        </button>
      )
    );

    const jobListings = jobs.map(job => (
      <Job key={job.id}
            title={job.title}
            company={job.company}
            location={job.location}
            type={job.type}
            description={job.description}
            info = {job.url}/>
    )
    );

    return (
      <div>
        <h1>Github Job Listings</h1>
        <h3>City: {city}</h3>

        <div className="location-selector">
          Location:
          {cityOptions}
        </div>
        
        <h3>{jobListings.length} Job Listings</h3>
        <ol className="listings-list">
            {jobListings}
        </ol>
      </div>
    );
  }
};


export default Widget;