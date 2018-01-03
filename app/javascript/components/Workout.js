import React from "react"
import PropTypes from "prop-types"
class Workout extends React.Component {
  render () {
    return (
      <div>
        <div>Text: {this.props.text}</div>
      </div>
    );
  }
}

Workout.propTypes = {
  text: PropTypes.string
};
export default Workout
