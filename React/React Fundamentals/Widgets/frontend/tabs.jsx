import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { tabIndex: 0 };
  }

  selectTab(idx) {
    this.setState({ tabIndex: idx })
  }

  render() {
    const titles = this.props.tabData.map((tab, idx) =>
      <li onClick={this.selectTab.bind(this, idx)} key={idx} className={this.state.tabIndex === idx ? 'active' : ''}>{tab.title}</li>
    );

    const articleIdx = this.state.tabIndex;
    const article = this.props.tabData[articleIdx].content;

    return (
      <div className="tabs">
        <ul className="tab-titles">
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
