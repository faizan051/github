var app = angular.module('app');
app.controller('checkOutController', function ($scope, Constant, $rootScope, $timeout, $window, HTTP, api) {
  // app.controller('userController', function () {

  init();
  var formdata = null;
  var PrescriptionFilename = null;
  var jazzCashFilename = null;
  var ProfileFilename = null;
  function init() {

    // $scope.ImagePath = api.ImageBaseUrl;
    $scope.IsForLogin = false;
    $scope.UserImagePath = api.UserImagePath;
    $scope.FileUploadConstants = Constant.FileUploadConstants();
    $scope.totalBillAmount = 0;
    $scope.FromModule = $window.localStorage.getItem('FromModule');
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    $scope.IsUserAlreadyLoggedIn = ($scope.UserInfo == null ? false : true);
    $scope.OrderDate = new Date();

    $scope.TeamDetails = JSON.parse($window.localStorage.getItem('TeamDetails'));
    // console.log($scope.TeamDetails);
    $scope.CartItemList = JSON.parse($window.localStorage.getItem('CartItemList'));
    $scope.selectedDateOBj = new Date(JSON.parse($window.localStorage.getItem('selectedDateOBj')));
    // console.log("selectedDateOBj", $scope.selectedDateOBj);

    
    // if ($scope.FromModule == 'Med') {

    //   $scope.PrescriptionFilename = JSON.parse($window.localStorage.getItem('PrescriptionFilename'));

    // }
    // console.log("$scope.UserInfo", $scope.UserInfo);
    for (var i = 0; i < $scope.CartItemList.length; i++) {
      if ($scope.FromModule == 'Lab') {
        $scope.selectedModTitle = 'Lab';
        $scope.totalBillAmount += $scope.CartItemList[i].labTestObj.TotalAmount;
      } else if ($scope.FromModule == 'Med') {
        $scope.selectedModTitle = 'Medicine';
        $scope.totalBillAmount += $scope.CartItemList[i].MedObj.Price * $scope.CartItemList[i].MedObj.Quantity;
      } else if ($scope.FromModule == 'booking') {
        $scope.selectedModTitle = 'Appointment';
        // console.log($scope.CartItemList[i]);
        $scope.totalBillAmount += $scope.TeamDetails.SessionCharges;
        // $scope.totalBillAmount += $scope.CartItemList[i].MedObj.Price * $scope.CartItemList[i].MedObj.Quantity;
      }
    }


    //  if($scope.UserInfo == "null"){
    //   $window.localStorage.setItem('FromMod','checkout');
    //   $window.localStorage.setItem('IsRegister',true);
    //   window.location.href = './admin/login.html'
    //  }
    // $scope.CartItemList = [];
    // $scope.SpecialityID = null;
    // $scope.query = $window.localStorage.getItem('UniversalSearchQuery')

  }




  $scope.uploadpic = uploadpic;
  function uploadpic(file, fileFor) {
    if (Constant.validateFileSize(file)) {
      formdata = new FormData();
      if (file.files && file.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
          $scope.src = e.target.result;
          $rootScope.$apply();
          $scope.isImageSelected = true;
          // console.log($scope.src);
        }
        reader.readAsDataURL(file.files[0]);
      }

      // for (var i = 0; i < file.files.length; i++) {
      formdata.append("uploadedFile", file.files[0]);
      HTTP.postformData(api.UploadData, formdata, function (status, response) {

        if (fileFor == 'Prescription') {
          $scope.selectedPrescriptionFilename = file.files[0].name;
          PrescriptionFilename = response.data.FileNames[0];
        } else if (fileFor == 'jazzCash') {
          $scope.selectedjazzCashFilename = file.files[0].name;
          jazzCashFilename = response.data.FileNames[0];
        } else if (fileFor == 'Profile') {
          $scope.selectedProfileFilename = file.files[0].name;
          ProfileFilename = response.data.FileNames[0];
        }
        formdata = null;

      })
    }

  }


  $scope.Login = Login;
  function Login() {
    $scope.LoginLoader = true;
    HTTP.get(api.LoginUser
      + "?MobileNumber=" + $('#MobileNumber').val()
      + "&Password=" + $('#Password').val()

      , function (status, response) {
        $scope.LoginLoader = false;
        if (response.data != null) {

          $scope.errorMsg = "";
          $window.localStorage.setItem('UserInfo', JSON.stringify(response.data));
          window.location.href = 'checkout.html'
          // $scope.UserInfo = response.data;
          // window.location.href = 'patient-profile.html'
        } else {
          $scope.errorMsg = "Invalid Credentials";
        }
      })
  }



  $scope.IsLogInClicked = IsLogInClicked;
  function IsLogInClicked(IsForLogin) {
    $scope.IsForLogin = IsForLogin;

  }
  $scope.GetDiscountVouchers = GetDiscountVouchers;
  function GetDiscountVouchers(VoucherTitle) {
     if($('#VoucherTitle').val() != null && $('#VoucherTitle').val() != ''){
      $scope.AppliedDiscountAmount = 0;
      $scope.AppliedDiscountObj = null;
      $scope.SelectedVoucherTitle = null;
     
      HTTP.get(api.GetDiscountVouchers
        + "?VoucherTitle=" + $('#VoucherTitle').val()
        , function (status, response) {
          $scope.VoucherMsg = "Not Available";
          // $scope.LoginLoader = false;
          if (response.data != null && response.data.length > 0) {
            if ($scope.FromModule == 'Lab' && response.data[0].IsLabApplicable == true) {
              $scope.AppliedDiscountObj = response.data[0];
              $scope.SelectedVoucherTitle =  $('#VoucherTitle').val();
              $scope.VoucherMsg = null;
              if(response.data[0].DiscountPercentage != null && response.data[0].DiscountPercentage > 0){
                $scope.AppliedDiscountAmount = (($scope.totalBillAmount  * response.data[0].DiscountPercentage ) / 100);
              }else{
                $scope.AppliedDiscountAmount =   response.data[0].DiscountAmount ;
              }
            } else if ($scope.FromModule == 'Med' && response.data[0].IsMedicineApplicable == true) {
              $scope.AppliedDiscountObj = response.data[0];
              $scope.SelectedVoucherTitle =  $('#VoucherTitle').val();
              $scope.VoucherMsg = null;
              if(response.data[0].DiscountPercentage != null && response.data[0].DiscountPercentage > 0){
                $scope.AppliedDiscountAmount = (($scope.totalBillAmount  * response.data[0].DiscountPercentage ) / 100);
              }else{
                $scope.AppliedDiscountAmount =  response.data[0].DiscountAmount ;
              }
            } else if ($scope.FromModule == 'booking' && response.data[0].IsAppointmentApplicable == true) {
              $scope.AppliedDiscountObj = response.data[0];
              $scope.SelectedVoucherTitle =  $('#VoucherTitle').val();
              $scope.VoucherMsg = null;
              if(response.data[0].DiscountPercentage != null && response.data[0].DiscountPercentage > 0){
                $scope.AppliedDiscountAmount = (($scope.totalBillAmount  * response.data[0].DiscountPercentage ) / 100);
              }else{
                $scope.AppliedDiscountAmount =  response.data[0].DiscountAmount ;
              }
  
            }else{
              $scope.AppliedDiscountObj = null;
              $scope.SelectedVoucherTitle = null;
              $scope.AppliedDiscountAmount = 0 ;
              $scope.VoucherMsg = "It Is Not Applicable For " +  $scope.selectedModTitle;
            }
  
            if($scope.AppliedDiscountAmount >  $scope.totalBillAmount){
              $scope.AppliedDiscountObj = null;
              $scope.SelectedVoucherTitle = null;
              $scope.AppliedDiscountAmount = 0 ;
              $scope.VoucherMsg = "Applied Discount Amount is greater than total Bill";
            }
  
  
            
          } else {
            
              $scope.VoucherMsg = "Invalid Voucher";
          }
        })
     }
  

  }
  $scope.GoToLogin = GoToLogin;
  function GoToLogin() {
    $window.localStorage.setItem('FromMod', 'checkout');
    $window.localStorage.setItem('IsRegister', false);
    window.location.href = './login.html'

  }
  $scope.AddOrUpdateUser = AddOrUpdateUser;
  function AddOrUpdateUser() {
    if ($('#Name').val() == null || $('#Name').val() == '' || $('#MobileNumber').val() == null || $('#MobileNumber').val() == ''
      || $('#ResidentialAddress').val() == null || $('#ResidentialAddress').val() == '' || $('#Password').val() == null || $('#Password').val() == '') {
      alert("Please Fill up Form ");
    } else {
      $scope.RegisterLoader = true;
      HTTP.get(api.AddOrUpdateUser
        + "?UserID=" + null
        + "&Name=" + $('#Name').val()
        + "&UserTypeID=" + 5 // patient
        + "&SpecialityID=" + null
        + "&Experience=" + null
        + "&SatisfactionPercentage=" + null
        + "&DisplayPicture=" + ProfileFilename
        + "&MobileNumber=" + $('#MobileNumber').val()
        + "&Password=" + $('#Password').val()
        + "&ResidentialAddress=" + $('#ResidentialAddress').val()
        + "&Education=" + null
        + "&Status=" + true

        , function (status, response) {
          $scope.RegisterLoader = false;
          if (response.data != null) {
            $window.localStorage.setItem('UserInfo', JSON.stringify(response.data));
            $scope.UserInfo = response.data;
            window.location.href = 'checkout.html'
            // $scope.IsUserAlreadyLoggedIn = true;

          }
        })
    }


  }
  $scope.OrderDateChanged = OrderDateChanged;
  function OrderDateChanged() {
    if ($('#OrderDateDiv').val() < Constant.dateformate(new Date())) {
      $scope.OrderDate = new Date();
      alert("Order Date Cannot be lesser then today Date");
      $('#OrderDateDiv').val(Constant.dateformate(new Date()));
      // $timeout( function(){
      //   $scope.OrderDate  = new Date();
      // }, 5000);

    }

  }
  $scope.IsSameAddressChanged = IsSameAddressChanged;
  function IsSameAddressChanged() {
    if ($('#IsSameAsResidentialAddress').prop('checked') == true) {
      $scope.UserInfo.BillingAddress = $scope.UserInfo.ResidentialAddress;
    } else {
      $scope.UserInfo.BillingAddress = null;
    }

  }
  $scope.CheckMobileNumberForAccountCreation = CheckMobileNumberForAccountCreation;
  function CheckMobileNumberForAccountCreation() {
    if ($scope.IsForLogin == false) {
      HTTP.get(api.CheckMobileNumberForAccountCreation
        + "?MobileNumber=" + $('#MobileNumber').val()

        , function (status, response) {
          if (response.data != true) {

            $scope.UserInfo = null;
            alert($('#MobileNumber').val() + " Already Exist Please choose another");
            // $('#MobileNumber').val('');
          }
        })
    }


  }


  $scope.Checkout = Checkout;
  function Checkout() {
    if($scope.FromModule == 'booking'){
      if ($scope.selectedjazzCashFilename == null || $scope.selectedjazzCashFilename == '' || $scope.UserInfo.BillingAddress == null || $scope.UserInfo.BillingAddress == '') {
        alert("Please Upload Jazz Cash Reciept Or Provide Billing Address ");
        return false;
      }
    }else{
      if ( $scope.UserInfo.BillingAddress == null || $scope.UserInfo.BillingAddress == '') {
        alert("Please  Provide Billing Address ");
        return false;
      }
    }
   
    if ($scope.checkOutLoader == true) {
      return false;
    }

    // if ($scope.UserInfo == null) {
    //   $scope.checkOutLoader = true;
    //   HTTP.get(api.AddOrUpdateUser
    //     + "?UserID=" + null
    //     + "&Name=" + $('#Name').val()
    //     + "&UserTypeID=" + 5 // patient
    //     + "&SpecialityID=" + null
    //     + "&Experience=" + null
    //     + "&SatisfactionPercentage=" + null
    //     + "&DisplayPicture=" + null
    //     + "&MobileNumber=" + $('#MobileNumber').val()
    //     + "&Password=" + $('#Password').val()
    //     + "&Status=" + true
    //     , function (status, response) {
    //       if (response.data != null) {

    //         $window.localStorage.setItem('UserInfo', JSON.stringify(response.data));

    //         if ($scope.FromModule == 'Lab') {
    //           CallLabTestApi();
    //         } else if ($scope.FromModule == 'Med') {
    //           CallMedApi();
    //         } else if ($scope.FromModule == 'booking') {
    //           AddOrUpdatePatientAppointments()
    //         }

    //       }
    //     })
    // } else {
    if ($scope.FromModule == 'Lab') {
      CallLabTestApi();
    } else if ($scope.FromModule == 'Med') {
      CallMedApi();
    } else if ($scope.FromModule == 'booking') {

      AddOrUpdatePatientAppointments()
    }
    // }
  }



  $scope.CheckoutPatientAppointmentOBJ = {
    "AppointmentID=": null,
    "UserID=": null,
    "TeamID=": null,
    "SessionCharges=": null,
    "SessionStartDate=": null,
    "SessionStartTime=": null,
    "TeamTimeSlotID=": null,
    "Status=": true

  }

  $scope.AddOrUpdatePatientAppointments = AddOrUpdatePatientAppointments;
  function AddOrUpdatePatientAppointments() {
    // console.log($scope.CheckoutPatientAppointmentOBJ);
    var reqObj = {};
      reqObj.AppointmentID=  null
      reqObj.UserID=  JSON.parse($window.localStorage.getItem('UserInfo')).UserID
      reqObj.TeamID=  $scope.TeamDetails.TeamID
      reqObj.SessionCharges=  $scope.TeamDetails.SessionCharges
      reqObj.SessionStartDate=  Constant.dateformate($scope.selectedDateOBj)
      reqObj.SessionStartTime=  $scope.CartItemList[0].bookingObj.TimeSlotT //Constant.timeformate($scope.CartItemList[0].bookingObj.TimeSlotT)  //moment($scope.CartItemList[0].bookingObj.TimeSlot).format('HH:mm:ss'); // Constant.timeformate($scope.CartItemList[0].bookingObj.TimeSlot)
      reqObj.TeamTimeSlotID=  $scope.CartItemList[0].bookingObj.TeamTimeSlotID
      reqObj.PaymentImage=  jazzCashFilename
      reqObj.BillingAddress=  $('#BillingAddress').val()
      reqObj.Status=  true;


      if( $scope.AppliedDiscountObj != null){
        reqObj.DiscountVoucherID =  $scope.AppliedDiscountObj.DiscountVoucherID;
        reqObj.VoucherTitle =  $scope.SelectedVoucherTitle;
        reqObj.DiscountVoucherAmount =  $scope.AppliedDiscountObj.DiscountAmount;
        reqObj.DiscountVoucherPercentage =  $scope.AppliedDiscountObj.DiscountPercentage;
      }

    // var Url = api.AddOrUpdatePatientAppointments
    //   + "?AppointmentID=" + null
    //   + "&UserID=" + JSON.parse($window.localStorage.getItem('UserInfo')).UserID
    //   + "&TeamID=" + $scope.TeamDetails.TeamID
    //   + "&SessionCharges=" + $scope.TeamDetails.SessionCharges
    //   + "&SessionStartDate=" + Constant.dateformate($scope.selectedDateOBj)
    //   + "&SessionStartTime=" + $scope.CartItemList[0].bookingObj.TimeSlotT //Constant.timeformate($scope.CartItemList[0].bookingObj.TimeSlotT)  //moment($scope.CartItemList[0].bookingObj.TimeSlot).format('HH:mm:ss'); // Constant.timeformate($scope.CartItemList[0].bookingObj.TimeSlot)
    //   + "&TeamTimeSlotID=" + $scope.CartItemList[0].bookingObj.TeamTimeSlotID
    //   + "&PaymentImage=" + jazzCashFilename
    //   + "&BillingAddress=" + $('#BillingAddress').val()
    //   + "&Status=" + true;

    // console.log(Url);
    HTTP.post(api.AddOrUpdatePatientAppointments,reqObj, function (status, response) {
      if (status) {
        $scope.checkOutLoader = true;
        alert("Order Placed Successfully");
        $window.localStorage.setItem('CartItemList', JSON.stringify(null));
        window.location.href = 'patient-profile.html'
      }
    });
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


  $scope.CallLabTestApi = CallLabTestApi;
  function CallLabTestApi() {
    $scope.checkOutLoader = true;
    var reqObj = {
      "LabTestList": []
    }
    // if( $scope.AppliedDiscountObj != null){
    //   reqObj.DiscountVoucherID =  $scope.AppliedDiscountObj.DiscountVoucherID;
    //   reqObj.VoucherTitle =  $scope.SelectedVoucherTitle;
    //   reqObj.DiscountVoucherAmount =  $scope.AppliedDiscountObj.DiscountAmount;
    //   reqObj.DiscountVoucherPercentage =  $scope.AppliedDiscountObj.DiscountPercentage;
    // }
    for (var i = 0; i < $scope.CartItemList.length; i++) {

      reqObj.LabTestList.push(
        {
          "PatientLabTestID": null,
          "LabID": $scope.CartItemList[i].labTestObj.SelectedLabObj.LabID,
          "LabTestID": $scope.CartItemList[i].labTestObj.LabTestID,
          "UserID": JSON.parse($window.localStorage.getItem('UserInfo')).UserID,
          "AppointmentID": null,
          "DiscountPercentage": $scope.CartItemList[i].labTestObj.SelectedLabObj.DiscountPercentage,
          // "LabTestPrice": $scope.CartItemList[i].labTestObj.TotalAmount,
          "LabTestPrice": $scope.CartItemList[i].labTestObj.LabTestPrice,
          "SpecialityLogo": null,
          // "FinalAmount": $scope.totalBillAmount,
          "FinalAmount": $scope.CartItemList[i].labTestObj.TotalAmount,
          "LabResultFileAttachment": null,
          "PaymentImage": jazzCashFilename,
          "BillingAddress": $('#BillingAddress').val(),
          "Status": true

        }
      );


    }

    console.log("AddOrUpdatePatientLabTestsReqObj", reqObj);
    HTTP.post(api.AddOrUpdatePatientLabTests
      , reqObj
      , function (status, response) {
        if (response.data == true) {
          $scope.checkOutLoader = false;
          alert("Order Placed Successfully");
          $window.localStorage.setItem('CartItemList', JSON.stringify(null));
          window.location.href = 'patient-profile.html'
        }
      })


  }

  $scope.callFinalApi = callFinalApi;
  function callFinalApi(fileName) {

    $scope.checkOutLoader = true;
    var reqObj = {
      "PatientMedicineOrderID": null,
      "OrderNumber": null,
      "PrescriptionImage": PrescriptionFilename,
      // "PrescriptionImage": $scope.PrescriptionFilename,
      "PaymentImage": jazzCashFilename,
      "UserID": JSON.parse($window.localStorage.getItem('UserInfo')).UserID,
      "FinalAmount": $scope.totalBillAmount,
      "OrderDate": Constant.dateformate($('#OrderDate').val()),
      "BillingAddress": $('#BillingAddress').val(),
      "Status": true,
      "MedicineList": []
    }

    if( $scope.AppliedDiscountObj != null){
      reqObj.DiscountVoucherID =  $scope.AppliedDiscountObj.DiscountVoucherID;
      reqObj.VoucherTitle =  $scope.SelectedVoucherTitle;
      reqObj.DiscountVoucherAmount =  $scope.AppliedDiscountObj.DiscountAmount;
      reqObj.DiscountVoucherPercentage =  $scope.AppliedDiscountObj.DiscountPercentage;
    }
    for (var i = 0; i < $scope.CartItemList.length; i++) {
      if ($scope.CartItemList[i].MedObj.Quantity > 0) {
        reqObj.MedicineList.push(
          {
            "PatientMedicineID": null,
            "MedicineID": $scope.CartItemList[i].MedObj.MedicineID,
            "Quantity": $scope.CartItemList[i].MedObj.Quantity,
            "UnitPrice": $scope.CartItemList[i].MedObj.Price,
            "TotalPrice": $scope.CartItemList[i].MedObj.Price * $scope.CartItemList[i].MedObj.Quantity,
            "Status": true
          }
        );
      }

    }


    HTTP.post(api.AddOrUpdatePatientMedicineOrder
      , reqObj
      , function (status, response) {
        if (response.data == true) {
          $scope.checkOutLoader = true;
          alert("Order Placed Successfully");
          $window.localStorage.setItem('CartItemList', JSON.stringify(null));
          window.location.href = 'patient-profile.html'
        }
      })


  }

  $scope.CallMedApi = CallMedApi;
  function CallMedApi() {

    callFinalApi();
    // if (formdata != null) {

    // HTTP.postformData(api.UploadData, formdata[0], function (status, response) {
    //   if (formdata[0].fileFor == 'Prescription') {
    //     PrescriptionFilename = response.data.FileNames[0];
    //     if(formdata.length > 1){
    //       HTTP.postformData(api.UploadData, formdata[1], function (status, response) {
    //         jazzCashFilename = response.data.FileNames[0];
    //       })
    //     }else{
    //       callFinalApi(PrescriptionFilename,jazzCashFilename);
    //     }

    //   }else{
    //     jazzCashFilename = response.data.FileNames[0];
    //     HTTP.postformData(api.UploadData, formdata[1], function (status, response) {
    //       PrescriptionFilename = response.data.FileNames[0];
    //       callFinalApi(PrescriptionFilename,jazzCashFilename);
    //     })
    //   }

    // })


    // for (var i = 0; i < formdata.length; i++) {
    //   if (formdata[i].fileFor == 'Prescription') {

    //   } else if (formdata[i].fileFor == 'jazzCash') {
    //     HTTP.postformData(api.UploadData, formdata, function (status, response) {
    //       callFinalApi(response.data.FileNames[0]);
    //     })
    //   }
    // }


    // } else {
    //   callFinalApi(null);
    // }



  }



});