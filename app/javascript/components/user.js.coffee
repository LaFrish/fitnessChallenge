import React from "react"
import PropTypes from "prop-types"
class User extends React.Component {
  render () {
    return (
      <div>
        <div>Text: {this.props.text}</div>
      </div>
    );
  }
}

Users.propTypes = {
  text: PropTypes.string
};
export default User
