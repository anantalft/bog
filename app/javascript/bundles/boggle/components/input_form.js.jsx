import React from 'react'

export default class InputForm extends React.Component {

  onKeyPress(e){
    this.props.handleTextChange(e,this.refs.filterTextInput)
  }

  componentDidMount(){
    this.refs.filterTextInput.focus();
  }

  render() {
    return (
    <div>
      <input disabled={!this.props.timer} placeholder="Insert Word" onKeyPress={this.onKeyPress.bind(this)} ref="filterTextInput"  type="text"/>
    </div>
    );
  }
}

