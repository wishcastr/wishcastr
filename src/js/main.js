;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT
    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',
      controller: function ($http, $rootScope) {
        $http.get('http://wishcastr-staging.herokuapp.com/products/top.json')
        .then(function(response){
            $rootScope.products = response.data;
        })//END OF PROMISE
      }//end of controller
    })//END OF TOP-WISHES
    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html'
    })//END OF USER-WISHES
    .when ('/results', {
      templateUrl: 'partials/results.html'
    })//END OF RESULTS


  })//END OF MODULE
  .controller('Find', ['$http', '$scope', function($http, $scope){
    var BASEURL = 'http://wishcastr-staging.herokuapp.com/products/';

    $scope.query = "";
    $scope.products = { };
    console.log($scope.query);
    $scope.search = function(){
      $http.get(BASEURL+'search.json?query='+$scope.query)
      .then(function(response){
        $scope.products = response.data;
      })//END PROMISE
    }//END searchParam()

    // this.products = { };
    console.log($scope.query);
  }])


})(); //END OF IFFE
