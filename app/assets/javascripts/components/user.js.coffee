coefficients = {
  1: 1, 2: .943, 3: .906, 4: .881, 5: .851, 6: .831, 7: .807, 8: .786, 9: .765, 10: .744
}
@User = React.createClass
  getInitialState: ->
    edit: false
    onerm: @props.user.onerm
    ismetric: @props.user.ismetric
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteUser @props.user
  handleEdit: (e) ->
    e.preventDefault()
    data =
      date: ReactDOM.findDOMNode(@refs.date).value
      username: ReactDOM.findDOMNode(@refs.username).value
      weightusered: ReactDOM.findDOMNode(@refs.weightusered).value
      ismetric: @state.ismetric
      repsperformed: ReactDOM.findDOMNode(@refs.repsperformed).value
      onerm: @state.onerm
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser @props.user, data
  reCalculateOneRm: ->
    @setState onerm: @getOneRm( ReactDOM.findDOMNode(@refs.weightusered).value, ReactDOM.findDOMNode(@refs.repsperformed).value)
  getOneRm: (weight, reps) ->
    if weight and reps > 0 and reps < 11
      weight / coefficients[reps]
    else
      0
  toggleUnit: (e) ->
    e.preventDefault()
    @setState ismetric: !@state.ismetric
  userRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.date
      React.DOM.td null, @props.user.username
      React.DOM.td null, @props.user.weightusered
      React.DOM.td null, @props.user.repsperformed
      React.DOM.td null, @props.user.onerm
      React.DOM.td null, @props.user.ismetric.toString()
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Edit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  userForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: @props.user.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.user.username
          ref: 'username'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.user.weightusered
          ref: 'weightusered'
          onChange: @reCalculateOneRm
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          min: '1'
          max: '10'
          defaultValue: @props.user.repsperformed
          ref: 'repsperformed'
          onChange: @reCalculateOneRm
      React.DOM.td null,
        @state.onerm
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @toggleUnit
          'Metric = ' + @state.ismetric.toString()
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @userForm()
    else
      @userRow()
