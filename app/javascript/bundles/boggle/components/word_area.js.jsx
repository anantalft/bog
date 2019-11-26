import React from 'react'


export default class WordArea extends React.Component {

  render() {
    return (
    <div>
      <div>{this.props.word}</div>
      <div>orange</div>
    </div>
    )
  }
}
