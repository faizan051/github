var app = angular.module('app');
app.controller('DashboardController', function ($scope,$timeout, $window, HTTP, api) {

  init();

  function init() {

    $scope.$watch("SpecialityList", function (value) { 
      var val = value || null;
      if (val) {
        if ($('.specialities-slider').length > 0) {
          $timeout(function () {
            // $('.specialities-slider').not('.slick-initialized').slick({
            $('.specialities-slider').slick({
              dots: true,
              autoplay: false,
              infinite: true,
              variableWidth: true,
              prevArrow: false,
              nextArrow: false
            });
          });
  
        }
      }
    });
  


    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserInfo = JSON.parse(localStorage.getItem('UserInfo'));
    GetAllSpecialities();
    GetTeams();
  }

  $scope.GoToTeams = GoToTeams;
  function GoToTeams(SpecialityObj) {
    $window.localStorage.setItem('SpecialityID',SpecialityObj.SpecialityID);
    $window.localStorage.setItem('UniversalSearchQuery',null);
    window.location.href = 'team.html'
  }
  $scope.GoTo = GoTo;
  function GoTo(module) {
    $window.localStorage.setItem('SpecialityID',null);
    $window.localStorage.setItem('UniversalSearchQuery',null);
    window.location.href = module + '.html';
  }
  $scope.GetTeams = GetTeams;
  function GetTeams() {
    HTTP.get(api.GetTeams
      + "?SpecialityID=" + null
      + "&query=" + null
      , function (status, response) {
        if (response.data != null) {
          $scope.TeamList = response.data;
        }
      })
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