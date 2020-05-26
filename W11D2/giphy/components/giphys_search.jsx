import React from 'react';
import GiphysIndex from './giphys_index';
import { fetchSearchGiphys } from '../util/api_util';

export default class GiphysSearch extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      searchTerm: '',
    }

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState( {searchTerm: ""} );
  }

  handleChange(e){
    this.setState({searchTerm: e.target.value});
  }

  render() {
    const { giphys } = this.props;
    const { searchTerm } = this.state;
    
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" onChange={this.handleChange} value={searchTerm}/>
          <button type="submit">Search</button>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    )
  }

}