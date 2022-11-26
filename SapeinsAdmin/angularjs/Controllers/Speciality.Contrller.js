var app = angular.module('app');
app.controller('SpecialityController', function ($scope, HTTP, api, Constant, $rootScope) {

  init();
  formdata = null;
  function init(HTTP) {

    $scope.PicBaseURL = api.ImageBaseUrl;
    console.log($scope.users);
    GetAllSpecialities();

  }

  $scope.Speciality = {
    "SpecialityID": null,
    "SpecialityTitle": null,
    "DisplayPicture": null,
    "Status": true
  }



  $scope.AddOrUpdateSpecialities = AddOrUpdateSpecialities;
  function AddOrUpdateSpecialities() {



    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {
          var Url = api.AddOrUpdateSpecialities
            + "?SpecialityID=" + $scope.Speciality.SpecialityID
            + "&SpecialityTitle=" + $scope.Speciality.SpecialityTitle
            + "&DisplayPicture=" + response.data.FileNames[0]
            + "&Status=" + $scope.Speciality.Status;
          HTTP.get(Url, function (status, response) {
            //$('#Add_doctor_details').modal('hide');
            location.reload();
          })
        }
      })
    } else {

      var Url = api.AddOrUpdateSpecialities
        + "?SpecialityID=" + $scope.Speciality.SpecialityID
        + "&SpecialityTitle=" + $scope.Speciality.SpecialityTitle
        + "&DisplayPicture=" + $scope.Speciality.DisplayPicture
        + "&Status=" + $scope.Speciality.Status;


      HTTP.get(Url, function (status, response) {
        //$('#Add_doctor_details').modal('hide');
        location.reload();
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

 
  $scope.IsEdit = false;
  $scope.AddUpdateModel = AddUpdateModel;
  function AddUpdateModel(obj, IsEdit) {
    if (IsEdit) {
      $scope.IsEdit = IsEdit;
      $scope.Speciality = obj;
    } else {
      $scope.Speciality = {
        "SpecialityID": null,
        "SpecialityTitle": null,
        "DisplayPicture": null,
        "Status": true
      }
    }
    $('#Add_doctor_details').modal('show');
  }

  $scope.selectedSpecialityObj = null;
  
  $scope.DeleteSpeciality = DeleteSpeciality;
  function DeleteSpeciality(obj, IsConfirm) {
    if (IsConfirm == null) {
      $scope.selectedSpecialityObj = obj;
      $('#delete_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.Speciality = obj;

      AddOrUpdateSpecialities();
    }
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