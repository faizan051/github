var app = angular.module('app');
app.controller('OrderController', function ($scope, $window, HTTP, api, $rootScope, Constant) {
  // app.controller('userController', function () {


  init();
  function init() {
    // $scope.UserImagePath = api.UserImagePath;


    $scope.startDate = getFirstDayPreviousMonth();
    $scope.endDate = new Date();

    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    $scope.UserTypes = Constant.UserTypes();
    if ($scope.UserInfo == null) {
      window.location.href = 'login.html';
    } else {
      GetLabTestOrdersReport( $scope.startDate, (new Date()), null, null);
      GetAllLabTests(null);
      GetAllLabs(null);
    }
  }


  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = ToModule + '.html'
  }




  $scope.LabTestList = [];
  $scope.GetLabTestOrdersReport = GetLabTestOrdersReport;
  function GetLabTestOrdersReport(startdate, enddate, labid, labtestId) {

    HTTP.get(api.GetLabTestOrdersReport
      + "?StartDate=" + Constant.dateformate(startdate)
      + "&EndDate=" + Constant.dateformate(enddate)
      + "&LabID=" + (labid == null ? null : (";" + labid + ";"))
      + "&LabTestID=" + (labtestId == null ? null : (";" + labtestId + ";")), function (status, response) {
        $scope.LabTestList = response.data;
      });

  }


  $scope.Labs = [];
  $scope.GetAllLabs = GetAllLabs;
  function GetAllLabs() {
    HTTP.get(api.GetAllLabs, function (status, response) {
      if (status) {
        console.log(response.data);
        $scope.LabList = response.data;
      }
    });
  }

  $scope.LabTests = [];
  $scope.GetAllLabTests = GetAllLabTests;
  function GetAllLabTests(query) {
    HTTP.get(api.GetAllLabTests + "?query=" + query, function (status, response) {
      if (status) {
        console.log(response.data);
        $scope.LabTestsList = response.data;
      }
    });
  }


  $scope.uploadpic = uploadpic;
  function uploadpic(file) {

    formdata = new FormData();
    if (file.files && file.files[0]) {

      var reader = new FileReader();

      reader.onload = function (e) {
        $scope.src = e.target.result;
        $rootScope.$apply();
        $scope.isImageSelected = true;
        console.log($scope.src);
      }
      reader.readAsDataURL(file.files[0]);
    }

    for (var i = 0; i < file.files.length; i++) {
      formdata.append("uploadedFile", file.files[i])
    }


    HTTP.postformData(api.UploadData, formdata, function (status, response) {

      if (status) {
        var Url = api.AddOrUpdatePatientLabTests;
        $scope.SelectedLabtestObj.LabResultFileAttachment = response.data.FileNames[0];
        console.log($scope.SelectedLabtestObj)
        var FinalObj = {
          "LabTestList": [
            $scope.SelectedLabtestObj
          ]
        }
        console.log(FinalObj);
        HTTP.post(Url, FinalObj, function (status2, response2) {
          //$('#Add_doctor_details').modal('hide');
          // location.reload();
        })
      }
    })
  }


  $scope.SelectedLabtestObj = null;
  $scope.SubmiResult = SubmiResult;
  function SubmiResult(obj) {
    $scope.SelectedLabtestObj = obj;

    $('#upload_result_modal').modal('show');
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

});