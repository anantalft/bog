import React from 'react'
import {BoardRow} from "./board_row.js.jsx";
import WordArea from "./word_area.js";
import InputForm from "./input_form.js";
import Timer from "./timer.js";

export default class Board extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      words: [],
      desc: '',
      score: 0,
      timer: true
    }
    this.handleTextChange = this.handleTextChange.bind(this);
    this.handleTimer = this.handleTimer.bind(this);
  }

  handleTextChange(e, input_text) {
    if (e.key === 'Enter') {
      if (this.props.valid_words.indexOf(input_text) > -1) {
        if (!(this.state.words.indexOf(input_text) > -1)){
          this.setState({words: this.state.words.concat(input_text)})
          this.setState({desc: 'Valid word'})
          this.setState({score: this.state.score + input_text.length})
        }
      } else {
        this.setState({desc: 'Invalid word. Try again'})
      }
    }
  }


  handleTimer(timer){
    if(!timer)
      this.setState({timer: false})
  }

  render() {
    const boardRows = this.props.board.map((board_row) => (
    <BoardRow board_row={board_row}/>
    ));

    const isAllWords = this.state.words;
    let message;

    if (isAllWords.length == this.props.valid_words.length){
      message = <div>Congratulations.Reload page to play again.</div>
    }else {
      if (this.state.timer){
        message = <div>Continue playing ...</div>
      }else{
        message = <div>Times Up. Reload page to play again.</div>
      }

    }

    return (
    <div>

      <div>
        <Timer handleTimer={this.handleTimer.bind(this)}/>
      </div>

      <div>
        {
          this.state.timer ? <p>Please find {this.props.valid_words.length} words from board.</p> :
          <p>Valid words: {this.props.valid_words.join(",")} </p>

        }
      </div>

      {message}

      <div>Score: {this.state.score}</div>

      <div>{this.state.timer===true ? this.state.desc: ""}</div>

      <table border="1">
        <tbody>
        <tr>
          <td width="50%">
            Board
            <table border="1">
              <tbody>
              <tr>
                <td colSpan="4">
                  <InputForm timer={this.state.timer} handleTextChange={this.handleTextChange.bind(this)}/>
                </td>
              </tr>
              {boardRows}
              </tbody>
            </table>
          </td>
          <td width="50%">
            <WordArea words={this.state.words}/>
          </td>
        </tr>
        </tbody>
      </table>

    </div>)
  }
}
