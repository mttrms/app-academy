import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { tabIndex: 0 };
  }

  render() {
    const titles = this.props.tabData.map((tab, idx) =>
      <li key={idx}>{tab.title}</li>
    );

    const articleIdx = this.state.tabIndex;
    const article = this.props.tabData[articleIdx].content;

    return (
      <div className="tabs">
        <ul>
          { titles }
        </ul>
        <article>
          { article }
        </article>
      </div>
    )
  }
}

export default Tabs;
