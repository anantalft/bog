import React from 'react'


export default class WordArea extends React.Component {

  render() {
    const words = this.props.words.map((word,i) => (
    <div key={i}>{word}</div>
    ));

    return (
    <div>
    <b>List of valid inputs</b>
    <div>
      {words}
    </div>
    </div>
    )
  }
}
