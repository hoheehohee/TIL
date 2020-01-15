import React, { Component } from 'react';

class Ref extends Component {

  scrollToBotton = () => {
    const { scrollHeight, clientHeight } = this.box;    // 비구조화 할당문법
    this.box.scrollTop = scrollHeight - clientHeight;
  }
  render() {
    const style = {
      border: '1px solid black',
      height: '300px',
      width: '300px',
      overflow: 'auto',
      postition: 'relative'
    };

    const innerStyle = {
      width: '100%',
      height: '650px',
      background: 'linear-gradient(white, black)'
    }


    return (
      <div
        style={style}
        ref={(ref) => { this.box = ref }}
      >
        <div style={innerStyle} />
      </div>
    );
  }
}

export default Ref;