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
  'Notification', 'Checkpoint',

function($scope, $routeParams, Patient, Notification, Checkpoint) {
  var patientId = $routeParams.patientId;

  Patient.item(patientId).$bindTo($scope, "patient");
  Checkpoint().$bindTo($scope, "checkpoints");

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
      case "appt" :
      $scope.checkpoints.appointmentConfirmed = !$scope.checkpoints.appointmentConfirmed;
      break;
      case "emote" :
      $scope.checkpoints.emotionalCheckin = !$scope.checkpoints.emotionalCheckin;
      break;
      case "survey" :
      $scope.checkpoints.survey = !$scope.checkpoints.survey;
      break;
    }

  }
}]);
