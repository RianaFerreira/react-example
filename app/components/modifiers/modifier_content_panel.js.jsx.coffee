class @ModifierContentPanel extends React.Component
  # This is the main container is will display a list of existing modifiers
  # If one of the modifiers are clicked the details are displayed to the right
  # of the list containing the modifier and it's option details.
  # Alternatively a button on the Navbar can be clicked to add a new modifier.
  constructor: ->
    super()
    this.state = {
      showModifierDetail: false,
      modifierID: '',
      mainPanelSize: 'col-md-12'
    }
    this._onModifierClick = this._onModifierClick.bind(this)
    this._hideModifierDetailPanel = this._hideModifierDetailPanel.bind(this)

  componentDidMount: ->
    window.addEventListener 'showModifierDetail', this._onModifierClick

  componentWillUnmount: ->
    window.removeEventListener 'showModifierDetail', this._onModifierClick

  _onModifierClick: (event) ->
    this.setState({
      showModifierDetail: true,
      modifierID: event.detail.modifierID,
      mainPanelSize: 'col-md-8'
    })

  _hideModifierDetailPanel: (event) ->
    this.setState({
      showModifierDetail: false,
      mainPanelSize: 'col-md-12'
    })

  render: ->
    return (
      `<div className="container-fluid">
        <div className="row">
          <div className={'table-container ' + this.state.mainPanelSize} id="modifier-main-panel">
            <ModifierList />
          </div>
          { this.state.showModifierDetail ? <ModifierDetail modifierID={this.state.modifierID} onClick={this._hideModifierDetailPanel} /> : null }
        </div>
      </div>`
    );
