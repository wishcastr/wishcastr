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
    $scope.search = function(){
      $http.get(BASEURL+'search.json?query='+$scope.query)
      .then(function(response){
        $scope.products = response.data;
      })//END PROMISE
    }//END searchParam()
  }])

})(); //END OF IFFE


// Amazon Login SDK
;(function(){
  window.onAmazonLoginReady = function() {
      amazon.Login.setClientId('amzn1.application-oa2-client.91ae74641b2d4550959bd7109c2f2cba');
  };
  (function(d) {
    var a = d.createElement('script');
    a.type = 'text/javascript';
    a.async = true;
    a.id = 'amazon-login-sdk';
    a.src = 'https://api-cdn.amazon.com/sdk/login1.js';
    d.getElementById('amazon-root').appendChild(a);
  })(document);

  document.getElementById('amazon-login').onclick = function(){
    setTimeout(window.doLogin, 1);
    return false;
  };

  window.doLogin = function(){
    options = {};
    options.scope = 'profile';
    amazon.Login.authorize(options, function(response) {
      if (response.error) {
        console.log('oauth error ' + response.error);
        return;
      }
      amazon.Login.retrieveProfile(response.access_token, function(response) {
          console.log(response);
      });
    });
  };

  document.getElementById('amazon-logout').onclick = function() {
    amazon.Login.logout();
    console.log("logged out");
  };
})();
