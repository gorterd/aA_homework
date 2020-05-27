import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        <NavLink exact to={`${this.props.match.path}`}>Red Only</NavLink>
        <NavLink to={`${this.props.match.path}/orange`}>Add orange</NavLink>
        <NavLink to={`${this.props.match.path}/yellow`}>Add yellow</NavLink>

        <Route path={`${this.props.match.path}/orange`} component={Orange} />
        <Route path={`${this.props.match.path}/yellow`} component={Yellow} />
      </div>
    );
  }
};

export default Red;
