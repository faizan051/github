var app = angular.module('app');
app.controller('authController', function ($scope, $window, HTTP, api) {
  // app.controller('userController', function () {


  init();

  function init() {
    $scope.ImagePath = api.ImageBaseUrl;
  $scope.IsRegister = $window.localStorage.getItem('IsRegister');
  $scope.FromMod = $window.localStorage.getItem('FromMod');
  }

  
  $scope.ValidateInput = ValidateInput;
  function ValidateInput(event, value, type) {
    var stringValue = String(value);
    if (type == 'MobileNumber') {
      // if (/^0/.test(value) || stringValue[0] != "9" || stringValue[1] != "2") {
      if (/^0/.test(value) ) {
        $scope.MobileNumber = parseInt(stringValue.replace(/^0/, ""));
        $scope.MobileNumber = parseInt(stringValue.replace(value, ""));
      }
      if (stringValue.length > 13) {
        // $scope.ReqObj.MobileNumber = parseInt(stringValue.slice(0, 13));
        $scope.MobileNumber = parseInt(stringValue.slice(0, 13));
      }
    }
    else if (type == 'pin') {
      if (stringValue.length > 4) {
        $scope.PINNumber = parseInt(stringValue.slice(0, 4));

      }
    }
    else if (type == 'ConfirmPINNumber') {
      if (stringValue.length > 4) {
        $scope.ConfirmPINNumber = parseInt(stringValue.slice(0, 4));

      }
    }
    else if (type == 'otp') {
      if (stringValue.length > 3) {
        $scope.otp = parseInt(stringValue.slice(0, 4));
        angular.element('#otp_submit').click();

      }
    }

  }


  $scope.LoginUser = LoginUser;
  function LoginUser() {
   
    HTTP.get(api.LoginUser
      + "?MobileNumber=" + $scope.MobileNumber
      + "&Password=" + $scope.Password
      
      , function (status, response) {
        if (response.data != null) {

          $scope.errorMsg = "";
          $window.localStorage.setItem('UserInfo', JSON.stringify(response.data));
          window.location.href = 'patient-profile.html'
        } else{
          $scope.errorMsg = "Invalid Credentials";
        }
      })
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
  $scope.AddOrUpdateUser = AddOrUpdateUser;
  function AddOrUpdateUser() {
   
    HTTP.get(api.AddOrUpdateUser
      + "?UserID=" +null
      + "?Name=" + $scope.Name
      + "?UserTypeID=" + 5 // patient
      + "?SpecialityID=" + null
      + "?Experience=" + null
      + "?SatisfactionPercentage=" + null
      + "?DisplayPicture=" + null
       + "?MobileNumber=" + $scope.MobileNumber
      + "&Password=" + $scope.Password
      + "&Status=" + true
      , function (status, response) {
        if (response.data != null) {
          $scope.errorMsg = "";
          $window.localStorage.setItem('UserInfo', JSON.stringify(response.data))
          $window.location.href = $scope.FromMod + '.html';
        }else{
          $scope.errorMsg = "Invalid Credentials";
        }
      })
  }
  $scope.regester = regester;
  function regester() {
    $scope.ReqObj.UserName = $scope.ReqObj.CampusTitle;
    console.log("$scope.ReqObj", $scope.ReqObj);
    HTTP.post(api.RegisterUser
      ,$scope.ReqObj
      , function (status, response) {
        if (response.data != null) {
          $window.localStorage.setItem('UserInfo', JSON.stringify(response.data))
          $window.location.href = 'dashboard.html'
        }
      })
  }

});