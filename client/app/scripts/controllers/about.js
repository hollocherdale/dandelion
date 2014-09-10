'use strict';

/**
 * @ngdoc function
 * @name dandelionApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the dandelionApp
 */
angular.module('dandelionApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
