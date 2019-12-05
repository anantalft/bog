import React from "react";

export default class Message extends React.Component {

  render() {
    let message;

    if (this.props.input_words.length == this.props.valid_words.length && this.props.valid_words.length > 0) {
      message = <div style={{color: "green"}}><p>Congratulations. Reload page to play again.</p></div>
    }else if (this.props.timer) {
      message = <div>
        <p>Please find {this.props.valid_words.length} words from board.</p>
        <p style={{color: "green"}}> {this.props.desc} </p>
      </div>
    }else{
      message = <div><p style={{color:"red"}}>Times Up. Reload page to play again.</p> <p><b>Valid
        words:</b> {this.props.valid_words.join(",")} </p></div>
    }

    return (
    <div>
    {message}
    </div>
    )
  }
}
