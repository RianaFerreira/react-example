class @ModifierOptionFields extends React.Component
  constructor: ->
    super()
    this.state = {
      options: [],
      name: 'Option Name',
      amount: '0.00'
    }
    this._handleFieldChange = this._handleFieldChange.bind(this)
    this._addNewOptionToList = this._submitFormUpdates.bind(this)

  componentWillReceiveProps: (nextProps) ->
    this.setState
      options: nextProps.modifierOptions

  _handleFieldChange: (event) ->
    this.setState
      name: this.refs.nameInput.value
      amount: this.refs.amountInput.value

  _addNewOptionToList: (event) ->
    # TODO:
    # Many options can be added for a modifier
    # all added options should be displayed in a list above
    # the fields to capture new modifier option details
    updates = {
      name: this.state.name,
      amount: this.state.amount
    }

  render: ->
    return (
      `<div className="form-group">
        <div className="col-md-12">
          <h5>MODIFIER OPTIONS</h5>
          <div className="form-control">
            <input className="form-control-group-input" type="text" ref="nameInput" value={this.state.name} onChange={this._handleFieldChange} />
            <input className="form-control-group-input" type="text" ref="amountInput" value={this.state.amount} onChange={this._handleFieldChange} />
          </div>
          <br/>
          <a href="#" className="btn button-brand-tertiary pull-right" onClick={this._addNewOptionToList}>ADD MODIFIER OPTION</a>
        </div>
      </div>`
    );
