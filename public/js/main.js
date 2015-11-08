;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT
    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',
      controller: function ($http, $rootScope) {
        $http.get('//wishcastr-staging.herokuapp.com/products/top.json')
        .then(function(response){
          $rootScope.products = response.data;
        })//END OF PROMISE
      }//end of controller
    })//END OF TOP-WISHES
    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html',
      controller: function ($http, $rootScope) {
        var user = currentUser();
        var config = {
          headers: {
            x_wishcastr_user_id: user.id,
            x_wishcastr_access_token: user.amz_access_token,
          }
        };
        $http.get('/wishes.json', config)
        .then(function(response){
          $rootScope.wishes = response.data;
        })//END OF PROMISE
      }//end of controller
    })//END OF USER-WISHES
    .when ('/results', {
      templateUrl: 'partials/results.html'
    })//END OF RESULTS


  })//END OF MODULE
  .controller('Find', ['$http', '$scope', function($http, $scope){
    var BASEURL = '//wishcastr-staging.herokuapp.com/products/';

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

  $('#amazon-login').on('click', function(){
    setTimeout(window.doAmazonLogin, 1);
  });

  $('#amazon-logout').on('click', function(){
    setTimeout(window.doLogout, 1);
  });

  window.currentUser = function(){
    return JSON.parse(docCookies.getItem('user'));
  }

  window.doLogout = function(){
    amazon.Login.logout();
    docCookies.removeItem('user');
  };

  //TODO
  //window.doLogin

  window.doAmazonLogin = function(){
    options = {
      scope: 'profile'
    };
    amazon.Login.authorize(options, function(response) {
      if (response.error) {
        console.log('oauth error ' + response.error);
        return;
      }

      var userAccessToken = response.access_token;

      amazon.Login.retrieveProfile(userAccessToken, function(response) {
        var u = {};
        u.amz_access_token = userAccessToken;
        u.name = response.profile.Name;
        u.email = response.profile.PrimaryEmail;
        u.amz_id = response.profile.CustomerId.substr(response.profile.CustomerId.lastIndexOf('.') + 1);
        docCookies.setItem('user', JSON.stringify(u), 60*60*24*7);
        setTimeout(window.doRailsLogin(u), 1);
      });

    });
  };

  window.doRailsLogin = function(u){
    var BASEURL = "login/amazon.json";
      $.ajax({
        type: "POST",
        url: BASEURL,
        data: {user: u},
        success: null, //TODO: callback function
        dataType: 'json'
      });
  };



})();
