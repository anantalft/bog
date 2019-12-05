import React from 'react'
import {BoardRow} from "./board_row.js.jsx";
import WordArea from "./word_area.js";
import InputForm from "./input_form.js";
import Timer from "./timer.js";
import Message from "./message.js";

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
    this.handleReloadClick = this.handleReloadClick.bind(this);
  }

  handleTextChange(e, input_field) {
    if (e.key === 'Enter') {
      if (this.props.valid_words.indexOf(input_field.value) > -1) {
        if (!(this.state.words.indexOf(input_field.value) > -1)) {
          this.setState({words: this.state.words.concat(input_field.value)})
          this.setState({desc: 'Valid word'})
          this.setState({score: this.state.score + input_field.value.length})
        }
      } else {
        this.setState({desc: 'Invalid word. Try again'})
      }
      input_field.value = '';
    }
  }

  handleTimer(timer) {
    if (!timer)
      this.setState({timer: false})
  }

  handleReloadClick() {
    window.location.reload();
  }

  render() {
    const boardRows = this.props.board.map((board_row, i) => (
    <BoardRow key={i} board_row={board_row}/>
    ));

    return (
    <div>
      <button onClick={this.handleReloadClick.bind(this)}>
        Reload
      </button>
      <div>
        <Timer handleTimer={this.handleTimer.bind(this)}/>
      </div>

      <p>Valid words:{this.props.valid_words.join(",")} </p>

      <div><b>Score: </b> {this.state.score}</div>

      <Message input_words={this.state.words} valid_words={this.props.valid_words} timer={this.state.timer} desc={this.state.desc}/>

      <table border="1">
        <tbody>
        <tr>
          <td width="50%" valign="top">
            <b>Board</b>
            <table border="1">
              <tbody>
              <tr>
                <td colSpan="4">
                  <InputForm timer={this.state.timer}
                             handleTextChange={this.handleTextChange.bind(this)}/>
                </td>
              </tr>
              {boardRows}
              </tbody>
            </table>
          </td>
          <td width="50%" valign="top">
            <b>List of valid inputs</b>
            <WordArea words={this.state.words}/>
          </td>
        </tr>
        </tbody>
      </table>

    </div>)
  }
}
