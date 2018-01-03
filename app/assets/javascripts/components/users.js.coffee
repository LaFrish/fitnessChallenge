@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h1
        className: 'title'
        'Users'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null
            React.DOM.th null, 'Date'
            React.DOM.th null, 'User Name'
            React.DOM.th null, 'Weight Usered'
            React.DOM.th null, 'Reps Performed'
            React.DOM.th null, '1 RM'
          React.DOM.tbody null,
            for user in @state.users
              React.createElement User, key: user.id, user: user
