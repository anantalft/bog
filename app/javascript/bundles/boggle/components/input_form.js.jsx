import React from 'react'

export default class InputForm extends React.Component {

  handleChange() {
    this.props.handleTextChange(this.refs.filterTextInput.value)
  }

  componentDidMount(){
    this.refs.filterTextInput.focus();
  }

  render() {
    return (
    <div>
      <input placeholder="Insert Word" ref="filterTextInput"  type="text" onChange={this.handleChange.bind(this)}/>
    </div>
    );
  }
}

