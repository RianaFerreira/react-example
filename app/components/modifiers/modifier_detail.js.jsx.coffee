class @ModifierDetail extends React.Component
  constructor: ->
    super()
    this.state = {
      modifier: [],
      modifier_options: []
    }

  _fetchModifierDetail: (modifierID) ->
    # a mock server renders the existing modifier with it's associated options
    #   get '/modifiers/:id' do
    #   {:id => 1,
    #    :name => 'Milk',
    #    :options => [{ :id => 1, :name => 'Skim', :amount => '0.50' },
    #                 { :id => 2, :name => 'Soy', :amount => '1.00' },
    #                 { :id => 3, :name => 'Almond', :amount => '1.50' }
    #                ]}.to_json
    # end
    $.ajax "http://localhost:9292/modifiers/#{modifierID}",
      method: 'GET',
      dataType: 'json',
      success: (response) =>
        this.setState
          modifier: response,
          modifier_options: response.options.map (modifier_option) -> modifier_option

  componentDidMount: ->
    this._fetchModifierDetail(this.props.modifierID) if this.props.modifierID isnt ''

  componentWillReceiveProps: (nextProps) ->
    if nextProps.modifierID isnt this.props.modifierID && (nextProps.modifierID isnt '')
      this._fetchModifierDetail(nextProps.modifierID)
    else if (nextProps.modifierID is '')
      this.setState({ modifier: [], modifier_options: [] })

  render: ->
    return (
      `<div className="hidden-xs hidden-sm col-md-4 form-container">
        <ModifierDetailForm
          modifier={this.state.modifier}
          modifierOptions={this.state.modifier_options}
          onClick={this.props.onClick} />
      </div>`
    );
