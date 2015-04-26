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

  Patient.item(patientId).then(function(patient) {
    $scope.patient = patient;
  });

  $scope.acknowledge = function() {
    var message = {
      patientId: patientId,
      message: 'Your oncologist has recieved your CT Scan results. Get in touch!',
      datetime: new Date().getTime()
    };
    Notification.push(message);
  };
}]);
