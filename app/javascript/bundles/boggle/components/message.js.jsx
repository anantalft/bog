import React from "react";

export default class Message extends React.Component {

  render() {
    let message;

    if (this.props.input_words.length == this.props.valid_words.length && this.props.valid_words.length > 0) {
      message = <div style={{color: "green"}}><p>Congratulations. Reload page to play again.</p></div>
    }else if (this.props.timer) {
      message = <div>
        <p>Please find <b>{this.props.valid_words.length}</b> words from board. <br/><b>Remaining words: </b> {this.props.valid_words.length - this.props.input_words.length } </p>
        <p style={{color: "green"}}> {this.props.desc} </p>
      </div>
    }else{
      message = <div><p style={{color:"red"}}>Times Up. Reload page to play again.</p>
      </div>
    }

    return (
    <div>
      <div><b>Score: </b> {this.props.score}</div>
     {message}
    </div>
    )
  }
}
