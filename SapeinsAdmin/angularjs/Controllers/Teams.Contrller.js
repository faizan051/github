var app = angular.module('app');
app.controller('TeamsController', function ($scope, HTTP, api, Constant, $rootScope) {

  init()
  $scope.PicBaseURL = api.ImageBaseUrl;
  function init() {
    GetTeams();
  }

  $scope.GetTeams = GetTeams;
  function GetTeams(SpecialityID, query) {
    HTTP.get(api.GetTeams + "?SpecialityID=" + SpecialityID + "&query=" + query, function (status, response) {
      if (status) {
        $scope.Teams = response.data;
      }
    })
  }

  $scope.UpdateTeam = UpdateTeam;
  function UpdateTeam(obj) {
    console.log("Addd")
    console.log(JSON.stringify(obj));
    localStorage.setItem("SelectedTeam", JSON.stringify(obj));
    window.location = "Add-teams.html";
  }

  $scope.Addteams = Addteams;
  function Addteams() {
    localStorage.setItem("SelectedTeam", null);
    window.location = "Add-teams.html";
  }

  $scope.DeleteUser = DeleteUser;
  function DeleteUser(USER) {
    USER.Status = false;
    HTTP.post(api.AddOrUpdateTeams, USER, function (status, response) {
      if (status) {

        location.reload();
      }
    })
  }


});