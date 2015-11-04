;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT
    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',
      controller: function ($http, $scope) {
        $http.get('http://wishcastr-staging.herokuapp.com/products/top.json')
        .then(function(response){
            $scope.products = response.data;
        })//END OF PROMISE
      }//end of controller
    })//END OF TOP-WISHES
    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html'
    })//END OF USER-WISHES

    .when ('/results', {
      templateUrl: 'partials/results.html',
      controller: 'Find',
      controllerAs: 'results'
    })//END OF RESULTS


  })//END OF MODULE
  .controller('Find', function($scope, Search){
    $scope.data = {};
    $scope.updateParam = function() {
      Search.setParam($scope.data);
    }
    $scope.submitParam = function() {
      Search.callApi()
      .then(function(response){
        $scope.products = response.data;
      })//end promise
    }//END SUBMITPARAM
  }) //END CONTROLLER

  .factory('Search', function($http){
    var query = {};
    var BASEURL = 'http://wishcastr-staging.herokuapp.com/products/search.json?query=';
    var _param = '';
    var _searchUrl = '';

    var makeUrl = function(){
      _param = _param.split(' ').join('+');
      _searchUrl = BASEURL + _param;
      return _searchUrl;
    }
    query.setParam = function($scope.data) {      //REMEMBERS QUERY
      _param = $scope.data;
    }
    query.getParam = function() {       //GETS QUERY
      return _param;
    }
    query.callApi = function() {      //GETS THE RESULTS
      searchUrl();
      $http({
        method: get,
        url: _searchUrl,
      })
    }
    return query;
  })//END OF FACTORY!!!


  /*TODO:
  * remember query
  * go get results
  * gimme the query
  */

})(); //END OF IFFE



// .controller('Find', ['$http', '$scope', function($http, $scope){
//   var BASEURL = 'http://wishcastr-staging.herokuapp.com/products/';
//
//   $scope.query = "";
//   $scope.products = { };
//   console.log($scope.query);
//   $scope.search = function(){
//     $http.get(BASEURL+'search.json?query='+$scope.query)
//     .then(function(response){
//       $scope.products = response.data;
//     })//END PROMISE
//   }//END searchParam()
//
//   // this.products = { };
//   console.log($scope.query);
// }])
