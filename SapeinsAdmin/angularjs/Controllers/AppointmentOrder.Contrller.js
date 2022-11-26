var app = angular.module('app');
app.controller('ApointmentOrderController', function ($scope, HTTP, $window, api, Constant, $rootScope) {


  

  $scope.startDate = getFirstDayPreviousMonth();
  $scope.endDate = new Date();
  init();
  function init() {
    // $scope.UserImagePath = api.UserImagePath;
    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    $scope.UserTypes = Constant.UserTypes();
    if ($scope.UserInfo == null) {
      window.location.href = 'login.html';
    } else {
      GetAppointmentOrdersReport($scope.startDate, (new Date()), null, null);
      GetAllSpecialities();

      // GetAllLabTests(null);
      // GetAllLabs(null);
    }
  }


  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = ToModule + '.html'
  }





  $scope.ApponintmentOrderList = [];
  $scope.GetAppointmentOrdersReport = GetAppointmentOrdersReport;
  function GetAppointmentOrdersReport(startdate, enddate, SpecialityID, TeamID) {

    HTTP.get(api.GetAppointmentOrdersReport
      + "?StartDate=" + Constant.dateformate(startdate)
      + "&EndDate=" + Constant.dateformate(enddate)
      + "&SpecialityID=" + (SpecialityID == null ? null : (";" + SpecialityID + ";"))
      + "&TeamID=" + (TeamID == null ? null : (";" + TeamID + ";")), function (status, response) {

        $scope.ApponintmentOrderList = response.data;

      });
  }

  $scope.GetAllSpecialities = GetAllSpecialities;
  function GetAllSpecialities() {
    HTTP.get(api.GetAllSpecialities, function (status, response) {
      if (status) {
        console.log(response.data);
        $scope.Specialities = response.data;
      }
    });
  }


  $scope.GetTeams = GetTeams;
  function GetTeams(SpecialityID, query) {
    HTTP.get(api.GetTeams + "?SpecialityID=" + ";" + SpecialityID + ";" + "&query=" + query, function (status, response) {
      if (status) {
        $scope.Teams = response.data;
      }
    })
  }


  $scope.TotalAmount = 0;
  $scope.TotalFinalAmount = 0;
  $scope.calculateTotals = calculateTotals;
  function calculateTotals(obj) {
    $scope.TotalAmount = $scope.TotalAmount + obj.SessionCharges;
    $scope.TotalFinalAmount = $scope.TotalFinalAmount + obj.FinalAmount;
    
  }
  

  function getFirstDayPreviousMonth() {
    const date = new Date();
    return new Date(date.getFullYear(), date.getMonth() - 1, 1);
  }


  $scope.PatientDetails_modal = PatientDetails_modal;
  function PatientDetails_modal(obj) {
    $scope.SelectedObj = obj;
    console.log(obj);
    $('#PatientDetails_modal').modal('show');
  }

});