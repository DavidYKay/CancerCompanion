'use strict';

// Declare app level module which depends on views, and components
angular.module('navigator', [
  'ngRoute',
  'navigator.patient',
  'firebase',
  'navigator.notifications',
  'navigator.filters'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/list'});
}]);
