var app = angular.module('app');
app.controller('MedController', function ($scope, $window, HTTP, api) {
  // app.controller('userController', function () {

  init();

  function init() {
    console.log("okokok");
    // $scope.CartItemList
    $scope.PageSize = 30;
    $scope.ImagePath = api.ImageBaseUrl;
    $scope.CartItemList = JSON.parse($window.localStorage.getItem('CartItemList'));
    if($scope.CartItemList == null || $scope.CartItemList[0].MedObj == null){
      $scope.CartItemList = [];
    }
    
   

    // $scope.query = $window.localStorage.getItem('UniversalSearchQuery')
    GetAllMedicines(true,null);

  }

  

  $scope.GoToCheckOut = GoToCheckOut;
  function GoToCheckOut() {
    if ($scope.CartItemList.length > 0) {
      $window.localStorage.setItem('CartItemList', JSON.stringify($scope.CartItemList));
      $window.localStorage.setItem('FromModule','Med');
      window.location.href = 'checkout.html'
    } else {
      alert("Cart is Empty");
    }
  }

  $scope.addToCart = addToCart;
  function addToCart(MedObj, IsAdded) {
    if (IsAdded == true) {
      var CartItemObj = {};
      CartItemObj.MedObj = MedObj;
      $scope.CartItemList.push(
        CartItemObj
      );
    } else {
      MedObj.Quantity = 0;
      for (var i = 0; i < $scope.CartItemList.length; i++) {
        if ($scope.CartItemList[i].MedObj.MedicineID == MedObj.MedicineID) {
          $scope.CartItemList.splice(i, 1);
        }
      }
    }
  }
  $scope.updateItemQuantity = updateItemQuantity;
  function updateItemQuantity(MedObj, IsAdded) {
    MedObj.Quantity =  MedObj.Quantity || 0;
    if(IsAdded == true){
      MedObj.Quantity++;
    }else{
      if(MedObj.Quantity > 1){
        MedObj.Quantity--;
      }
    } if(MedObj.Quantity = 0)
    {
      alert("Medicine is not available")
    }
  }

  // $scope.GetAllMedicines = GetAllMedicines;
  // function GetAllMedicines() {
  //   HTTP.get(api.GetAllMedicines
  //     + "?query=" + null
  //     + "&PageNumber=" + 1
  //     + "&PageSize=" + 10
  //     , function (status, response) {
  //       if (response.data != null) {
  //         $scope.MedList = response.data;
  //       }
  //     })
  // }


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