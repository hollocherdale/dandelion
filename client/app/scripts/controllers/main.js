'use strict';

/**
 * @ngdoc function
 * @name dandelionApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the dandelionApp
 */
angular.module('dandelionApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
