class @ModifierList extends React.Component
  constructor: ->
    super()
    this.state = { modifierData: [] }

  componentWillMount: ->
    this._fetchModifierData()

  componentDidMount: ->
    this._timer = setInterval(( =>
      this._fetchModifierData()
    ), 50000)

  componentWillUnmount: ->
    clearInterval(this._timer)

  _optionNames: (modifier) ->
    optionNames = []
    modifier.options.map (option) -> optionNames.push(option.name)
    optionNames.join(', ')

  _fetchModifierData: ->
    $.ajax 'http://localhost:9292/modifiers',
      method: 'GET',
      dataType: 'json',
      success: (response) =>
        this.setState
          modifierData: response.data

  _registerModifierClickHandler: (modifierID) ->
    =>
      state = { modifierID: modifierID }
      window.dispatchEvent(new CustomEvent('showModifierDetail', {detail: state}))

  _modifierTableRows: ->
    # this is horrible, but I didn't know how else to reference the functions within the ModifierList context
    that = this

    this.state.modifierData.map((modifier, index) ->
      `<tr key={ index } onClick={that._registerModifierClickHandler(modifier.id)}>
        <td className="col-md-4">{ modifier.name }</td>
        <td className="col-md-5"> { that._optionNames(modifier) } </td>
        <td className="col-md-3">
          <a href="" className="btn button-table-action">APPLY</a>
          <span><a href="" className="glyphicon glyphicon-trash list-action"></a></span>
        </td>
      </tr>`
    )

  render: ->
    return (
      `<table className="table table-with-border" >
        <thead>
          <tr className="active">
            <th>NAME</th>
            <th colSpan="3">OPTIONS</th>
          </tr>
        </thead>
        <tbody>{ this._modifierTableRows() }</tbody>
      </table>`
    );
