;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT

    .when('/wishes', {
      template: 'Hallo!',
      controller: function($routeParams){
        console.log($routeParams);
      }
    })

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

        $scope.draftWish = function() {
          $location.path('/wish-form');
          var user = currentUser();
          if(user){

            config = {
              params: {
                user_id: user.id,
                access_token: user.amz_access_token
              }
            };

            setTimeout(function(){
                $http.post(API.BASE_URL+API.DRAFT_WISH_PATH, $scope.starredProducts, config)
                .then(function(response){
                  $scope.draft_wish = response.data;
              })//END OF PROMISE
            }, 500);

          }else{
            console.log("You must sign up");
            //TODO prompt sign up modal
          } //END IF USER
        }//END DRAFTWISH SCOPE FUNCTION

      } //end of controller
    })//END OF TOP-WISHES

    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html',
      controller: function ($http, $scope, API) {
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
          }, 500);
        }else{
          console.log("Shouldn't see this");
          //TODO Hide User Wishes link when user is not logged in.
        };
        'Tabs';
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

    .when ('/wish-form', {
      templateUrl: 'partials/wish-form.html',
      controller: function($location, $scope, $window, $http, API) {
        $scope.submitWish = function() {
          $location.path('/user-wishes');
          setTimeout(function(){
            $http.patch(API.BASE_URL + '/wishes/' + $scope.draft_wish.id + ".json", $scope.draft_wish, {
              params: {
                user_id: user.id,
                access_token: user.amz_access_token
                }//END PARAMS
              })//END PATCH
          }, 500);
        };//SUBMITWISH

        $scope.goBack = function() {
          $window.history.back();
        };//goBack

        user = currentUser();
        setTimeout(function(){
          $http.get(API.BASE_URL+API.DRAFT_WISH_PATH, {
            params: {
              user_id: user.id,
              access_token: user.amz_access_token
            }
          }) //END GET
          .then(function(response){
            $scope.draft_wish = response.data;
            console.log($scope.draft_wish);
          })//END PROMISE
        }, 500);
      }//END CONTROLLER

    })//END WISH-FORM

  })//END OF MODULE

  .controller('Hello', function($scope) {
    $scope.currentUser = function(){
      return currentUser();
    }
    if (currentUser() !== null) {
      $scope.name = currentUser().name;
    }
  })//END CONTROLLER HELLO

  .controller('SearchController', function($http, Search, API, $location){
    var search = this;
    search.query = '';

    search.find = function(){
        $http.get(API.BASE_URL + API.SEARCH_PATH, {
          params: {
            query: search.query
          }
        }).then(function(response){
          Search.results = response.data;
          $location.path('/results');
        })

      search.query = '';
    } // END find
  }) //END SEARCH CONTROLLER


  .controller('Tabs', function($location){
  console.log($location.path());
      if ($location.path() == '/user-wishes'){
        var userView = true;
        var topView = false;
        // $('user-view').addClass('selected');
        // $('top-view').removeClass('selected');
      }

      if ($location.path() == '/top-wishes') {
        var userView = false;
        var topView = true;
        // $('user-view').removeClass('selected');
        // $('top-view').addClass('selected');
      }
  })// END TABS CONTROLLER

  .constant('API', {
    BASE_URL: '//wishcastr-staging.herokuapp.com',
    SEARCH_PATH: '/products/search.json',
    DRAFT_WISH_PATH: '/wishes/draft.json',
    WISHES_PATH: '/wishes.json',
    TOP_WISHES_PATH: '/products/top.json'
  })
  .value('Search', {
    query: '',
    results: [],
  })



})(); //END OF ANGULAR IFFE


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
      setTimeout(window.doLogout, 100);
    }else{
      setTimeout(window.doAmazonLogin, 100);
    }
  });

  window.currentUser = function(){
    return JSON.parse(docCookies.getItem('user'));
  }

  window.doLogout = function(){
    amazon.Login.logout();
    docCookies.removeItem('user');
    toggleLoginDisplay();
    window.location = '/#top-wishes';
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


  }; //END DOAMAZONLOGIN

  window.doRailsLogin = function(u){
    var BASEURL = "//wishcastr-staging.herokuapp.com/login/amazon.json";
    setTimeout(function(){
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
        window.location = "#/user-wishes";

      }, 500);
    });
  };

  //---LOGIN BUTTON DISAPPEARS-------
  function toggleLoginDisplay () {
    if(currentUser() === null) { //NO USER LOGGED IN
      $("#amazon-login").css("display", "block");
      $("#amazon-logout").css("display", "none");
      $('#welcome').addClass('hidden'); //TODO: DELETE ME IF WELCOME DOESN'T WORK
      $('#user-view').removeClass('active');
      window.location = '#/top-wishes';

    }else{ //USER LOGGED IN
      $('#amazon-login').css("display", "none");
      $("#amazon-logout").css("display", "block");
      $('#welcome').removeClass('hidden'); //TODO: DELETE ME IF WELCOME DOESN'T WORK
      $('#user-view').addClass('active');
      // $('#user-view').addClass('selected');


    }
  };

  // var loc = window.location.href; // returns the full URL
    //  if (window.location === '/#user-wishes') {
  // if (/user/.test(loc)){
  //   console.log('USER WISHES SORTA WORKS');
  //   $('#user-view').addClass('selected');
  //   $('#top-view').removeClass('selected');
  // }
    //  if (window.location === '/#top-wishes') {
  // if (/top-wishes/.test(loc)) {
  //   console.log('MAKE IT SO TOP WISHES');
  //   $('#user-view').removeClass('selected');
  //   $('#top-view').addClass('selected');
  // }

  $(document).ready(function(){
    toggleLoginDisplay();
  })

  window.createWishBtnFloat = function(){
  //   var fixedElementOffset = $('.add-wish').offset().top;
  //   var footerOffset = $('footer').offset().top + 3220;
  //   var fixedElementHeight = $('.add-wish').height();
  //
  //   // Check every time the user scrolls
  //   $(window).scroll(function (event) {
  //
  //     // Y position of the vertical scrollbar
  //     var y = $(this).scrollTop();
  //     // console.log(fixedElementOffset, y + fixedElementHeight, footerOffset);
  //
  //     if(y >= fixedElementOffset && (y + fixedElementHeight) < footerOffset) {
  //       $('.add-wish').addClass('fixed');
  //       $('.add-wish').removeClass('bottom');
  //     }else if(y >= fixedElementOffset && (y + fixedElementHeight) >= footerOffset) {
  //       $('.add-wish').removeClass('fixed');
  //       $('.add-wish').addClass('bottom');
  //     }else{
  //       $('.add-wish').removeClass('fixed bottom');
  //     }
  //   });
  }



//------TABS-------------







  //
  // $('#top-view').on('click', function () {
  //   // console.log('BOOM!');
  //   $('#top-view').addClass('selected');
  //   $('#user-view').removeClass('selected');
  // });
  //
  // $('#user-view').on('click', function() {
  //   $('#user-view').addClass('selected');
  //   $('#top-view').removeClass('selected');
  //   });








})();//END IFFE
