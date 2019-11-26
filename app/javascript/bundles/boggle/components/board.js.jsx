import React from 'react'
import {BoardRow} from "./board_row.js.jsx";
import WordArea from "./word_area.js";
import InputForm from "./input_form.js";

export default class Board extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      words: [],
      desc: ''
    }
    this.handleTextChange = this.handleTextChange.bind(this);
  }

  handleTextChange(e, input_text) {
    if (e.key === 'Enter') {
      if (this.props.valid_words.indexOf(input_text) > -1) {
        if (!(this.state.words.indexOf(input_text) > -1)){
          this.setState({words: this.state.words.concat(input_text)})
          this.setState({desc: 'Valid word'})
        }
      } else {
        this.setState({desc: 'Invalid word. Try again'})
      }
    }
  }

  render() {
    const boardRows = this.props.board.map((board_row) => (
    <BoardRow board_row={board_row}/>
    ));

    const isAllWords = this.state.words;
    let message;

    if (isAllWords.length == this.props.valid_words.length){
      message = <div>Congratulations. Please reload to play again.</div>
    }else {
      message = <div>Continue playing ...</div>
    }

    return (<div>
      <div>Please find {this.props.valid_words.length} words from board.</div>
      {message}
      <div>Score: 0</div>
      <div>{this.state.desc}</div>
      <table border="1">
        <tbody>
        <tr>
          <td width="50%">
            Board
            <table border="1">
              <tbody>
              <tr>
                <td colSpan="4"><InputForm
                handleTextChange={this.handleTextChange.bind(this)}/></td>
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
