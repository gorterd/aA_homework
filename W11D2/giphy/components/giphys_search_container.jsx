import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';
import { connect } from 'react-redux';

const mStp = state => ({
  giphys: state.giphys,
});

const mDtp = dispatch => ({
  fetchSearchGiphys: searchTerm => dispatch(fetchSearchGiphys(searchTerm)),
}); 

export default connect(mStp, mDtp)(GiphysSearch);