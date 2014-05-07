app = angular.module("MMRApp",['ngResource'])

app.directive 'routeLocations', ($compile) ->
  templateURL: 'angular_templates/widgets/select_locations.html'

@RouteCtrl = ($scope, $resource) ->
  Route = $resource('/routes/:id.json', { id: '@id' }, {update: {method: 'PUT'}})
  Location = $resource('/locations/:id.json', { id: '@id' })
  $scope.routes = Route.query()
  $scope.locations = Location.query()
