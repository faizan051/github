var app = angular.module('app');
app.controller('VouchersController', function ($scope, HTTP, $window, api, Constant, $rootScope) {


  init();
  var formdata = null;

  $scope.VoucehrsObj = {
    "DiscountVoucherID": null,
    "VoucherTitle": null,
    "VoucherCode": null,
    "VoucherDecription": null,
    "VoucherImage": null,
    "DiscountPercentage": null,
    "DiscountAmount": null,
    "IsLabApplicable": false,
    "IsMedicineApplicable": null,
    "IsAppointmentApplicable": null,
    "IsEnabled": null,
    "Status": null
  }

  function init() {
    // $scope.UserImagePath = api.UserImagePath;
    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    $scope.UserTypes = Constant.UserTypes();
    if ($scope.UserInfo == null) {
      window.location.href = 'login.html';
    } else {
      GetDiscountVouchers()
    }
  }


  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = ToModule + '.html'
  }


  // $scope.ApponintmentOrderList = [];
  // $scope.GetAppointmentOrdersReport = GetAppointmentOrdersReport;
  // function GetAppointmentOrdersReport(startdate, enddate, SpecialityID, TeamID) {

  //   HTTP.get(api.GetAppointmentOrdersReport
  //     + "?StartDate=" + Constant.dateformate(startdate)
  //     + "&EndDate=" + Constant.dateformate(enddate)
  //     + "&SpecialityID=" + (SpecialityID == null ? null : (";" + SpecialityID + ";"))
  //     + "&TeamID=" + (TeamID == null ? null : (";" + TeamID + ";")), function (status, response) {

  //       $scope.ApponintmentOrderList = response.data;

  //     });
  // }

  // $scope.GetAllSpecialities = GetAllSpecialities;
  // function GetAllSpecialities() {
  //   HTTP.get(api.GetAllSpecialities, function (status, response) {
  //     if (status) {
  //       console.log(response.data);
  //       $scope.Specialities = response.data;
  //     }
  //   });
  // }


  // $scope.GetTeams = GetTeams;
  // function GetTeams(SpecialityID, query) {
  //   HTTP.get(api.GetTeams + "?SpecialityID=" + ";" + SpecialityID + ";" + "&query=" + query, function (status, response) {
  //     if (status) {
  //       $scope.Teams = response.data;
  //     }
  //   })
  // }


  // $scope.TotalAmount = 0;
  // $scope.calculateTotals = calculateTotals;
  // function calculateTotals(Amount) {
  //   $scope.TotalAmount = $scope.TotalAmount + Amount;
  // }
  // function getFirstDayPreviousMonth() {
  //   const date = new Date();
  //   return new Date(date.getFullYear(), date.getMonth() - 1, 1);
  // }


  // $scope.PatientDetails_modal = PatientDetails_modal;
  // function PatientDetails_modal(obj) {
  //   $scope.SelectedObj = obj;
  //   console.log(obj);
  //   $('#PatientDetails_modal').modal('show');
  // }

  $scope.IsEdit = false;
  $scope.AddUpdateModel = AddUpdateModel;
  function AddUpdateModel(obj, IsEdit) {
    $scope.IsEdit = IsEdit;
    if (IsEdit) {
      
      $scope.VoucehrsObj = angular.copy(obj);
    } else {
      $scope.VoucehrsObj = {
        "DiscountVoucherID": null,
        "VoucherTitle": null,
        "VoucherCode": null,
        "VoucherDecription": null,
        "VoucherImage": null,
        "DiscountPercentage": null,
        "DiscountAmount": null,
        "IsLabApplicable": true,
        "IsMedicineApplicable": true,
        "IsAppointmentApplicable": true,
        "IsEnabled": true,
        "Status": true
      }
    }
    $('#Add_update_Vouchers_details').modal('show');
  }

  $scope.GetDiscountVouchers = GetDiscountVouchers;
  function GetDiscountVouchers(VoucherTitle) {
    HTTP.get(api.GetDiscountVouchers + "?VoucherTitle=" + VoucherTitle, function (status, response) {
      if (status) {
        $scope.Vouchers = response.data;
      }
    })
  }

  $scope.uploadpic = uploadpic;
  function uploadpic(file) {

    formdata = new FormData();
    if (file.files && file.files[0]) {

      var reader = new FileReader();

      reader.onload = function (e) {
        $scope.src = e.target.result;
        $rootScope.$apply();
        console.log($scope.src);
      }
      reader.readAsDataURL(file.files[0]);
    }

    for (var i = 0; i < file.files.length; i++) {
      formdata.append("uploadedFile", file.files[i])
    }
  }

  $scope.AddOrUpdateDiscountVouchers = AddOrUpdateDiscountVouchers;
  function AddOrUpdateDiscountVouchers() {

    if (formdata != null) {
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (status) {

          var URL = api.AddOrUpdateDiscountVouchers
            + "?DiscountVoucherID=" + $scope.VoucehrsObj.DiscountVoucherID
            + "&VoucherTitle=" + $scope.VoucehrsObj.VoucherTitle
            + "&VoucherCode=" + $scope.VoucehrsObj.VoucherCode
            + "&VoucherDecription=" + $scope.VoucehrsObj.VoucherDecription
            + "&VoucherImage=" + response.data.FileNames[0]
            + "&DiscountPercentage=" + $scope.VoucehrsObj.DiscountPercentage
            + "&DiscountAmount=" + $scope.VoucehrsObj.DiscountAmount
            + "&IsLabApplicable=" + $scope.VoucehrsObj.IsLabApplicable
            + "&IsMedicineApplicable=" + $scope.VoucehrsObj.IsMedicineApplicable
            + "&IsAppointmentApplicable=" + $scope.VoucehrsObj.IsAppointmentApplicable
            + "&IsEnabled=" + $scope.VoucehrsObj.IsEnabled
            + "&Status=" + $scope.VoucehrsObj.Status;

          HTTP.get(URL, function (status, response) {
            location.reload();
          })
        }
      })
    } else {


      var URL = api.AddOrUpdateDiscountVouchers
        + "?DiscountVoucherID=" + $scope.VoucehrsObj.DiscountVoucherID
        + "&VoucherTitle=" + $scope.VoucehrsObj.VoucherTitle
        + "&VoucherCode=" + $scope.VoucehrsObj.VoucherCode
        + "&VoucherDecription=" + $scope.VoucehrsObj.VoucherDecription
        + "&VoucherImage=" + $scope.VoucehrsObj.VoucherImage
        + "&DiscountPercentage=" + $scope.VoucehrsObj.DiscountPercentage
        + "&DiscountAmount=" + $scope.VoucehrsObj.DiscountAmount

        + "&IsLabApplicable=" + $scope.VoucehrsObj.IsLabApplicable
        + "&IsMedicineApplicable=" + $scope.VoucehrsObj.IsMedicineApplicable
        + "&IsAppointmentApplicable=" + $scope.VoucehrsObj.IsAppointmentApplicable
        + "&IsEnabled=" + $scope.VoucehrsObj.IsEnabled
        + "&Status=" + $scope.VoucehrsObj.Status;

      HTTP.get(URL, function (status, response) {
        location.reload();
      })
    }

  }

  $scope.deletevoucher = deletevoucher;
  function deletevoucher(IsConfirm,obj) {

    if (IsConfirm == null) {
      $scope.VoucehrsObj = obj;
      $('#delete_modal').modal('show');
    } else if (IsConfirm == true) {
      obj.Status = false;
      $scope.VoucehrsObj = obj;

      AddOrUpdateDiscountVouchers();
    }
  }


});