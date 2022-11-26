var app = angular.module('app');
app.controller('Med2Controller', function ($scope, HTTP, api, Constant, $rootScope) {

  $scope.startDate = getFirstDayPreviousMonth();
  $scope.endDate = new Date();
  init();
  formdata = null;
  function init(HTTP) {
    $scope.PageSize = 30;
    $scope.users = Constant.UserTypes();
    $scope.PicBaseURL = api.ImageBaseUrl;
    console.log($scope.users);
    // GetAllSpecialities();
    GetAllMedicines(true, null);

  }




  $scope.AddOrUpdateMedicines = AddOrUpdateMedicines;
  function AddOrUpdateMedicines() {

    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {
          var Url = api.AddOrUpdateMedicines
            + "?MedicineID=" + $scope.Med.MedicineID
            + "&MedicineTitle=" + $scope.Med.MedicineTitle
            + "&DisplayPicture=" + response.data.FileNames[0]
            + "&Price=" + $scope.Med.Price
            + "&Status=" + $scope.Med.Status

          HTTP.get(Url, function (status, response) {
            //$('#Add_doctor_details').modal('hide');
            location.reload();
          })
        }
      })
    } else {
      var Url = api.AddOrUpdateMedicines
        + "?MedicineID=" + $scope.Med.MedicineID
        + "&MedicineTitle=" + $scope.Med.MedicineTitle
        + "&DisplayPicture=" + $scope.Med.DisplayPicture
        + "&Price=" + $scope.Med.Price
        + "&Status=" + $scope.Med.Status

      HTTP.get(Url, function (status, response) {
        //$('#Add_doctor_details').modal('hide');
        location.reload();
      })
    }
  }






  $scope.Med = {};
  $scope.MedList = [];
  $scope.GetAllMedicines = GetAllMedicines;
  function GetAllMedicines(IsFirst, query) {
    if (IsFirst == true) {
      $scope.MedList = [];
      $scope.PageNumber = 1;
    } else {
      $scope.PageNumber = $scope.PageNumber + 1;
    }
    HTTP.get(api.GetAllMedicines + "?query=" + query + "&PageNumber=" + $scope.PageNumber + "&PageSize=" + $scope.PageSize, function (status, response) {
      if (status) {
        console.log(response.data);
        // $scope.MedList = response.data;
        for (var index = 0; index < response.data.length; index++) {
          var element = response.data[index];
          $scope.MedList.push(element);

        }

      }
    });
  }

  // Med CRUD

  $scope.IsEdit = false;
  $scope.AddUpdateModel = AddUpdateModel;
  function AddUpdateModel(obj, IsEdit) {
    if (IsEdit) {
      $scope.IsEdit = IsEdit;

      $scope.Med = obj;
      // $scope.UserObj.MobileNumber = parseInt($scope.UserObj.MobileNumber);
    } else {
      $scope.Med = {
        "MedicineID": null,
        "MedicineTitle": null,
        "DisplayPicture": null,
        "Price": null,
        "Status": true
      }
    }
    $('#Add_Med').modal('show');
  }





  $scope.DeleteMed = DeleteMed;
  $scope.selectedMedObj = null;
  function DeleteMed(obj, IsConfirm) {
    if (IsConfirm == null) {
      $scope.selectedMedObj = obj;
      $('#delete_Med_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.Med = obj;
      AddOrUpdateMedicines();

    }
  }


  // Med TEST CRUD 
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



  // $scope.GetAllMedicines = GetAllMedicines;
  // function GetAllMedicines(query) {
  //   HTTP.get(api.GetAllMedicines + "?query=" + query, function (status, response) {
  //     if (status) {

  //     }
  //   })
  // }

});