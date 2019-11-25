import React from 'react'
import {BoardRow} from "./board_row.js.jsx";

export const Board = (props) => {
  var board_rows = props.board.map((board_row) => {
    return(
    <BoardRow board_row={board_row}/>
    )
  })
  return(
  <div>
    <table border="1">
      <tr>
        <td width="50%">
          Board
          <table border="1">
            <tr>
              <td colspan="4"><input type="text"/></td>
            </tr>
              {board_rows}
          </table>
        </td>
        <td width="50%">

        </td>
      </tr>
    </table>
  </div>
  )
}
