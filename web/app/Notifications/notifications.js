'use strict';

angular.module('navigator.notifications', ['firebase'])

.factory('Notification', ['$firebaseArray', '$q',
  function($firebaseArray, $q){

    var ref = new Firebase("https://burning-heat-9358.firebaseio.com/notifications");

    return {
        list: function() {
          return $firebaseArray(ref);
        },

        item: function(key) {
          var deffered = $q.defer();
          $firebaseArray(ref).$loaded().then(function(list) {
            var patient = list.$getRecord(key);
            if (patient) {
              deffered.resolve(patient);
            } else {
              deffered.reject("Patient not found");
            }
          });
          return deffered.promise;
        },

        push: function(message) {
          $firebaseArray(ref).$loaded().then(function(list){
            list.$add(message);
          });
          return;
        }
    }
}]);
