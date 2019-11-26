import React from 'react'
import {BoardRow} from "./board_row.js.jsx";
import WordArea from "./word_area.js";
import InputForm from "./input_form.js";

export default class Board extends React.Component {

  constructor(props) {
    super(props)
    this.state ={
      words:[]
    }
    this.handleTextChange = this.handleTextChange.bind(this);
  }

  handleTextChange(input_text) {
    if (this.props.valid_word.indexOf(input_text) > -1){
      console.log('mytrue')
      this.setState({words: input_text})
    }else{
      this.setState({words: "Not matched"})
      console.log('my false');
    }
  }

  render() {
    const boardRows = this.props.board.map((board_row) => (
    <BoardRow board_row={board_row}/>
    ));

    return (<div>
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
            <WordArea word={this.state.words}/>
          </td>
        </tr>
        </tbody>
      </table>
    </div>)
  }
}
