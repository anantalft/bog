import React from 'react'
export const BoardRow = (props) => {

  var alphabets = props.board_row.map((alphabet, i) => {
    return(
     <td key={i}>{alphabet}</td>
    )
  })

  return(
  <tr>
    { alphabets}
  </tr>
  );
}
