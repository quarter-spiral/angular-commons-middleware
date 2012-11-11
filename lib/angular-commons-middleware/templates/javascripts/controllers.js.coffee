@UsersController = ($scope, $location, user) ->
  $scope.logout = ->
    user.logout()
    $location.path("/")

@UsersController.$inject = ['$scope', '$location', 'qs_commons_user']
