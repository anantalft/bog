import React from 'react'
import {Board} from "./board.js";

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
      </div>
      <div>
        <input type="button" value="Refresh"
               onclick="window.location.reload();"/>
      </div>
      <div>
        <Board board={this.state.board} valid_word={this.state.valid_words}/>
      </div>
    </div>
    )
  }
}
