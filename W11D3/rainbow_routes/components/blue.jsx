import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Indigo from './indigo';


class Blue extends React.Component {
  render() {
    return (
      <div>
        <h2 className="blue"></h2>
        <NavLink exact to={`${this.props.match.path}`}>Blue Only</NavLink>
        <NavLink to={`${this.props.match.path}/indigo`}>Add indigo</NavLink>


        <Route path={`${this.props.match.path}/indigo`} component={Indigo} />
      </div>
    );
  }
};

export default Blue;
