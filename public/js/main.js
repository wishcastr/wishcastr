;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT

    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',

      controller: function ($http, $scope, API, $location) {
        setTimeout(function(){
          $http.get(API.BASE_URL+API.TOP_WISHES_PATH)
            .then(function(response){
              $scope.products = response.data;
              window.createWishBtnFloat();
          })//END OF PROMISE
        }, 1);

        $scope.starredProducts = {products: []};

        $scope.starProduct = function () {
          // $location.path('/wish-form');
          var star = $(event.target).closest('.star-link').find('.fa');
          var p = $(event.target).closest('.product');
          star.toggleClass('fa-star fa-star-o');
          var products = $scope.starredProducts.products;
          var product = {
            sku: p.attr('data-product-sku'),
            type: p.attr('data-product-source'),
            description: p.attr('title'),
            image_thumbnail: p.find('img').attr('src'),
            title: p.find('.product-title').text()
          } //END VAR PRODUCT

          if(star.hasClass('fa-star')){
            products.push(product);
          }else{
            products.splice(products.indexOf(product), 1);
          }

          if(products.length > 0){
            angular.element(".add-wish").css("display", "block");
          }else{
            angular.element(".add-wish").css("display", "none");
          }

        }//END STARPRODUCT SCOPE FUNCTION

        if (currentUser() !== null) {
          var user = currentUser();
          $http.get(API.BASE_URL + API.WISH_PATH + API.DRAFT_WISH, {
            params: {
              user_id: user.id,
              access_token: user.amz_access_token
              }//END PARAMS
            })
            .then(function(response){
              $scope.draft_wish = response.data;
              window.createWishBtnFloat();
          })
        }

        $scope.draftWish = function() {

          var user = currentUser();
          if(user){

            setTimeout(function(){
              $http.post(API.BASE_URL + API.WISH_PATH + API.DRAFT_WISH, $scope.starredProducts, {
                params: {
                  user_id: user.id,
                  access_token: user.amz_access_token
                }
              })
              .then(function(response){
                $scope.draft_wish = response.data;
                $location.path('/wish-form/'+$scope.draft_wish.id);
              })//END OF PROMISE
            }, 1);

          }else{
            console.log("You must sign up");
            //TODO prompt sign up modal
          } //END IF USER
        }//END DRAFTWISH SCOPE FUNCTION


      }//end of controller
    })//END OF TOP-WISHES

    .when ('/user-wishes/:wish_id', {
      templateUrl: 'partials/user-wishes.html',
      controller: function ($http, $scope, API) {
        wish_id = $routeParams.wish_id;
        var user = currentUser();

        if(user){
          setTimeout(function(){
            $http.get(API.BASE_URL+API.WISHES_PATH, {
              params: {
                user_id: user.id,
                access_token: user.amz_access_token
              }
            })
            .then(function(response){
              $scope.wishes = response.data;
            })//END OF PROMISE
          }, 1);
        }else{
          console.log("Shouldn't see this");
        }

        $scope.editWish = function(){
          var w = angular.element(event.target).closest('.wish');
          wish_id = w.attr("data-wish-id");
          console.log("Editing");
          console.log(wish);
          console.log(wish_id);

        };

        $scope.deleteWish = function(){
          var p = angular.element(event.target).closest('.product');
          console.log("Deleting");
        };

      }//end of controller
    })//END OF USER-WISHES

    .when ('/results', {
      templateUrl: 'partials/results.html',
      controller: function(Search, $location, $scope){
        $scope.wishForm = function() {          //ON CLICK TAKES YOU FROM /RESULTS
          $location.path('/wish-form');         //TO /WISH-FORM
        }
        var products = this;

        products.results = function(){
          return Search.results;
        };
      }, //END CONTROLLER
      controllerAs: 'products'
    })//END OF RESULTS PARTIAL

    .when ('/wish-form/:wish_id', {
      templateUrl: 'partials/wish-form.html',
      controller: function($location, $scope, $window, $http, $routeParams, API) {
        var wish_id = $routeParams.wish_id;
        console.log(wish_id);
        user = currentUser();

        setTimeout(function(){
          $http.get(API.BASE_URL + API.WISH_PATH + wish_id + ".json", {
            params: {
              user_id: user.id,
              access_token: user.amz_access_token
              }//END PARAMS
            })//END GET
            .then(function(response){
              $scope.wish = response.data;
              console.log($scope.wish);
            })//END PROMISE
        }, 1);

        $scope.submitWish = function() {

          setTimeout(function(){
            $http.patch(API.BASE_URL + API.WISH_PATH + $scope.wish.id + ".json", $scope.wish, {
              params: {
                user_id: user.id,
                access_token: user.amz_access_token
                }//END PARAMS
              }).then(function(response){
                $location.path('/user-wishes');
              })//END PATCH
          }, 1);
        };//SUBMITWISH

        $scope.goBack = function() {
          $window.history.back();
        };//goBack


      }//END CONTROLLER

    })//END WISH-FORM

  })//END OF MODULE

  .controller('Hello', function($scope) {
    if (currentUser() !== null) {
      $scope.name = currentUser().name;
    }
  })//END CONTROLLER HELLO

  .controller('SearchController', function($http, Search, API, $location){
    var search = this;
    search.query = '';

    search.find = function(){
      setTimeout(function(){
        $http.get(API.BASE_URL + API.SEARCH_PATH, {
          params: {
            query: search.query
          }
        }).then(function(response){
          Search.results = response.data;
          $location.path('/results');
        })
      }, 1);

      search.query = '';
    } // END find
  }) //END CONTROLLER
  .constant('API', {
    BASE_URL: '//localhost:3000',
    SEARCH_PATH: '/products/search.json',
    DRAFT_WISH: 'draft.json',
    WISHES_PATH: '/wishes.json',
    WISH_PATH: '/wishes/',
    TOP_WISHES_PATH: '/products/top.json'
  })
  .value('Search', {
    query: '',
    results: [],
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
    ar = d.getElementById('amazon-root');
    if(ar){
      ar.appendChild(a);
    };

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
        window.doRailsLogin(u);
      }); //END RETREVEPROFILE

    }); //END LOGIN.AUTHORIZE

    // $window.location.reload(); //FIXME: DOESN'T BREAK CODE BUT DOESN'T SOLVE RELOAD PROBLEM FOR HELLO CTLR

  }; //END DOAMAZONLOGIN

  window.doRailsLogin = function(u){
    var BASEURL = "//wishcastr-staging.herokuapp.com/login/amazon.json";
    $.ajax({
      type: "POST",
      url: BASEURL,
      data: {user: u},
      dataType: 'json'
    }).done(function(response){
      docCookies.removeItem('user');
      u.id = response.id;
      u.amz_raccess_token = response.amz_raccess_token;
      u.created_at = response.created_at;
      u.updated_at = response.updated_at;
      u.postal_code = response.postal_code;
      docCookies.setItem('user', JSON.stringify(u), 60*60*24*7);
      window.location = "#/user-wishes";
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
    }
  };

  $(document).ready(function(){
    toggleLoginDisplay();
  })

  window.createWishBtnFloat = function(){
    // $(window).scroll(function(){
    //   var maxScroll = $('footer').position().top-$(window).height()-$("footer").height()-$(".add-wish").height();
    //   console.log($(window).scrollTop(), maxScroll);
    //   if ($(window).scrollTop() >= maxScroll){
    //     $(".add-wish").css({
    //       position: 'absolute',
    //       bottom: $('footer').position().top + $(".add-wish").height(),
    //       top: '',
    //     });
    //   }else{
    //     $(".add-wish").css({
    //       position: 'fixed',
    //       top: '90%',
    //       bottom: ''
    //     });
    //   }
    // });
  }


})(); //END IFFE

