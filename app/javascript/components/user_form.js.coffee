coefficients = {
  1: 1, 2: .943, 3: .906, 4: .881, 5: .851, 6: .831, 7: .807, 8: .786, 9: .765, 10: .744
}
@UserForm = React.createClass
  getInitialState: ->
    date: ''
    username: ''
    ismetric: false
    weightusered: ''
    repsperformed: ''
    onerm: '0'
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  toggleUnit: (e) ->
    e.preventDefault()
    @setState ismetric: !@state.ismetric
  calculateOneRm: ->
    if @state.weightusered and @state.repsperformed
        @state.onerm = @state.weightusered / coefficients[@state.repsperformed]
    else
      0
  valid: ->
    @state.date && @state.username && @state.weightusered && @state.repsperformed && @state.onerm
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { user: @state }, (data) =>
      @props.handleNewUser data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'date'
          name: 'date'
          value: @state.date
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'username'
          name: 'username'
          value: @state.username
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'weightusered'
          name: 'weightusered'
          value: @state.weightusered
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          min: 1
          max: 10
          className: 'form-control'
          placeholder: 'repsperformed'
          name: 'repsperformed'
          value: @state.repsperformed
          onChange: @handleValueChange
      React.DOM.button
        className: 'btn btn-primary'
        onClick: @toggleUnit
        'Metric = ' + @state.ismetric.toString()
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create User'
      React.createElement OneRmBox, onerm: @calculateOneRm()
