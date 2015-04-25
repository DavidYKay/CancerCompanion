'use strict';

angular.module('navigator.patient', ['ngRoute', 'navigator.patient.service'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/list', {
    templateUrl: 'PatientMgmt/list.html',
    controller: 'PatientListCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/detail/:patientId', {
    templateUrl: 'PatientMgmt/detail.html',
    controller: 'PatientDetailCtrl'
  });
}]);
