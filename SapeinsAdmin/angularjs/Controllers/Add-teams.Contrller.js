var app = angular.module('app');
app.controller('AddTeamsController', function ($scope, HTTP, api, Constant, $rootScope) {



  formdata = null;
  $scope.SelectedDay = null;
  $scope.IsSetToAll = false;
  init();

  function init() {

    $scope.SelectedTeamObj = JSON.parse(localStorage.getItem("SelectedTeam"));

    console.log($scope.SelectedTeamObj);

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

    $scope.users = Constant.UserTypes();
    console.log($scope.users);
    $scope.PicBaseURL = api.ImageBaseUrl;

    if ($scope.SelectedTeamObj == null) {
      $scope.TeamObj = {
        "TeamID": null,
        "SpecialityID": null,
        "SessionCharges": null,
        "Status": true,
        "TimeSlots": [],
        "TeamMembers": []
      }
    } else {
      GetTeamDetailsByTeamID($scope.SelectedTeamObj.TeamID)
    }


    GetAllSpecialities();
  }

  $scope.SelectedUserTypeID = null;
  $scope.SelectUser = SelectUser;
  function SelectUser(userTypeID) {

    $scope.SelectedUserTypeID = userTypeID;
    GetAllUsers(userTypeID);
    $('#Add_User_details').modal('show');
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

  $scope.SetSelecteduser = SetSelecteduser;

  $scope.selectedDoctor = null;
  $scope.selectedPharmacist = null;
  $scope.selectedNutritionist = null;

  function SetSelecteduser(UserObj) {

    if ($scope.SelectedUserTypeID == $scope.users.Doctor) {
      $scope.selectedDoctor = UserObj;

    } else if ($scope.SelectedUserTypeID == $scope.users.Pharmacist) {
      $scope.selectedPharmacist = UserObj;

    } else if ($scope.SelectedUserTypeID == $scope.users.Nutritionist) {
      $scope.selectedNutritionist = UserObj;
    }

    $scope.IsFound = false;

    if ($scope.SelectedTeamObj != null) {
      $.each($scope.TeamObj.TeamMembers, function (i) {
        if ($scope.TeamObj.TeamMembers[i].UserTypeID == $scope.SelectedUserTypeID) {
          // $scope.TeamObj.TeamMembers.splice(i,1)
          $scope.TeamObj.TeamMembers[i].Status = false;
          return false;
        }
      })
    }

    $.each($scope.TeamObj.TeamMembers, function (i) {
      if ($scope.TeamObj.TeamMembers[i].UserID == UserObj.UserID) {
        $scope.IsFound = true;
        return false
      }
    });

    if ($scope.IsFound == false) {

      $scope.TeamObj.TeamMembers.push({
        "UserID": UserObj.UserID,
        "Status": true
      });
    }




    console.log($scope.TeamObj.TeamMembers);
    $('#Add_User_details').modal('hide');
  }

  $scope.deleteTime = deleteTime;
  function deleteTime(index) {
    $scope.TeamObj.TimeSlots[index].Status = false;
  }

  $scope.SetTime = SetTime;
  function SetTime(SelectedTime) {
    // console.log(SelectedTime);
    if (typeof SelectedTime != 'undefined') {
      $scope.TeamObj.TimeSlots.push({
        "TeamTimeSlotID": null,
        "DayNumber": $scope.SelectedDay,
        "TimeSlot": SelectedTime,
        "Status": true
      })
      console.log($scope.TeamObj.TimeSlots);
    }

  }


  $scope.SetSelectedDay = SetSelectedDay;
  function SetSelectedDay(day) {
    $scope.SelectedDay = day.dayNumber;
    $.each($scope.days, function (i) {
      if ($scope.days[i].dayNumber == day.dayNumber) {
        $scope.days[i].Selected = true;
      } else {
        $scope.days[i].Selected = false;
      }
    })
  }

  $scope.AddTeams = AddTeams;
  function AddTeams() {
    $.each($scope.TeamObj.TimeSlots, function (i) {
      $scope.TeamObj.TimeSlots[i].TimeSlot = (Constant.timeformate($scope.TeamObj.TimeSlots[i].TimeSlot) != 'Invalid date' ? Constant.timeformate($scope.TeamObj.TimeSlots[i].TimeSlot) : $scope.TeamObj.TimeSlots[i].TimeSlot);
      console.log($scope.TeamObj.TimeSlots[i].TimeSlot)

    });

    console.log($scope.TeamObj)
    HTTP.post(api.AddOrUpdateTeams, $scope.TeamObj, function (status, response) {
      if (status) {

        location.reload();
      }
    })
  }


  function InvalidDate() {

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


  $scope.ErrorMessage = "";
  $scope.FormValidation = FormValidation;
  function FormValidation() {
    if ($scope.TeamObj.TeamMembers.length < 3) {
      $scope.ErrorMessage = "Please select doctor, pharmacist, nutritionist.";
      return false;
    }
    if ($scope.TeamObj.TimeSlots.length < 1) {
      $scope.ErrorMessage = "Please enter time slots.";
      return false;
    } else if ($scope.TeamObj.SessionCharges == null
      || $scope.TeamObj.SessionCharges == ""
      || $scope.TeamObj.SessionCharges == 0) {

      $scope.ErrorMessage = "Session charges required.";

    } else if ($scope.TeamObj.SpecialityID == null
      || $scope.TeamObj.SpecialityID == ""
      || $scope.TeamObj.SpecialityID == 0) {
      $scope.ErrorMessage = "Please select speciality.";
    } else {
      AddTeams();
    }

  }


  $scope.GetTeamDetailsByTeamID = GetTeamDetailsByTeamID;
  function GetTeamDetailsByTeamID(TeamID) {
    HTTP.get(api.GetTeamDetailsByTeamID + "?TeamID=" + TeamID, function (status, response) {
      if (status) {

        $scope.TeamObj = response.data;
        $scope.TeamObj.Status = true;

        $.each($scope.TeamObj.TimeSlots, function (i) {
          $scope.TeamObj.TimeSlots[i].TimeSlot = moment($scope.TeamObj.TimeSlots[i].TimeSlot, 'hh:mm a').format('hh:mm a');

        })
        $.each($scope.TeamObj.TeamMembers, function (i) {

          // if($scope.TeamObj.TeamMembers[i].UserTypeID == )

          if ($scope.TeamObj.TeamMembers[i].UserTypeID == $scope.users.Doctor) {
            $scope.selectedDoctor = $scope.TeamObj.TeamMembers[i];

          } else if ($scope.TeamObj.TeamMembers[i].UserTypeID == $scope.users.Pharmacist) {
            $scope.selectedPharmacist = $scope.TeamObj.TeamMembers[i];

          } else if ($scope.TeamObj.TeamMembers[i].UserTypeID == $scope.users.Nutritionist) {
            $scope.selectedNutritionist = $scope.TeamObj.TeamMembers[i];
          }
        })

        $scope.SelectedDay = 1;
        SetSelectedDay({ "dayNumber": $scope.SelectedDay });
      }
    });

  }

  $scope.SetAllSlots = SetAllSlots;
    function SetAllSlots(IsSetToAll) {


      if (IsSetToAll == true) {
        if ($scope.SelectedDay == null) {
          $scope.ErrorMessage = "Please select a day.";
          // return false;
        } else if ($scope.TeamObj.TimeSlots.length == 0) {
          $scope.ErrorMessage = "Time slot not available.";
          // return false;
        }

        var NewTimeSlots = []
        $.each($scope.TeamObj.TimeSlots, function (i) {
          if ($scope.TeamObj.TimeSlots[i].DayNumber != $scope.SelectedDay) {
            $scope.TeamObj.TimeSlots[i].Status = false;
            console.log($scope.TeamObj.TimeSlots[i].Status);

          } else if ($scope.TeamObj.TimeSlots[i].DayNumber == $scope.SelectedDay) {
            NewTimeSlots.push($scope.TeamObj.TimeSlots[i]);
          }

        });

        $.each($scope.days, function (di) {
          $.each(NewTimeSlots, function (ii) {
            if ($scope.days[di].dayNumber != $scope.SelectedDay) {
              $scope.TeamObj.TimeSlots.push({
                "TeamTimeSlotID": null,
                "DayNumber": $scope.days[di].dayNumber,
                "TimeSlot": NewTimeSlots[ii].TimeSlot,
                "Status": true
              });
            }


          });
        });
      } else {
        $.each($scope.TeamObj.TimeSlots, function (i) {
          if ($scope.TeamObj.TimeSlots[i].DayNumber != $scope.SelectedDay) {
            $scope.TeamObj.TimeSlots[i] = [];
          }
        });
      }
    }


});