var app = angular.module('app');
app.controller('LabTestController', function ($scope, HTTP, api, Constant, $rootScope) {

  init();
  formdata = null;
  function init(HTTP) {

    $scope.users = Constant.UserTypes();
    $scope.PicBaseURL = api.ImageBaseUrl;
    console.log($scope.users);
    // GetAllSpecialities();
    GetAllLabTests(null);
    GetAllLabs();
  }

  $scope.Labs = {
    "LabID": null,
    "LabTitle": null,
    "DisplayPicture": null,
    "DiscountPercentage": null,
    "Status": true
  }



  $scope.AddOrUpdateLabs = AddOrUpdateLabs;
  function AddOrUpdateLabs() {

    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {
          var Url = api.AddOrUpdateLabs
            + "?LabID=" + $scope.Labs.LabID
            + "&LabTitle=" + $scope.Labs.LabTitle
            + "&DisplayPicture=" + response.data.FileNames[0]
            + "&DiscountPercentage=" + $scope.Labs.DiscountPercentage
            + "&Status=" + $scope.Labs.Status

          HTTP.get(Url, function (status, response) {
            //$('#Add_doctor_details').modal('hide');
            location.reload();
          })
        }
      })
    } else {
      var Url = api.AddOrUpdateLabs
        + "?LabID=" + $scope.Labs.LabID
        + "&LabTitle=" + $scope.Labs.LabTitle
        + "&DisplayPicture=" + $scope.Labs.DisplayPicture
        + "&DiscountPercentage=" + $scope.Labs.DiscountPercentage
        + "&Status=" + $scope.Labs.Status

      HTTP.get(Url, function (status, response) {
        //$('#Add_doctor_details').modal('hide');
        location.reload();
      })
    }
  }



  $scope.AddOrUpdateLabTest = AddOrUpdateLabTest;
  function AddOrUpdateLabTest() {

    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {
          var Url = api.AddOrUpdateLabTests
            + "?LabTestID=" + $scope.LabTests.LabTestID
            + "&LabTestTitle=" + $scope.LabTests.LabTestTitle
            + "&LabTestPrice=" + $scope.LabTests.LabTestPrice
            + "&Status=" + $scope.LabTests.Status;

          HTTP.get(Url, function (status, response) {
            //$('#Add_doctor_details').modal('hide');
            location.reload();
          })
        }
      })
    } else {
      var Url = api.AddOrUpdateLabTests
        + "?LabTestID=" + $scope.LabTests.LabTestID
        + "&LabTestTitle=" + $scope.LabTests.LabTestTitle
        + "&LabTestPrice=" + $scope.LabTests.LabTestPrice
        + "&Status=" + $scope.LabTests.Status

      HTTP.get(Url, function (status, response) {
        //$('#Add_doctor_details').modal('hide');
        location.reload();
      })
    }
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

  // LABS CRUD

  $scope.IsEdit = false;
  $scope.AddUpdateModel = AddUpdateModel;
  function AddUpdateModel(obj, IsEdit) {
    if (IsEdit) {
      $scope.IsEdit = IsEdit;

      $scope.Labs = obj;
      // $scope.UserObj.MobileNumber = parseInt($scope.UserObj.MobileNumber);
    } else {
      $scope.Labs = {
        "LabID": null,
        "LabTitle": null,
        "DisplayPicture": null,
        "DiscountPercentage": null,
        "Status": true
      }
    }
    $('#Add_Lab').modal('show');
  }


  $scope.DeleteLab = DeleteLab;
  $scope.selectedLabObj = null;
  function DeleteLab(obj, IsConfirm) {
    if (IsConfirm == null) {
      $scope.selectedLabObj = obj;
      $('#delete_LAB_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.Labs = obj;


      AddOrUpdateLabs();
    }
  }

  // LABS CRUD


  // LAB TEST CRUD 
  $scope.IsEditLabTest = false;
  $scope.AddUpdateLabTestModel = AddUpdateLabTestModel;
  function AddUpdateLabTestModel(obj, IsEdit) {
    if (IsEdit) {
      $scope.IsEditLabTest = IsEdit;

      $scope.LabTests = obj;
      // $scope.UserObj.MobileNumber = parseInt($scope.UserObj.MobileNumber);
    } else {
      $scope.LabTests = {
        "LabTestID": null,
        "LabTestTitle": null,
        "LabTestPrice": null,
        "Status": true
      }
    }
    $('#Add_Lab_Test_Details').modal('show');
  }


  $scope.DeleteLabTests = DeleteLabTests;
  $scope.selectedLabTestsObj = null;
  function DeleteLabTests(obj, IsConfirm) {
    if (IsConfirm == null) {
      $scope.selectedLabTestsObj = obj;
      $('#delete_lab_test_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.LabTests = obj;

      AddOrUpdateLabTest();
    }
  }


  // LAB TEST CRUD 
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

  function getFirstDayPreviousMonth() {
    const date = new Date();
    return new Date(date.getFullYear(), date.getMonth() - 1, 1);
  }
  


  // $scope.GetAllLabTests = GetAllLabTests;
  // function GetAllLabTests(query) {
  //   HTTP.get(api.GetAllLabTests + "?query=" + query, function (status, response) {
  //     if (status) {

  //     }
  //   })
  // }

});