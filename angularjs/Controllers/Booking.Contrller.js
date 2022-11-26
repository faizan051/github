




var app = angular.module('app');
app.controller('BookingController', function ($scope, $window, HTTP, api, Constant,$timeout) {
  // app.controller('userController', function () {


    // $scope.$watch("RatingAndReviewsList", function (value) { 
    //   var val = value || null;
    //   if (val) {
    //     if ($('.rateit').length > 0) {
    //       $timeout(function () {
    //         for (var i = 0; i < $scope.RatingAndReviewsList.length; i++) {
    //           $('#customer_rating_' + i).rateit();

    //           $('#customer_rating_' + i).rateit('value', ($scope.RatingAndReviewsList[i].Rating == null ? 0 : $scope.RatingAndReviewsList[i].Rating));
    //           $('#customer_rating_' + i).rateit('readonly', true);
    //         }
    //       });
  
    //     }
    //   }
    // });


  $scope.selectedDate = new Date();
  $scope.SelectedDay = null;
  console.log("uhuhuhuh");
  init();
  $scope.CartItemList = JSON.parse($window.localStorage.getItem('CartItemList'));
  if ($scope.CartItemList == null || $scope.CartItemList[0].bookingObj == null) {
    // $rootScope.$emit('CartItemList',[]);
    $scope.CartItemList = [];
  }
  $scope.minSelectedDate = new Date();
  $scope.days = [
    {
      "dayNumber": 1,
      "dayTitle": "Mon",
      "Selected": false
    },
    {
      "dayNumber": 2,
      "dayTitle": "Tue",
      "Selected": false
    },
    {
      "dayNumber": 3,
      "dayTitle": "Wed",
      "Selected": false
    }, {
      "dayNumber": 4,
      "dayTitle": "Thu",
      "Selected": false
    }
    , {
      "dayNumber": 5,
      "dayTitle": "Fri",
      "Selected": false
    }
    , {
      "dayNumber": 6,
      "dayTitle": "Sat",
      "Selected": false
    }
    , {
      "dayNumber": 0,
      "dayTitle": "Sun",
      "Selected": false
    }
  ];
  function init() {
    $scope.abc = "okokokoko"
    $scope.UserImagePath = api.UserImagePath;
    $scope.teamObj = JSON.parse(localStorage.getItem('selectedteam'));
    console.log($scope.teamObj);
    $scope.UserInfo = JSON.parse($window.localStorage.getItem('UserInfo'));
    var url = window.location.pathname;
    $scope.HtmlFilename = url.substring(url.lastIndexOf('/') + 1);
    GetTeamDetailsByTeamID($scope.teamObj.TeamID);
    GetRatingAndReviews();

  }

  $scope.LogOut = LogOut;
  function LogOut() {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href = 'index.html'
  }

  $scope.AddOrUpdatePatientAppointments = AddOrUpdatePatientAppointments;
  function AddOrUpdatePatientAppointments() {
    var url = api.AddOrUpdatePatientAppointments
      + "?AppointmentID=" + null
      + "&UserID=" + null
      + "&TeamID=" + null
      + "&SessionCharges=" + null
      + "&SessionStartDate=" + null
      + "&SessionStartTime=" + null
      + "&TeamTimeSlotID=" + null
      + "&Status=" + true;

    HTTP.get(function (status, response) {

    });
  }


  // $scope.TeamDetails = null;
  // $scope.GetTeamDetailsByTeamID = GetTeamDetailsByTeamID;
  // function GetTeamDetailsByTeamID() {
  //   HTTP.get(api.GetTeamDetailsByTeamID + "?TeamID=" + $scope.teamObj.TeamID, function (status, response) {
  //     if (status) {
  //       $scope.TeamDetails = response.data;
  //       console.log($scope.TeamDetails)
  //     }
  //   });
  // }

  $scope.GetRatingAndReviews = GetRatingAndReviews;
  function GetRatingAndReviews() {
    $scope.IsTeamFeedbackLoaded = false;
    $scope.GetRatingAndReviewsLoader = true;
    HTTP.get(api.GetRatingAndReviews
      + "?UserID=" + null
      + "&TeamID=" + $scope.teamObj.TeamID
      , function (status, response) {
        $scope.GetRatingAndReviewsLoader = false;
        if (status) {
          $scope.RatingAndReviewsList = response.data;
          // $('.rateit').rateit();
          $timeout(function () {
            customer_overAll_rating
            $('#customer_overAll_rating').rateit();

            $('#customer_overAll_rating').rateit('value', ($scope.teamObj.AverageRating == null ? 0 : $scope.teamObj.AverageRating));
            $('#customer_overAll_rating').rateit('readonly', true);
            for (var i = 0; i < $scope.RatingAndReviewsList.length; i++) {
              $('#customer_rating_' + i).rateit();

              $('#customer_rating_' + i).rateit('value', ($scope.RatingAndReviewsList[i].Rating == null ? 0 : $scope.RatingAndReviewsList[i].Rating));
              $('#customer_rating_' + i).rateit('readonly', true);
            }
          }, 2000);
          $scope.IsTeamFeedbackLoaded = true;
        }
      });
  }

  $scope.SetSelectedDay = SetSelectedDay;
  function SetSelectedDay(day) {


    if ($('#selectedDate').val() < Constant.dateformate(new Date())) {
      $scope.selectedDate = new Date();
      alert("Date Cannot be lesser then Today Date");
      $('#selectedDate').val(Constant.dateformate(new Date()));
      // $timeout( function(){
      //   $scope.OrderDate  = new Date();
      // }, 5000);

    }

    // console.log($scope.selectedDate.getDay());
    var day = $scope.selectedDate.getDay();
    $scope.SelectedDay = day;

    HTTP.get(api.GetAvailableTimeSlotByTeamIDAndDate
      + "?TeamID=" + $scope.teamObj.TeamID
      + "&Date=" + Constant.dateformate($scope.selectedDate)
      , function (status, response) {
        if (status) {
          $scope.TeamDetails.TimeSlots = response.data;
          $.each($scope.TeamDetails.TimeSlots, function (i) {
            $scope.TeamDetails.TimeSlots[i].TimeSlotT = angular.copy($scope.TeamDetails.TimeSlots[i].TimeSlot);
            $scope.TeamDetails.TimeSlots[i].TimeSlot = moment($scope.TeamDetails.TimeSlots[i].TimeSlot, 'hh:mm a').format('hh:mm a');
          })

          console.log($scope.TeamDetails)
        }
      });






  }


  $scope.GetTeamDetailsByTeamID = GetTeamDetailsByTeamID;
  function GetTeamDetailsByTeamID(TeamID) {
    HTTP.get(api.GetTeamDetailsByTeamID + "?TeamID=" + TeamID, function (status, response) {
      if (status) {

        $scope.TeamDetails = response.data;
        $scope.TeamDetails.Status = true;

        // $.each($scope.TeamDetails.TimeSlots, function (i) {
        //   $scope.TeamDetails.TimeSlots[i].TimeSlotT = angular.copy($scope.TeamDetails.TimeSlots[i].TimeSlot);
        //   $scope.TeamDetails.TimeSlots[i].TimeSlot = moment($scope.TeamDetails.TimeSlots[i].TimeSlot, 'hh:mm a').format('hh:mm a');
        // })
        $scope.SetSelectedDay();
        // $.each($scope.TeamDetails.TeamMembers, function (i) {

        //   // if($scope.TeamDetails.TeamMembers[i].UserTypeID == )

        //   if ($scope.TeamDetails.TeamMembers[i].UserTypeID == $scope.users.Doctor) {
        //     $scope.selectedDoctor = $scope.TeamDetails.TeamMembers[i];

        //   } else if ($scope.TeamDetails.TeamMembers[i].UserTypeID == $scope.users.Pharmacist) {
        //     $scope.selectedPharmacist = $scope.TeamDetails.TeamMembers[i];

        //   } else if ($scope.TeamDetails.TeamMembers[i].UserTypeID == $scope.users.Nutritionist) {
        //     $scope.selectedNutritionist = $scope.TeamDetails.TeamMembers[i];
        //   }
        // })


        // SetSelectedDay({ "dayNumber": $scope.SelectedDay });
      }
    });
  }

  $scope.CartItemList = [];
  $scope.SelectTime = SelectTime;
  function SelectTime(index, time) {
    console.log(time)
    $scope.TeamDetails.TimeSlots[index].IsSelected = true;

    $.each($scope.TeamDetails.TimeSlots, function (i) {
      if (index != i) {
        $scope.TeamDetails.TimeSlots[i].IsSelected = false;
      }
    });
    $scope.SelectedSlot = $scope.TeamDetails.TimeSlots[index];


    // var DateOBj = { "selectedDate": $scope.selectedDate }

    // console.log($window.localStorage.getItem('selectedDateOBj'));


  }

  $scope.ProceedToPay = ProceedToPay;
  function ProceedToPay() {
    $scope.CartItemList.push({ "bookingObj": $scope.SelectedSlot });
    $window.localStorage.setItem('FromModule', 'booking');
    $window.localStorage.setItem('selectedDateOBj', JSON.stringify($scope.selectedDate));
    localStorage.setItem('TeamDetails', JSON.stringify($scope.TeamDetails));
    localStorage.setItem('CartItemList', JSON.stringify($scope.CartItemList));
    window.location.href = 'checkout.html';
  }



});