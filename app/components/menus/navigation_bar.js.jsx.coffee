class @NavigationBar extends React.Component
  render: ->
    return (
      `<div className="sub-navbar">
        <ul className="nav nav-pills">
          <li className="sub-navbar-placeholder"></li>
          <li role="navigation"><a href="/modifiers" data-turbolinks="false" id={this.props.modifierMenuClass || 'gray-sub-nav-link'}>MODIFIERS</a></li>
          { this.props.showNewModifierButton ? <NewModifierMenuButton /> : null }
        </ul>
      </div>`
    );
