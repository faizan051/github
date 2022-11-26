var app = angular.module('app');
app.controller('teamController', function ($scope, $window, HTTP, api,$timeout) {
  // app.controller('userController', function () {

  init();

  function init() {
    $scope.ImagePath = api.ImageBaseUrl;
    $scope.SpecialityID = JSON.parse($window.localStorage.getItem('SpecialityID'));
    $scope.query = $window.localStorage.getItem('UniversalSearchQuery');
    GetAllSpecialities();
    GetTeams();
  }

  $scope.GetAllSpecialities = GetAllSpecialities;
  function GetAllSpecialities() {
   HTTP.get(api.GetAllSpecialities
      , function (status, response) {
        if (response.data != null) {
          $scope.SpecialityList = response.data;
       
        } 
      })
  }
  $scope.GetTeams = GetTeams;
  function GetTeams() {
    $scope.IsTeamFeedbackLoaded = false;
   HTTP.get(api.GetTeams
        +  "?SpecialityID=" +   ( $scope.SpecialityID == null ? null : ';'+$scope.SpecialityID+ ';')
        +  "&query=" + $scope.query
      , function (status, response) {
        if (response.data != null) {
          $scope.TeamList = response.data;
          $timeout(function () {
            for (var i = 0; i < $scope.TeamList.length; i++) {
              $('#customer_rating_' + i).rateit();

              $('#customer_rating_' + i).rateit('value', ($scope.TeamList[i].AverageRating == null ? 0 : $scope.TeamList[i].AverageRating));
              $('#customer_rating_' + i).rateit('readonly', true);
            }
            $scope.IsTeamFeedbackLoaded = true;
          }, 2000);
       
        } 
      })
  }
  $scope.SearchTeams = SearchTeams;
  function SearchTeams() {

    var SpecialityIDList=';';
    var IsSpeciallitySelected = false;
    for(var i = 0; i<$scope.SpecialityList.length; i++){
      if($scope.SpecialityList[i].IsSelected == true){
        IsSpeciallitySelected = true;
        SpecialityIDList+= $scope.SpecialityList[i].SpecialityID + ";";
      }
    }
    if(IsSpeciallitySelected != true){
     
      SpecialityIDList = null;
    }

   HTTP.get(api.GetTeams
        +  "?SpecialityID=" + SpecialityIDList
        +  "&query=" + $scope.teamSearchQuery
      , function (status, response) {
        if (response.data != null) {
          $scope.TeamList = response.data;
       
        } 
      })
  }

  $scope.BookAppointment = BookAppointment;
  function BookAppointment(obj) {
    console.log(JSON.stringify(obj))
    localStorage.setItem('selectedteam',JSON.stringify(obj));
    window.location = "booking.html";
  }
  

});