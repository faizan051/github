var app = angular.module('app');
app.controller('TeamInterectionController', function ($scope, $window, HTTP, api, Constant,$rootScope,$interval) {
  // app.controller('userController', function () {

  init();
  var formdata = null;
  function init() {
    $scope.IsFeedBackSelected = false;
    $scope.FileUploadConstants = Constant.FileUploadConstants();
    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserTypes =  Constant.UserTypes();
    if($scope.UserInfo == null){
      window.location.href = 'login.html';
    }
    $interval(GetLatestAppointmentProceedings, 5000);
    $scope.Loader = false;
    $scope.SelectedAppointmentObj = JSON.parse($window.localStorage.getItem('AppointmentObj'));
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    if($scope.UserInfo.UserTypeID == $scope.UserTypes.Patient ){
      GetAppointmentProceedings($scope.UserTypes.Doctor);
    }else{
      // GetAppointmentProceedings($scope.UserTypes.Patient);
      GetAppointmentProceedings($scope.UserInfo.UserTypeID);
    }
   }

  $scope.uploadpic = uploadpic;
  function uploadpic(file) {
    if (Constant.validateFileSize(file)) {
    formdata = new FormData();
    $scope.selectedFilename = file.files[0].name;
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
  }

  }

  $scope.AddOrUpdateProceeding = AddOrUpdateProceeding;
  function AddOrUpdateProceeding() {
    $scope.Loader = true;
    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {
        CallProceedingApi(response.data.FileNames[0]);
      })
    } else {
      CallProceedingApi(null);
    }
  }
 
 

  $scope.CallProceedingApi = CallProceedingApi;
  function CallProceedingApi(AttachmentFileName) {

   
    HTTP.get(api.AddOrUpdatePatientAppointmentProceedings
      + "?AppointmentProceedingID=" + null
      + "&AppointmentID=" + $scope.SelectedAppointmentObj.AppointmentID
      + "&UserID=" + $scope.UserInfo.UserID
      + "&SenderUserTypeID=" + $scope.UserInfo.UserTypeID
      + "&ReceiverUserTypeID=" + $scope.ActiveRevierUserTypeId
      + "&AttachmentFileName=" + AttachmentFileName
      + "&Comment=" + $scope.ProceedingComment
      + "&Status=" + true
      , function (status, response) {
        $scope.Loader = false;
        if (response.data != null) {
      
          $scope.ProceedingsList = $scope.ProceedingsList || [];
          $scope.ProceedingsList.push(
            {
              "AppointmentProceedingID": response.data,
              "AppointmentID": $scope.SelectedAppointmentObj.AppointmentID,
              "UserID": $scope.UserInfo.UserID,
              "SenderUserTypeID": $scope.UserInfo.UserTypeID,
              "ReceiverUserTypeID": $scope.ActiveRevierUserTypeId,
              "AttachmentFileName": AttachmentFileName,
              "Comment": $scope.ProceedingComment,
              "AddedDateTime": new Date(),
              "Status": true,
              "Name": $scope.UserInfo.Name,
              "DisplayPicture": $scope.UserInfo.DisplayPicture
            }
            
          );
          selectedFilename = null;
          formdata = null;
          $scope.ProceedingComment = null;
          console.log("$scope.ProceedingsList", $scope.ProceedingsList);

        }
      })
  }
  $scope.GetAppointmentProceedings = GetAppointmentProceedings;
  function GetAppointmentProceedings(UserTypeID) {
    $scope.ActiveRevierUserTypeId = UserTypeID;
    $scope.GetProceedingLoader = true;
    HTTP.get(api.GetAppointmentProceedings
      + "?AppointmentID=" + $scope.SelectedAppointmentObj.AppointmentID
      + "&UserTypeID=" + UserTypeID
      , function (status, response) {
        $scope.GetProceedingLoader = false;
        if (response.data != null) {
          $scope.ProceedingsList = response.data;
          console.log("$scope.ProceedingsList", $scope.ProceedingsList);

        }
      })
  }
  $scope.GetLatestAppointmentProceedings = GetLatestAppointmentProceedings;
  function GetLatestAppointmentProceedings() {
  //  if($scope.ProceedingsList.length > 0){
    HTTP.get(api.GetLatestAppointmentProceedings
      + "?AppointmentID=" + $scope.SelectedAppointmentObj.AppointmentID
      + "&UserTypeID=" +  $scope.ActiveRevierUserTypeId 
      + "&AppointmentProceedingID=" + ( $scope.ProceedingsList.length > 0  ? $scope.ProceedingsList[$scope.ProceedingsList.length - 1].AppointmentProceedingID : 0)
      , function (status, response) {
        $scope.GetProceedingLoader = false;
        if (response.data != null && response.data.length > 0) {
          $scope.ProceedingsList.push( response.data[0]);
          console.log("$scope.ProceedingsList", $scope.ProceedingsList);

        }
      })
  //  }
 
  }
  $scope.AddUser = AddUser;
  function AddUser() {
    console.log("plplplpl");
    // if ($scope.UserInfo == null) {
    //   $scope.checkOutLoader = true;
    //   HTTP.get(api.AddOrUpdateUser
    //     + "?UserID=" + null
    //     + "&Name=" + $scope.Name
    //     + "&UserTypeID=" + 5 // patient
    //     + "&SpecialityID=" + null
    //     + "&Experience=" + null
    //     + "&SatisfactionPercentage=" + null
    //     + "&DisplayPicture=" + null
    //     + "&MobileNumber=" + $scope.MobileNumber
    //     + "&Password=" + $scope.Password
    //     + "&Status=" + true
    //     , function (status, response) {
    //       if (response.data != null) {

    //         $window.localStorage.setItem('UserInfo', JSON.stringify(response.data))
    //         if ($scope.FromModule == 'Lab') {
    //           CallLabTestApi();
    //         } else if ($scope.FromModule == 'Med') {
    //           CallMedApi();
    //         }

    //       }
    //     })
    // }else{
    //   if ($scope.FromModule == 'Lab') {
    //     CallLabTestApi();
    //   } else if ($scope.FromModule == 'Med') {
    //     CallMedApi();
    //   }
    // }
  }


  $scope.addToCart = addToCart;
  function addToCart(Obj, IsAdded, index) {
    if (IsAdded == true) {
      var CartItemObj = {};
      CartItemObj.Obj = Obj;
      $scope.CartItemList.push(
        CartItemObj
      );
    } else {
      if ($scope.FromModule == 'Lab') {
        $scope.totalBillAmount -= Obj.TotalAmount;
      } else if ($scope.FromModule == 'Med') {
        $scope.totalBillAmount -= Obj.Price * Obj.Quantity;
      }
      $scope.CartItemList.splice(index, 1);

    }
  }





});