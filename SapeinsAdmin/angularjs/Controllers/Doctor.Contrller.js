var app = angular.module('app');
app.controller('DoctorController', function ($scope, HTTP, api, Constant, $rootScope) {

  init();
  formdata = null;
  function init(HTTP) {

    $scope.users = Constant.UserTypes();
    $scope.SelectedUser = $scope.users.Doctor;
    $scope.PicBaseURL = api.ImageBaseUrl;
    console.log($scope.users);
    GetAllSpecialities();
    GetAllUsers($scope.SelectedUser);
    GetUserTypes();

  }

  $scope.UserObj = {
    "UserID": null,
    "Name": null,
    "UserTypeID": $scope.users.Doctor,
    "SpecialityID": null,
    "Experience": null,
    "SatisfactionPercentage": null,
    "DisplayPicture": null,
    "MobileNumber": null,
    "Password": null,
    "Education": null,
    "Status": true
  }



  $scope.AddOrUpdateUser = AddOrUpdateUser;
  function AddOrUpdateUser() {



    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {
          var Url = api.AddOrUpdateUser
            + "?UserID=" + $scope.UserObj.UserID
            + "&Name=" + $scope.UserObj.Name
            + "&UserTypeID=" + $scope.UserObj.UserTypeID
            + "&SpecialityID=" + $scope.UserObj.SpecialityID
            + "&Experience=" + $scope.UserObj.Experience
            + "&SatisfactionPercentage=" + $scope.UserObj.SatisfactionPercentage
            + "&DisplayPicture=" + response.data.FileNames[0]
            + "&MobileNumber=" + $scope.UserObj.MobileNumber
            + "&Password=" + $scope.UserObj.Password
            + "&ResidentialAddress=" + null
            + "&Education=" + $scope.UserObj.Education
            + "&Status=" + $scope.UserObj.Status;
          HTTP.get(Url, function (status, response) {
            //$('#Add_doctor_details').modal('hide');
            location.reload();
          })
        }
      })
    } else {

      var Url = api.AddOrUpdateUser
        + "?UserID=" + $scope.UserObj.UserID
        + "&Name=" + $scope.UserObj.Name
        + "&UserTypeID=" + $scope.UserObj.UserTypeID
        + "&SpecialityID=" + $scope.UserObj.SpecialityID
        + "&Experience=" + $scope.UserObj.Experience
        + "&SatisfactionPercentage=" + $scope.UserObj.SatisfactionPercentage
        + "&DisplayPicture=" + $scope.UserObj.DisplayPicture
        + "&MobileNumber=" + $scope.UserObj.MobileNumber
        + "&Password=" + $scope.UserObj.Password
        + "&ResidentialAddress=" + null
        + "&Education=" + $scope.UserObj.Education
        + "&Status=" + $scope.UserObj.Status;

      HTTP.get(Url, function (status, response) {
        //$('#Add_doctor_details').modal('hide');
       // location.reload();
      })
    }

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

  $scope.Users = [];
  $scope.GetAllUsers = GetAllUsers;
  function GetAllUsers(UserTypeID) {
    HTTP.get(api.GetAllUsers + "?UserTypeID=" + UserTypeID, function (status, response) {
      if (status) {
        console.log(response.data);
        $scope.Users = response.data;
      }
    });
  }

  $scope.IsEdit = false;
  $scope.AddUpdateModel = AddUpdateModel;
  function AddUpdateModel(obj, IsEdit) {
    if (IsEdit) {
      $scope.IsEdit = IsEdit;

      $scope.UserObj = obj;
      $scope.UserObj.MobileNumber = parseInt($scope.UserObj.MobileNumber);
    } else {
      $scope.UserObj = {
        "UserID": null,
        "Name": null,
        "UserTypeID": $scope.users.Doctor,
        "SpecialityID": null,
        "Experience": null,
        "SatisfactionPercentage": null,
        "DisplayPicture": null,
        "MobileNumber": null,
        "Password": null,
        "Status": true
      }
    }
    $('#Add_doctor_details').modal('show');
  }

  $scope.DeleteUser = DeleteUser;
  $scope.selectedUserObj = null;
  function DeleteUser(obj, IsConfirm) {
    if (IsConfirm == null) {
      $scope.selectedUserObj = obj;
      $('#delete_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.UserObj = obj;

      AddOrUpdateUser();
    }
  }
  $scope.UserType = [];
  $scope.GetUserTypes = GetUserTypes;
  function GetUserTypes() {
    HTTP.get(api.GetUserTypes, function (status, response) {
      $scope.UserType = response.data;
    });
  }

  $scope.uploadpic = uploadpic;
  function uploadpic(file) {

    formdata = new FormData();
    //var response = imageValidateService.myFunc(file.files);

    // if (response != true) {
    //     vm.validateError = response;
    //     formdata = "";
    // } else {

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

});