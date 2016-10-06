class @NewModifierMenuButton extends React.Component
  _handleModifierCreation: (event) =>
    event.preventDefault()
    state = { modifierID: '' }
    window.dispatchEvent(new CustomEvent('showModifierDetail', {detail: state}))

  render: ->
    return (
      `<a href="#"
        className="btn pull-right library-sub-nav-button"
        data-turbolinks="false"
        onClick={ this._handleModifierCreation }>
        NEW MODIFIER
      </a>`
    );
