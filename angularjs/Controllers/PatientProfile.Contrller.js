var app = angular.module('app');
app.controller('PatientProfileController', function ($scope, $window, HTTP, api, Constant) {
  // app.controller('userController', function () {

  init();

  function init() {
    $scope.FileUploadConstants = Constant.FileUploadConstants();
    $scope.IsFeedBackSelected = true;
    $scope.UserImagePath = api.UserImagePath;
    $scope.ImagePath = api.ImagePath;
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    $scope.UserTypes = Constant.UserTypes();
    if ($scope.UserInfo == null) {
      window.location.href = 'login.html';
    } else {
      if ($scope.UserInfo.UserTypeID == $scope.UserTypes.Patient) {
        GetAppointmentsForPatientProfile();
        GetPatientLabTests($scope.UserInfo.UserID);
      } else {
        GetAppointmentsForDoctorProfile();
      }

    }



  }

  $scope.changeProfilePic = changeProfilePic;
  function changeProfilePic() {
    // $('#UploadFile').click().focus();
    $('#UploadFile').trigger('click');
  }




  $scope.uploadpic = uploadpic;
  function uploadpic(file) {
    if (Constant.validateFileSize(file)) {
      var formdata = new FormData();
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


        HTTP.get(api.AddOrUpdateUser
          + "?UserID=" + $scope.UserInfo.UserID
          + "&Name=" + $scope.UserInfo.Name
          + "&UserTypeID=" + $scope.UserInfo.UserTypeID
          + "&SpecialityID=" + $scope.UserInfo.SpecialityID
          + "&Experience=" + $scope.UserInfo.Experience
          + "&SatisfactionPercentage=" + $scope.UserInfo.SatisfactionPercentage
          + "&DisplayPicture=" + response.data.FileNames[0]
          + "&MobileNumber=" + $scope.UserInfo.MobileNumber
          + "&Password=" + $scope.UserInfo.Password
          + "&ResidentialAddress=" + $scope.UserInfo.ResidentialAddress
          + "&Education=" + $scope.UserInfo.Education
          + "&Status=" + true

          , function (status, response) {
            $scope.RegisterLoader = false;
            if (response.data != null) {
              $window.localStorage.setItem('UserInfo', JSON.stringify(response.data));
              $scope.UserInfo = response.data;
              // window.location.href = 'patient-profile.html'
              // $scope.IsUserAlreadyLoggedIn = true;

            }
          })

        $scope.selectedProfileFilename = file.files[0].name;
        var ProfileFilename = response.data.FileNames[0];

        formdata = null;

      })
    }

  }

  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = ToModule + '.html'
  }

  $scope.GoToteamInterection = GoToteamInterection;
  function GoToteamInterection(AppointmentObj) {
    $window.localStorage.setItem('AppointmentObj', JSON.stringify(AppointmentObj));

    window.location.href = 'patient-team-interection.html'

  }

  $scope.ChangeAppointmentList = ChangeAppointmentList;
  function ChangeAppointmentList(Day) {
    if (Day == 'Past') {
      $scope.PatientInfoObj.AppointmentList = $scope.PatientInfoObj.PastAppointments;
    } else if (Day == 'Today') {
      $scope.PatientInfoObj.AppointmentList = $scope.PatientInfoObj.PresentAppointments;
    } else if (Day == 'Upcoming') {
      $scope.PatientInfoObj.AppointmentList = $scope.PatientInfoObj.UpcomingAppointments;
    }

  }

  $scope.ViewTeams = ViewTeams;
  function ViewTeams(obj) {

    $scope.TeamDetailLoader = true;
    HTTP.get(api.GetTeamDetailsByTeamID
      + "?TeamID=" + obj.TeamID
      , function (status, response) {
        $scope.Loader = false;
        if (response.data != null) {
          $scope.TeamDetailLoader = false;
          $scope.TeamsDetailRes = response.data;
          if ($scope.TeamsDetailRes != null) {
            $scope.TeamsDetailList = $scope.TeamsDetailRes.TeamMembers;
          }


        }
      })
    $('#team_details_modal').modal('show');
  }
 
  $scope.FeedbackDialoge = FeedbackDialoge;
  function FeedbackDialoge(AppointmentObj) {
    $('#SelectedTeamID').prop('value', AppointmentObj.TeamID); 
    HTTP.get(api.GetRatingAndReviews
       + "?UserID="  + $scope.UserInfo.UserID
       + "&TeamID="  + AppointmentObj.TeamID
      , function (status, response) {
        $scope.UserFeedBackList = [];
        $scope.UserFeedBackList = response.data;
        $('#customer_rating').rateit();
        if (response.data != null && response.data.length > 0) {
           $scope.ReviewStatement =  response.data[0].ReviewStatement;
          $('#customer_rating').rateit('value', response.data[0].Rating);
          $('#customer_rating').rateit('readonly', true);
        }
      })
    $('#FeedBack_modal').modal('show');
  }

  $scope.AddOrUpdateRatingAndReviews = AddOrUpdateRatingAndReviews;
  function AddOrUpdateRatingAndReviews() {
    console.log("plplpl");
    var ratingSelectedValue = $('#customer_rating').rateit('value');


    var reqObj = {
      "RatingReviewID": null,
      "Rating": ratingSelectedValue,
      "ReviewStatement": $scope.ReviewStatement,
      "UserID": $scope.UserInfo.UserID,
      "TeamID": $('#SelectedTeamID').val(),
      "Status": true
    }
    

    console.log("AddOrUpdateRatingAndReviews_reqObj",reqObj)
    $scope.Loader = true;
    HTTP.post(api.AddOrUpdateRatingAndReviews
      , reqObj
      , function (status, response) {
        $scope.Loader = false;
        if (response.data != null) {
          $('#FeedBack_modal').modal('hide');

        }
      })
  }
  $scope.GetAppointmentsForDoctorProfile = GetAppointmentsForDoctorProfile;
  function GetAppointmentsForDoctorProfile() {

    $scope.Loader = true;
    HTTP.get(api.GetAppointmentsForDoctorProfile
      + "?UserID=" + $scope.UserInfo.UserID
      , function (status, response) {
        $scope.Loader = false;
        if (response.data != null) {
          $scope.PatientInfoObj = response.data;
          $scope.PatientInfoObj.AppointmentList = $scope.PatientInfoObj.PresentAppointments;

        }
      })
  }
  $scope.GetAppointmentsForPatientProfile = GetAppointmentsForPatientProfile;
  function GetAppointmentsForPatientProfile() {

    $scope.Loader = true;
    HTTP.get(api.GetAppointmentsForPatientProfile
      + "?UserID=" + $scope.UserInfo.UserID
      , function (status, response) {
        $scope.Loader = false;
        if (response.data != null) {
          $scope.PatientInfoObj = response.data;
          $scope.PatientInfoObj.AppointmentList = $scope.PatientInfoObj.PresentAppointments;

        }
      })
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


  $scope.CallLabTestApi = CallLabTestApi;
  function CallLabTestApi() {
    $scope.checkOutLoader = true;
    var reqObj = {
      "LabTestList": []
    }
    for (var i = 0; i < $scope.CartItemList.length; i++) {

      reqObj.LabTestList.push(
        {
          "PatientLabTestID": null,
          "LabID": $scope.CartItemList[i].labTestObj.SelectedLabObj.LabID,
          "LabTestID": $scope.CartItemList[i].labTestObj.LabTestID,
          "UserID": JSON.parse($window.localStorage.getItem('UserInfo')).UserID,
          "AppointmentID": null,
          "DiscountPercentage": $scope.CartItemList[i].labTestObj.SelectedLabObj.DiscountPercentage,
          "LabTestPrice": $scope.CartItemList[i].labTestObj.TotalAmount,
          "SpecialityLogo": null,
          "FinalAmount": $scope.totalBillAmount,
          "LabResultFileAttachment": null,
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
          window.location.href = 'index.html'
        }
      })


  }
  $scope.CallMedApi = CallMedApi;
  function CallMedApi() {
    $scope.checkOutLoader = true;
    var reqObj = {
      "PatientMedicineOrderID": null,
      "OrderNumber": null,
      "UserID": JSON.parse($window.localStorage.getItem('UserInfo')).UserID,
      "FinalAmount": $scope.totalBillAmount,
      "Status": true,
      "MedicineList": []
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
          window.location.href = 'index.html'
        }
      })
  }


  $scope.LabTestList = [];
  $scope.GetPatientLabTests = GetPatientLabTests;
  function GetPatientLabTests(UserID) {
    HTTP.get(api.GetPatientLabTests + "?UserID=" + UserID, function (status, response) {
      $scope.LabTestList = response.data;
    })
  }


  $scope.MedicineDetails = MedicineDetails;
  function MedicineDetails(obj) {

    console.log(obj);
    $('#DetailModelDiv').modal('show');
    HTTP.get(api.GetPatientMedicineOrderDetails + "?PatientMedicineOrderID=" + obj.PatientMedicineOrderID, function (status, response) {
      $scope.OrderDetailList = response.data;
    })

  }


});