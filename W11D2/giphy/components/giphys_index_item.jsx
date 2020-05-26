import React from 'react';

const GiphysIndexItem = ({ giphy }) => {
  return (
    <img src={giphy.images.fixed_width_downsampled.url} />
  )
}

export default GiphysIndexItem;