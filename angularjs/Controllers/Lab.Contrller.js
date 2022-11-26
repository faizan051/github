var app = angular.module('app');
app.controller('labController', function ($scope, $window, HTTP, api) {
  // app.controller('userController', function () {

  init();

  function init() {
    $scope.ImagePath = api.ImagePath;
   
    $scope.CartItemList = JSON.parse($window.localStorage.getItem('CartItemList'));
    if($scope.CartItemList == null || $scope.CartItemList[0].labTestObj == null){
      // $rootScope.$emit('CartItemList',[]);
      $scope.CartItemList = [];
    }
    // $scope.SpecialityID = null;
    // $scope.query = $window.localStorage.getItem('UniversalSearchQuery')
    GetAllLabs();
    GetAllLabTests();
  }

  $scope.GoToCheckOut = GoToCheckOut;
  function GoToCheckOut() {
    if ($scope.CartItemList.length > 0) {

      $window.localStorage.setItem('CartItemList', JSON.stringify($scope.CartItemList));
      $window.localStorage.setItem('FromModule', 'Lab');
      window.location.href = 'checkout.html'
    } else {
      alert("Cart is Empty");
    }



  }
  $scope.addToCart = addToCart;
  function addToCart(labTestObj, IsAdded) {

    for (var i = 0; i < $scope.CartItemList.length; i++) {
      if ($scope.CartItemList[i].labTestObj.LabTestID == labTestObj.LabTestID) {
        $scope.CartItemList.splice(i, 1);
      }
    }

    if (IsAdded == true) {
      if (labTestObj.SelectedLabObj.DiscountPercentage == null || labTestObj.SelectedLabObj.DiscountPercentage == 0) {
        labTestObj.DiscountAmmount = 0;
        labTestObj.TotalAmount = labTestObj.LabTestPrice;
      } else {
        labTestObj.DiscountAmmount = ((labTestObj.LabTestPrice * labTestObj.SelectedLabObj.DiscountPercentage) / 100);
        labTestObj.TotalAmount = labTestObj.LabTestPrice - ((labTestObj.LabTestPrice * labTestObj.SelectedLabObj.DiscountPercentage) / 100);
      }
      var CartItemObj = {};
      CartItemObj.labTestObj = labTestObj;
      $scope.CartItemList.push(
        CartItemObj
      );


    } else {
      labTestObj.SelectedLabObj = null;
      labTestObj.DiscountAmmount = 0;
      labTestObj.TotalAmount = labTestObj.LabTestPrice;
      // for (var i = 0; i < $scope.CartItemList.length; i++) {
      //   if ($scope.CartItemList[i].labTestObj.LabTestID == labTestObj.LabTestID) {
      //     $scope.CartItemList.splice(i, 1);
      //   }
      // }
    }
  }
  $scope.GetAllLabs = GetAllLabs;
  function GetAllLabs() {
    HTTP.get(api.GetAllLabs
      , function (status, response) {
        if (response.data != null) {
          $scope.LabList = response.data;

        }
      })
  }
  $scope.GetAllLabTests = GetAllLabTests;
  function GetAllLabTests() {
    HTTP.get(api.GetAllLabTests
      + "?query=" + $scope.query
      , function (status, response) {
        if (response.data != null) {
          $scope.LabTestList = response.data;

        }
      })
  }
  // $scope.SearchLabTest = SearchLabTest;
  // function SearchLabTest() {

  //   var SpecialityIDList=';';
  //   var IsSpeciallitySelected = false;
  //   for(var i = 0; i<$scope.SpecialityList.length; i++){
  //     if($scope.SpecialityList[i].IsSelected == true){
  //       IsSpeciallitySelected = true;
  //       SpecialityIDList+= $scope.SpecialityList[i].SpecialityID + ";";
  //     }
  //   }
  //   if(IsSpeciallitySelected != true){

  //     SpecialityIDList = null;
  //   }

  //  HTTP.get(api.GetAllLabTests
  //       +  "?SpecialityID=" + SpecialityIDList
  //       +  "&query=" + $scope.teamSearchQuery
  //     , function (status, response) {
  //       if (response.data != null) {
  //         $scope.TeamList = response.data;

  //       } 
  //     })
  // }


});