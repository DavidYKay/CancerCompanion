'use strict';

angular.module('navigator.patient')

.controller('PatientListCtrl', ['$scope', 'Patient',
  function($scope, Patient) {
    Patient.list().$loaded(function(list) {
      $scope.patients = list;
    });
    $scope.orderProp = 'name';
}])

.controller('PatientDetailCtrl', ['$scope', '$routeParams', 'Patient',
  function($scope, $routeParams, Patient) {
    Patient.item($routeParams.patientId).then(function(patient) {
      $scope.patient = patient;
    });
}]);
