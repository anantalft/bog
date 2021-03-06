import React from 'react'
import Board from "./board.js";
import ToggleBox from "./toggle_box.js";

export default class Boggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      valid_words: [],
      board: []
    };
    this.getDataFromAPI = this.getDataFromAPI.bind(this);
  }

  componentDidMount() {
    this.getDataFromAPI();
  }

  getDataFromAPI() {
    fetch('/api/v1/boggles.json')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
      this.setState({valid_words: data.valid_words, board: data.board})
    })
  }


  render() {
    return (
    <div>
      <div>
        <Board board={this.state.board} valid_words={this.state.valid_words}/>
      </div>
      <div><br/>
      <ToggleBox title="Show all valid words">
        <div> <b>Valid words: </b> {this.state.valid_words.join(",")} </div>
      </ToggleBox>
      </div>
    </div>
    )
  }
}
