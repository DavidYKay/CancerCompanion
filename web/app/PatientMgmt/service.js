'use strict';

angular.module('navigator.patient.service', ["firebase"])

.factory('Patient', ['$firebaseArray', '$firebaseObject', '$q',
  function($firebaseArray, $firebaseObject, $q){

    var ref = new Firebase("https://burning-heat-9358.firebaseio.com/patients");

    return {
        list: function() {
          return $firebaseArray(ref);
        },

        item: function(key) {
          var itemRef = ref.child(key);
          return $firebaseObject(itemRef);
        }
    }
}]);
