var app = angular.module('app');
app.controller('FooterController', function ($scope, $window, HTTP, api) {
  // app.controller('userController', function () {


  init();

  function init() {
    $scope.ImagePath = api.ImageBaseUrl;
    GetAllSpecialities();
   }
 
   $scope.GetAllSpecialities = GetAllSpecialities;
   function GetAllSpecialities() {
     HTTP.get(api.GetAllSpecialities
       , function (status, response) {
         if (status) {
           $scope.SpecialityList = response.data;
         }
       })
 
   }

});