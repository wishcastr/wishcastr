;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT

    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',

      controller: function ($http, $scope, API) {
        $http.get(API.BASE_URL+API.TOP_WISHES_PATH)
          .then(function(response){
            $scope.products = response.data;
          })//END OF PROMISE

        $scope.starProduct = function () {
          u = currentUser();
          if(u){
            var star = $(event.target).closest('.star-link').find('.fa');
            var product = $(event.target).closest('.product');
            star.toggleClass('fa-star fa-star-o');
            if(star.hasClass('fa-star')){

              var data = {
                product: {
                  sku: product.attr('data-product-sku'),
                  type: product.attr('data-product-source')
                }
              };

              var config = {
                headers: {
                  x_wishcastr_user_id: u.id,
                  x_wishcastr_access_token: u.amz_access_token,
                }
              };

              $http.post(API.BASE_URL+API.DRAFT_WISH_PATH, data, config)
              .then(function(response){
                $scope.draft_wish = response.data;
              })
              console.log($scope.draft_wish);
              //TODO PUT to Rails server for adding
            }else{
              console.log("removed item from wish");
              //TODO PUT to Rails server for removal
            }
          }else{
            console.log("You must sign up");
            //TODO prompt sign up modal
          }

        }
      }//end of controller
      // controller: function ($scope) {

    })//END OF TOP-WISHES

    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html',
      controller: function ($http, $scope, API) {
        var user = currentUser();

        if(user){
          var config = {
            headers: {
              x_wishcastr_user_id: user.id,
              x_wishcastr_access_token: user.amz_access_token,
            }
          };
          $http.get(API.BASE_URL+API.WISHES_PATH, config)
          .then(function(response){
            $scope.wishes = response.data;
          })//END OF PROMISE
        }else{
          console.log("Shouldn't see this");
        }
      }//end of controller
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
    })


  })//END OF MODULE


  .controller('SearchController', function($http, Search, API, $location){
    var search = this;
    search.query = '';

    search.find = function(){

      $http.get(API.BASE_URL + API.SEARCH_PATH, {
        params: {query: search.query}
      })
        .then(function(response){
          Search.results = response.data;
          $location.path('/results');
        })
    } // END find
  }) //END CONTROLLER
  .constant('API', {
    BASE_URL: '//wishcastr-staging.herokuapp.com',
    SEARCH_PATH: '/products/search.json',
    DRAFT_WISH_PATH: '/wishes/draft.json',
    WISHES_PATH: '/wishes.json',
    TOP_WISHES_PATH: '/products/top.json'
  })
  .value('Search', {
    query: '',
    results: [
      // { title: 'Bad Robot', current_price: '123.45' }
    ],
  })

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

  $('#amazon-root').on('click', function(){
    if(currentUser()){
      setTimeout(window.doLogout, 1);
    }else{
      setTimeout(window.doAmazonLogin, 1);
    }
  });

  window.currentUser = function(){
    return JSON.parse(docCookies.getItem('user'));
  }

  window.doLogout = function(){
    amazon.Login.logout();
    docCookies.removeItem('user');
    toggleLoginDisplay();
  };

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
        docCookies.setItem('user', JSON.stringify(u));
        setTimeout(window.doRailsLogin(u), 1);
      });

    });
  };

  window.doRailsLogin = function(u){
    var BASEURL = "//wishcastr-staging.herokuapp.com/login/amazon.json";
    $.ajax({
      type: "POST",
      url: BASEURL,
      data: {user: u},
      dataType: 'json'
    }).done(function(response){
      u.id = response.id;
      u.amz_raccess_token = response.amz_raccess_token;
      u.created_at = response.created_at;
      u.updated_at = response.updated_at;
      u.postal_code = response.postal_code;
      docCookies.setItem('user', JSON.stringify(u), 60*60*24*7);
      toggleLoginDisplay();
    });
  };

  //---LOGIN BUTTON DISAPPEARS-------
  function toggleLoginDisplay () {
    if(currentUser() === null) { //NO USER LOGGED IN
      $("#amazon-login").css("display", "block");
      $("#amazon-logout").css("display", "none");
    }else{ //USER LOGGED IN
      $('#amazon-login').css("display", "none");
      $("#amazon-logout").css("display", "block");
      window.location = "#/user-wishes";
    }
  };

  $(document).ready(function(){
    toggleLoginDisplay();
  })




})();

;(function(){


})();//END IFFE
