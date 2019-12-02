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
    this.handleReloadClick = this.handleReloadClick.bind(this);
  }

  handleTextChange(e, input_field) {
    if (e.key === 'Enter') {
      if (this.props.valid_words.indexOf(input_field.value) > -1) {
        if (!(this.state.words.indexOf(input_field.value) > -1)){
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


  handleTimer(timer){
    if(!timer)
      this.setState({timer: false})
  }

  handleReloadClick(){
    window.location.reload();
  }

  render() {
    const boardRows = this.props.board.map((board_row, i) => (
    <BoardRow key={i} board_row={board_row}/>
    ));

    const isAllWords = this.state.words;
    let message;

    if (isAllWords.length == this.props.valid_words.length && this.props.valid_words.length > 0 ){
      message = <div>Congratulations.Reload page to play again.</div>
    }else {
      if (this.state.timer){
        message = <div>
          <p>Please find {this.props.valid_words.length} words from board.</p>
          <p style={{color:"green"}}> {this.state.desc} </p>
        </div>
      }else{
        message = <div>Times Up. Reload page to play again. <p><b>Valid words:</b> {this.props.valid_words.join(",")} </p></div>
      }

    }

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
      {message}
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
