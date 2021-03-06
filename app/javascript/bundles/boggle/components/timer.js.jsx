import React, { Component } from 'react'

export default class Timer extends Component {
  state = {
    minutes: 3,
    seconds: 0,
  }


  componentDidMount() {
    this.myInterval = setInterval(() => {
      const { seconds, minutes } = this.state;

      if (seconds > 0) {
        this.setState( {seconds: seconds - 1 })
      }
      if (seconds === 0) {
        if (minutes === 0) {
          clearInterval(this.myInterval)
          this.props.handleTimer(false);
        } else {
          this.setState({
            minutes: minutes - 1,
            seconds: 59
          })
        }
      }
    }, 1000)
  }

  componentWillUnmount() {
    clearInterval(this.myInterval)
  }

  render() {
    const { minutes, seconds } = this.state
    return (
    <div>
      <p><b>Time Remaining:</b> {minutes}:{seconds < 10 ? `0${seconds}` : seconds}</p>
    </div>
    )
  }
}
