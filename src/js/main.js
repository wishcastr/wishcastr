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
      controller: function(Search){
        var products = this;

        products.results = function(){
          return Search.results;
        };
      },
      controllerAs: 'products'
    })//END OF RESULTS


  })//END OF MODULE
  .controller('SearchController', function($http, Search, API){
    var search = this;

    search.query = '';

    //  Capture a submit event for our search form...NG-Submit
    search.find = function(){
      Search.query = this;
      // TODO: Capture the query...
      //  Make a GET request to the Rails API...
      // $http({
      //   method: 'GET', url: API.BASE_URL + API.SEARCH_PATH,
      //   params: { puppy: 'bad' }
      // })
      // GET .../search.json?query=pineapple
      $http.get(API.BASE_URL + API.SEARCH_PATH, {
        params: Search.query  // Put the query here?
      })
        .then(function(response){
          //  Attach the results to the `Search` service...
          Search.results = response.data;
        })
    } // END find
  }) //END CONTROLLER
  .constant('API', {
    BASE_URL: 'http://wishcastr-staging.herokuapp.com',
    SEARCH_PATH: '/products/search.json'
  })
  .value('Search', {
    query: '',
    results: [
      // { title: 'Bad Robot', current_price: '123.45' }
    ],
  })
  // .factory('Search', function($http, API){
  //   var results = [
  //     { title: 'Bad Robot', current_price: '123.45' }
  //   ];
  //
  //   return {
  //     query: '',
  //     find: function(query){
  //       // TODO: Make a GET request to the Rails API...
  //       // TODO: Keep the results...
  //       // TODO: Return the Promise...
  //     }, // END find
  //     results: function(){
  //       return results;
  //     }
  //   }
  // })



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
