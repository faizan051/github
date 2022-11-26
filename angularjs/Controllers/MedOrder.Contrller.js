var app = angular.module('app');
app.controller('MedOrderController', function ($scope, $window, HTTP, api) {

  init();

  function init() {
    $scope.ImagePath = api.ImagePath;
    $scope.UserInfo = JSON.parse(localStorage.getItem('UserInfo'));
    GetPatientMedicineOrders();
     
  }

  
  $scope.GetPatientMedicineOrders = GetPatientMedicineOrders;
  function GetPatientMedicineOrders() {
    HTTP.get(api.GetPatientMedicineOrders
      + "?UserID=" + $scope.UserInfo.UserID
      , function (status, response) {
        if (status) {
          $scope.MedicineList = response.data;
        }
      })

  }

 


  // $scope.DetailModel = DetailModel;
  // function DetailModel(MedicineObj) {
 
  //   HTTP.get(api.GetPatientMedicineOrderDetails
  //     + "?PatientMedicineOrderID=" + MedicineObj.PatientMedicineOrderID
  //     , function (status, response) {
  //       if (status) {
  //         $scope.OrderDetailList = response.data;
  //       }
  //     })
  //     $('#DetailModelDiv').modal('show');
  // }

});