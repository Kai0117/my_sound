import React from "react"
import PropTypes from "prop-types"

const Hello = (props) => {
  return (
    <React.Fragment>
      Name: {props.name}
    </React.Fragment>
  )
}

Hello.propTypes = {
  name: PropTypes.string
};

export default Hello
