import React, { Component } from "react";

class ToggleBox extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      opened: false,
    };
    this.toggleBox = this.toggleBox.bind(this);
  }

  toggleBox() {
    const { opened } = this.state;
    this.setState({
      opened: !opened,
    });
  }

  render() {
    var { title, children } = this.props;
    const { opened } = this.state;

    if (opened){
      title ='Hide words';
    }else{
      title ='Show all valid words';
    }

    return (
    <div>
      <div style={{color:'blue', cursor: 'pointer'}} onClick={this.toggleBox}>
        {title}
      </div>
      {opened && (
      <div>
        {children}
      </div>
      )}
    </div>
    );
  }
}

export default ToggleBox;
