'use strict';

angular.module('navigator.patient')

.controller('PatientListCtrl', ['$scope', 'Patient',
function($scope, Patient) {
  Patient.list().$loaded(function(list) {
    $scope.patients = list;
  });
  $scope.orderProp = 'name';
}])

.controller('PatientDetailCtrl', ['$scope', '$routeParams', 'Patient', 'Notification', 'formatFilter',

function($scope, $routeParams, Patient, Notification) {
  var patientId = $routeParams.patientId;

  Patient.item(patientId).$bindTo($scope, "patient");

  $scope.acknowledge = function() {
    var message = {
      patientId: patientId,
      message: 'Your oncologist has recieved your CT Scan results. Get in touch!',
      datetime: new Date().getTime()
    };
    Notification.push(message);
  };

  $scope.reverse = function(field) {
    switch (field) {
      case "surge" :
      $scope.patient.surgicalComplete = !$scope.patient.surgicalComplete;
      break;
      case "emote" :
      $scope.patient.emotionalCUCompleted = !$scope.patient.emotionalCUCompleted;
      break;
      case "attend" :
      $scope.patient.attendenceConfirmed = !$scope.patient.attendenceConfirmed;
      break;
    }
  }
}]);
