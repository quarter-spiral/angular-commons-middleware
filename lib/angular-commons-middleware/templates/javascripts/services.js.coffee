# Services
services = angular.module("qsCommons.services", [])

services.factory "qs_commons_http", ["$q", "$http", (q, http) ->
  userService = null
  setUserService: (newService) ->
    userService = newService

  makeRequest: (options) ->
    method = options.method
    url = options.url
    body = options.body
    deferred = q.defer()
    requestOptions =
      method: method
      url: url

    requestOptions.data = body  if body
    if userService.currentUser()
      headers = Authorization: "Bearer " + userService.currentUser().token
    requestOptions["headers"] = headers || {}
    http(requestOptions).success((data, status, headers, config) ->
      if options.returns isnt `undefined`
        deferred.resolve options.returns(data, status, headers, config)
      else
        deferred.resolve()
    ).error (data, status, headers, config) ->
      deferred.reject data.error

    deferred.promise
]

services.factory "qs_commons_user", ["$rootScope", "$cookies", "qs_commons_http", (rootScope, cookies, http) ->
  rootScope.currentUser = null
  rootScope.loggedIn = false
  devcenterBackendUrl = window.qs.ENV["QS_DEVCENTER_BACKEND_URL"]

  storeLogin = (user) ->
    rootScope.currentUser = user
    rootScope.loggedIn = !!(rootScope.currentUser)
    user

  service =
    currentUser: ->
      user = rootScope.currentUser
      unless user
        cookie = angular.fromJson(cookies["qs_authentication"])
        user = storeLogin(cookie.info)  if cookie and cookie.info and cookie.info.uuid
      user

    logout: ->
      cookies["qs_authentication"] = angular.toJson(not: "loggedin")
      delete cookies["qs_authentication"]

      storeLogin null
      redirectUrl = window.location.protocol + "//" + window.location.host
      window.location.href = window.qs.ENV["QS_AUTH_BACKEND_URL"] + "/signout?redirect_uri=" + encodeURI(redirectUrl)

  http.setUserService service
  service
]
