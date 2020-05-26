import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  return (
    <ul>
      { giphys.map( (giphy, idx) => {
        return <GiphysIndexItem key={idx} giphy={giphy} />
      }) } 
    </ul>
  );
}

export default GiphysIndex; 
