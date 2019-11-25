import React from 'react'

export default class Boggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
    // this.handleChangePage = this.handleChangePage.bind(this);
    // this.handleSearch = this.handleSearch.bind(this);
    // this.getDataFromAPI = this.getDataFromAPI.bind(this);
  }

  componentDidMount() {
    this.getDataFromAPI();
  }

  getDataFromAPI() {
    fetch('/api/v1/boggles.json')
    .then((response)=> {return response.json()})
    .then((data) => {
      this.setState({valid_words: data.valid_words, board: data.board})
    })
  }

  handleChangePage(page) {
    this.getDataFromAPI()
  }
  handleSearch(search_query) {
    this.getDataFromAPI(1, search_query)
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
        <table border="1">
          <tr>
            <td width="50%">
              Board
              <table border="1">
                <tr>
                  <td colspan="4"><input type="text"/></td>
                </tr>
              </table>
            </td>
            <td width="50%">

            </td>
          </tr>
        </table>
      </div>
    </div>
    )
  }
}
