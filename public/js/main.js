;(function(){
  angular.module('Wishcastr', ['ngRoute'], function($routeProvider){
    $routeProvider
    .when ('/', {
      redirectTo: 'top-wishes'
    })//END OF REDIRECT

    .when ('/top-wishes', {
      templateUrl: 'partials/top-wishes.html',

      controller: function ($http, $scope, API, $location, auth) {
        setTimeout(function(){
          $http.get(API.BASE_URL+API.TOP_WISHES_PATH)
            .then(function(response){
              $scope.products = response.data;
          })//END OF PROMISE
        }, 1);

        $scope.currentUser = auth.currentUser();

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

          if(products.length > 0 && $scope.currentUser !== null){
            angular.element(".add-wish").css("display", "block");
          }else{
            angular.element(".add-wish").css("display", "none");
          }
          if(products.length > 0 && $scope.currentUser == null){
            angular.element(".add-wish-but-login").css("display", "block");
          }else{
            angular.element(".add-wish-but-login").css("display", "none");
          }

        }//END STARPRODUCT SCOPE FUNCTION

        // if (auth.currentUser() !== null) {
        //   var user = auth.currentUser();
        //   $http.get(API.BASE_URL + API.WISH_PATH + API.DRAFT_WISH, {
        //     params: {
        //       user_id: user.id,
        //       // name: $scope.starredProducts.products[0].title,
        //       access_token: user.amz_access_token
        //       }//END PARAMS
        //     })
        //     .then(function(response){
        //       $scope.draft_wish = response.data;
        //   })
        // }

        $scope.draftWish = function() {
          var user = auth.currentUser();
          if(user){
            setTimeout(function(){
              $http.post(API.BASE_URL + API.WISH_PATH + API.DRAFT_WISH, $scope.starredProducts, {
                params: {
                  user_id: user.id,
                  name: $scope.starredProducts.products[0].title,
                  access_token: user.amz_access_token
                }
              })
              .then(function(response){
                $scope.draft_wish = response.data;
                $location.path('/wish/'+$scope.draft_wish.id);
              })//END OF PROMISE
            }, 1);

          }else{
            console.log("You must sign up");
            //TODO prompt sign up modal
          } //END IF USER
        }//END DRAFTWISH SCOPE FUNCTION

      } //end of controller
    })//END OF TOP-WISHES

    .when ('/user-wishes', {
      templateUrl: 'partials/user-wishes.html',
      controller: function ($http, $scope, API, $location, auth) {
        var user = auth.currentUser();

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

        $scope.editWish = function(){
          var wish_id = angular.element(event.target).closest('.wish').attr("data-wish-id");
          $location.path('/wish/'+wish_id);
        };

        $scope.deleteWish = function(){
          var wish_id = angular.element(event.target).closest('.wish').attr("data-wish-id");
          console.log("Deleting "+wish_id);
          //TODO: ADD CONFIRMATION
          $http.delete(API.BASE_URL + API.WISH_PATH + wish_id, {
            params: {
              user_id: user.id,
              access_token: user.amz_access_token
            }
          })
          .then(function(response){
            var me = angular.element('.wish[data-wish-id='+wish_id+']');
            me.addClass('animated flipOutY');
            me.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
              me.remove();
            });
          });
        };
      }//end of controller
    })//END OF USER-WISHES

    .when ('/results', {
      templateUrl: 'partials/results.html',
      controller: function(Search, $location, $scope){
        $scope.wishForm = function() {          //ON CLICK TAKES YOU FROM /RESULTS
          $location.path('/wish');         //TO /WISH-FORM
        }
        var products = this;

        products.results = function(){
          return Search.results;
        };


      }, //END CONTROLLER
      controllerAs: 'products'
    })//END OF RESULTS PARTIAL

    .when ('/wish/:wish_id', {
      templateUrl: 'partials/wish-form.html',
      controller: function($location, $scope, auth, $window, $http, $routeParams, API) {
        var wish_id = $routeParams.wish_id;
        user = auth.currentUser();

        setTimeout(function(){
          $http.get(API.BASE_URL + API.WISH_PATH + wish_id + ".json", {
            params: {
              user_id: user.id,
              access_token: user.amz_access_token
              }//END PARAMS
            })//END GET
            .then(function(response){
              $scope.wish = response.data;
            })//END PROMISE
        }, 1);

        $scope.removeProduct = function() {
          var p = $(event.target).closest('.form-item');
          console.log(p);
          console.log($scope.wish);

          var product = {
            sku: p.attr('data-product-sku'),
            type: p.attr('data-product-source')
          } //END VAR PRODUCT

          $scope.wish.products.splice($scope.wish.products.indexOf(product), 1);

          console.log($scope.wish);

        }

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
  .controller('Hello', function($scope, auth) {
    $scope.currentUser = auth.currentUser;
    $scope.toggleLogin = auth.toggleLogin;

    $scope.loginCommand = function() {
      if($scope.currentUser() == null){
        return "Login";
      }else{
        return "Logout";
      }
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


  .controller('Tabs', function($scope, $location, auth){
    console.log($location.path());

    $scope.currentUser = auth.currentUser;

    $scope.userView = function(){
      if ($location.path() == '/user-wishes'){
        return true;
      }else{
        return false;
      };
    }

    $scope.topView = function(){
      if ($location.path() == '/top-wishes'){
        return true;
      }else{
        return false;
      };
    }

    $scope.resultView = function(){
      if ($location.path() == '/results'){
        return true;
      }else{
        return false;
      };
    }
  })// END TABS CONTROLLER

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
  .factory('auth', ['$http', 'API', function($http, API){
    var auth = {};

    auth.currentUser = function(){
      return JSON.parse(docCookies.getItem('user'));
    };

    auth.toggleLogin = function(){
      if(auth.currentUser()){
        setTimeout(auth.doLogout, 1);
      }else{
        setTimeout(auth.doAmazonLogin, 1);
      }
    }

    auth.doLogout = function(){
      amazon.Login.logout();
      docCookies.removeItem('user');
      window.location = "#/top-wishes";
    };

    auth.doAmazonLogin = function(){
      amazon.Login.setClientId('amzn1.application-oa2-client.91ae74641b2d4550959bd7109c2f2cba');
      amazon.Login.authorize({scope: 'profile'}, function(response) {
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
          auth.doRailsLogin(u);
        }); //END RETREVEPROFILE
      }); //END LOGIN.AUTHORIZE
    }; //END DOAMAZONLOGIN

    auth.doRailsLogin = function(u){
      $.ajax({
        type: "POST",
        url: API.BASE_URL + '/login/amazon.json',
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
      });
    };
    return auth;
  }])



})(); //END OF ANGULAR IFFE


// Amazon Login SDK
;(function(){

  (function(d) {
    var a = d.createElement('script');
    a.type = 'text/javascript';
    a.async = true;
    a.id = 'amazon-login-sdk';
    a.src = 'https://api-cdn.amazon.com/sdk/login1.js';
    ar = d.getElementById('amazon-load');
    if(ar){
      ar.appendChild(a);
    };

  })(document);


//------TABS-------------
  // $('#top-view').on('click', function () {
  //   $('#top-view').addClass('selected');
  //   $('#user-view').removeClass('selected');
  // });


})();//END IFFE
