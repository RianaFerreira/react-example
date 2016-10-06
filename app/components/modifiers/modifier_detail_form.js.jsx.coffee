class @ModifierDetailForm extends React.Component
  constructor: ->
    super()
    this.state = {
      name: 'MODIFIER NAME',
      allowMultiSelect: false
    }
    this._handleFieldChange = this._handleFieldChange.bind(this)
    this._submitFormUpdates = this._submitFormUpdates.bind(this)

  componentWillReceiveProps: (nextProps) ->
    this.setState({
      name: nextProps.modifier.name || 'MODIFIER NAME',
      allowMultiSelect: nextProps.modifier.allowMultiSelect || false
    })

  _handleFieldChange: (event) ->
    this.setState({
      name: this.refs.nameInput.value,
      allowMultiSelect: this.refs.allowMultipleSelectionCheckbox.value
    })

  _submitFormUpdates: (event) ->
    # ajax put / post request to save modifier and options data
    updates = {
      name: this.state.name,
      allowMultiSelect: this.state.allowMultiSelect
    }
    # hide the modifier detail panel
    this.props.onClick()

  render: ->
    return (
      `<form className=" form-horizontal main-content-container">
        <div className="form-group">
          <div className="col-md-12">
            <div className="form-control">
              <input className="form-control-input"
                type="text"
                ref="nameInput"
                value={this.state.name}
                onChange={this._handleFieldChange} />
            </div>
          </div>
        </div>

        <hr/>
        <ModifierOptionFields modifierOptions={this.props.modifierOptions} />

        <hr/>
        <div className="form-group">
          <div className="col-md-12">
            <div className="form-control">
              <label>Allow customers to select multiple</label>
              <input className="pull-right"
                type="checkbox"
                ref="allowMultipleSelectionCheckbox"
                checked={this.state.allowMultiSelect}
                onChange={this._handleFieldChange}/>
            </div>
          </div>
        </div>

        <hr/>
        <div className="form-group">
          <div className="col-md-12">
            <div className="pull-right">
              <a href="#" className="btn btn-default" data-turbolinks="false" onClick={this._submitFormUpdates}>SAVE</a>
              <a href="#" className="btn btn-default button-left-margin" data-turbolinks="false" onClick={this.props.onClick}>CANCEL</a>
            </div>
          </div>
        </div>
      </form>`
    );
