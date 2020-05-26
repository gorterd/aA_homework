const GIPHY_API_KEY = 'rQR7AeQjFW1tURHxI9LBnqRbH5RTFTUT';

// export const fetchSearchGiphys = searchTerm => {
//   return fetch(`http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${GIPHY_API_KEY}&limit=2`)
//     .then( res => res.json() );

// }

export const fetchSearchGiphys = searchTerm => {
  return $.ajax({
    method: 'get',
    dataType: 'json',
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${GIPHY_API_KEY}&limit=2`
  })
}