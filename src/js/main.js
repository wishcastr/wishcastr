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
      controller: function(searchFactory, $scope){
        $scope.data = {};
        $scope.updateParam = function() {
          searchFactory.setParam($scope.data);
        }
        $scope.submitParam = function() {
          searchFactory.callApi()
          .then(function(response){
            $scope.products = response.data;
          })//end promise
        }//END SUBMITPARAM
      }, //END CONTROLLER
      controllerAs: 'searchResults'
    })//END OF RESULTS


  })//END OF MODULE
  .controller('Find', [ 'searchFactory', function($scope, searchFactory){
    $scope.data = {};
    $scope.updateParam = function() {
      searchFactory.setParam($scope.data);
    }
    $scope.submitParam = function() {
      searchFactory.callApi()
      .then(function(response){
        $scope.products = response.data;
      })//end promise
    }//END SUBMITPARAM
  }]) //END CONTROLLER

  .factory('searchFactory', function($http, $q){
    var query = {};
    var BASEURL = 'http://wishcastr-staging.herokuapp.com/products/search.json?query=';
    var _param = '';
    var _searchUrl = '';

    var makeUrl = function(){
      _param = _param.split(' ').join('+');
      _searchUrl = BASEURL + _param;
      return _searchUrl;
    }
    query.setParam = function(param) {
      _param = param;
    }
    query.getParam = function() {
      return _param;
    }
    query.callApi = function() {
      searchUrl();
      var deferred = $q.defer();
      $http({
        method: get,
        url: _searchUrl,
      })
      .success(function(data){
        deferred.resolve(data);
      }).error(function(){
        deferred.reject('Item not found');
      })
      return deferred.promise;
    }
    return query;
  })//END OF FACTORY!!!

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
