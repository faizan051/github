var app = angular.module('app');
app.controller('MedicineOrdersController', function ($scope, $window, HTTP, api, $rootScope, Constant) {
  // app.controller('userController', function () {


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
      GetMedicineOrdersReport($scope.startDate, (new Date()));
      // GetAllLabTests(null);
      // GetAllLabs(null);
    }
  }


  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = ToModule + '.html'
  }




  $scope.LabTestList = [];
  $scope.GetMedicineOrdersReport = GetMedicineOrdersReport;
  function GetMedicineOrdersReport(startdate, enddate, labid, labtestId) {

    HTTP.get(api.GetMedicineOrdersReport
      + "?StartDate=" + Constant.dateformate(startdate)
      + "&EndDate=" + Constant.dateformate(enddate), function (status, response) {
        $scope.MedicineList = response.data;
      });

  }

  $scope.TotalAmount = 0;
  $scope.calculateTotals = calculateTotals;
  function calculateTotals(Amount) {
    $scope.TotalAmount = $scope.TotalAmount + Amount;
  }

  $scope.PatientDetails_modal = PatientDetails_modal;
  function PatientDetails_modal(obj) {
    $scope.SelectedObj = obj;
    console.log(obj);
    $('#PatientDetails_modal').modal('show');
  }


  function getFirstDayPreviousMonth() {
    const date = new Date();
    return new Date(date.getFullYear(), date.getMonth() - 1, 1);
  }

  $scope.MarkMedicineOrderAsDelivered = MarkMedicineOrderAsDelivered;
  function MarkMedicineOrderAsDelivered(med) {

    HTTP.get(api.MarkMedicineOrderAsDelivered + "?PatientMedicineOrderID=" + med.PatientMedicineOrderID, function (status, response) {
      location.reload();
    })

  }







});