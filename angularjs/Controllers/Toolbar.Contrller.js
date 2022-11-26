var app = angular.module('app');
app.controller('ToolbarController', function ($scope, $window, api) {
  // app.controller('userController', function () {


  init();

  function init() {
    var url = window.location.pathname;
    $scope.HtmlFilename = url.substring(url.lastIndexOf('/')+1);
    // $scope.FromModule = $window.localStorage.getItem('FromModule');
    // $scope.CartItemList = JSON.parse($window.localStorage.getItem('CartItemList'));
    // if($scope.HtmlFilename == 'med.html' &&   $scope.CartItemList != null &&  $scope.CartItemList[0].MedObj == null ){
    //   $scope.CartItemList = []
    // }else  if($scope.HtmlFilename == 'labs.html' &&   $scope.CartItemList != null &&  $scope.CartItemList[0].LabObj == null ){
    //   $scope.CartItemList = []
    // }else  if($scope.HtmlFilename == 'booking.html' &&   $scope.CartItemList != null &&  $scope.CartItemList[0].bookingObj == null ){
    //   $scope.CartItemList = []
    // }

    $scope.ImagePath = api.ImageBaseUrl;
    $scope.UserInfo =JSON.parse($window.localStorage.getItem('UserInfo'));
    console.log(" $scope.UserInfo", $scope.UserInfo);

    // alert(filename);
     
  }

//   $rootScope.$on('CartItemList',function(event,data){
//     console.log("toolbar",data) // you'll see your_data_to_be_passed
//     $scope.CartItemList = data;
// }) 
 
  $scope.GoToModule = GoToModule;
  function GoToModule(ModTilte) {
    if(ModTilte == 'team'){
      $window.localStorage.setItem('SpecialityID', null);
      $window.localStorage.setItem('UniversalSearchQuery', null);
    }
    // else if(ModTilte == 'Labs'){
    //   $window.localStorage.setItem('SpecialityID', null);
    //   $window.localStorage.setItem('UniversalSearchQuery', null);
    //   window.location.href = 'labs.html'
    // }
    // else if(ModTilte == 'Medicines'){
    //   $window.localStorage.setItem('SpecialityID', null);
    //   $window.localStorage.setItem('UniversalSearchQuery', null);
    //   window.location.href = 'med.html'
    // }
    window.location.href = ModTilte + '.html'
  }
 
  $scope.LogOut = LogOut;
  function LogOut(ToModule) {
    $window.localStorage.setItem('UserInfo', null);
    window.location.href =  ToModule + '.html'
  }

});