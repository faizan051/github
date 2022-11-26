(function () {
    'use strict';

    angular
        .module('app')
        .directive('yCustomImageUpload', yCustomImageUploadDirective);

    /** @ngInject */
    function yCustomImageUploadDirective($compile,api,$http,Dialog ,StorageService,localStorageService) {
        return {
            restrict: 'E',
            scope: {
                value: "="
            },
            //use in html
            //  <y-custom-image-upload value="vm.AttachmentList"></y-custom-image-upload>
                template : 	'<div><input class="fileUpload" type="file" />'+
                        '<div class="dropzone">'+
                            '<p style="cursor:pointer" class="msg">Click or Drag and Drop files to upload </p>'+
                       '</div>'+
                       '<div class="preview clearfix">'+
                               '<div class="previewData clearfix" ng-repeat="data in value track by $index">'+
                                   '<img src={{data.src}} accept="image/*"></img>'+
                                   '<div class="previewDetails">'+
                                       '<div class="detail"><b>Name : </b>{{data.name}}</div>'+
                                       '<div class="detail"><b>Type : </b>{{data.type}}</div>'+
                                       '<div class="detail"><b>Size : </b> {{data.size}}</div>'+
                                   '</div>'+
                                   '<div class="previewControls">'+
                                    //    '<span ng-click="upload(data)" class="circle upload">'+
                                    //     //    '<i class="fa fa-check"></i>'+
                                    //        ' <md-icon style="color:green" md-font-icon="icon-check s24"></md-icon>'+
                                    //    '</span>'+
                                       '<span  ng-click="remove(data)" class="remove">'+
                                        //    '<i class="fa fa-close"></i>'+
                                           ' <md-icon style="color:red" md-font-icon="icon-close s24"></md-icon>'+
                                       '</span>'+
                                   '</div>'+
                                    '<textarea' +
                                    '    placeholder="Description"' +
                                    '    style="border:3px solid rgba(0, 0, 0, 0.12);width:98%;margin:15px 0;padding:1%;"' +
                                    '    ng-model="data.SubmittedCampusVisitAttachmentComments" rows="6" cols="100">' +
                                    '</textarea>' +
                               '</div>'+	
                       '</div></div>',
            replace: true,
                link : function(scope,elem,attrs){
                
                // scope.AttachmentList = [];	

                    // scope.url = "aho ne aho";
                    // console.log(" D  scope.url", scope.url);
                function previewFile(file){
                    var reader = new FileReader();
                    // var obj = new FormData().append('file',file);			
                    // var obj = new FormData().append("uploadedFile", file.files[0])
                    var formData = new FormData();
                    formData.append("uploadedFile", file);
                    reader.onload=function(data){
                        var src = data.target.result;
                        var size = ((file.size/(1024*1024)) > 1)? (file.size/(1024*1024)) + ' mB' : (file.size/		1024)+' kB';
                        scope.$apply(function(){
                            scope.value.push({'name':file.name,'size':size,'type':file.type,
                                                    'src':src});
                                                    // 'src':src,'data':obj});
                        });	
                        scope.upload(formData,scope.value[scope.value.length - 1])							
                        console.log(scope.value);
                    }
                    reader.readAsDataURL(file);
                }

                function uploadFile(e,type){
                    e.preventDefault();			
                    var files = "";
                    if(type == "formControl"){
                        files = e.target.files;
                    } else if(type === "drop"){
                        files = e.originalEvent.dataTransfer.files;
                    }			
                    for(var i=0;i<files.length;i++){
                        var file = files[i];
                        if(file.type.indexOf("image") !== -1){
                            previewFile(file);								
                        } else {
                            alert(file.name + " is not supported");
                        }
                    }
                }	
                elem.find('.fileUpload').bind('change',function(e){
                    uploadFile(e,'formControl');
                });

                elem.find('.dropzone').bind("click",function(e){
                    $compile(elem.find('.fileUpload'))(scope).trigger('click');
                });

                elem.find('.dropzone').bind("dragover",function(e){
                    e.preventDefault();
                });

                elem.find('.dropzone').bind("drop",function(e){
                    uploadFile(e,'drop');																		
                });
                scope.upload=function(formData,obj){
                    // $http({method:scope.method,url:scope.url,data: obj.data,
                    //     headers: {'Content-Type': undefined},transformRequest: angular.identity
                    // }).success(function(data){

                    // });
                    $http({
                        method: "POST",
                        url: api.baseFileServerUrl + api.uploadImage,
                        // transformRequest: [],
                        transformRequest: angular.identity,
                        headers: {
                            'Content-Type': undefined,
                            'Authorization': 'bearer ' + StorageService.getItem(localStorageService, 'TOKKEN_KEY').access_token
                        },
                        data: formData
                    }).then(function mySucces(response) {
                        // console.log("response.data.FileNames",response.data.FileNames);
                        obj.AttachmentTitle = response.data.FileNames[0];
        
                    }, function (error) {
                        Dialog.ok("something went wrong");
                        console.log(error);
                    })
                }

                scope.remove=function(data){
                    var index= scope.value.indexOf(data);
                    scope.value.splice(index,1);
                }
            }
        }

        // return {
        //     restrict : 'E',
        //     scope : {
        //         AttachmentList : "=AttachList"
        //     },
        //     template : 	'<input class="fileUpload" type="file" multiple />'+
        //                 '<div class="dropzone">'+
        //                     '<p class="msg">Click or Drag and Drop files to upload {{AttachmentList[0]}}</p>'+
        //                '</div>'+
        //                '<div class="preview clearfix">'+
        //                        '<div class="previewData clearfix" ng-repeat="data in AttachmentList track by $index">'+
        //                            '<img src={{data.src}}></img>'+
        //                            '<div class="previewDetails">'+
        //                                '<div class="detail"><b>Name : </b>{{data.name}}</div>'+
        //                                '<div class="detail"><b>Type : </b>{{data.type}}</div>'+
        //                                '<div class="detail"><b>Size : </b> {{data.size}}</div>'+
        //                            '</div>'+
        //                            '<div class="previewControls">'+
        //                                '<span ng-click="upload(data)" class="circle upload">'+
        //                                    '<i class="fa fa-check"></i>'+
        //                                '</span>'+
        //                                '<span ng-click="remove(data)" class="circle remove">'+
        //                                    '<i class="fa fa-close"></i>'+
        //                                '</span>'+
        //                            '</div>'+
        //                        '</div>'+	
        //                '</div>',


        //     link : function(scope,elem,attrs){
        //         var formData = new FormData();
        //         // scope.AttachmentList = [];	

        //             // scope.url = "aho ne aho";
        //             // console.log(" D  scope.url", scope.url);
        //         function previewFile(file){
        //             var reader = new FileReader();
        //             var obj = new FormData().append('file',file);			
        //             reader.onload=function(data){
        //                 var src = data.target.result;
        //                 var size = ((file.size/(1024*1024)) > 1)? (file.size/(1024*1024)) + ' mB' : (file.size/		1024)+' kB';
        //                 scope.$apply(function(){
        //                     scope.AttachmentList.push({'name':file.name,'size':size,'type':file.type,
        //                                             'src':src,'data':obj});
        //                 });								
        //                 console.log(scope.AttachmentList);
        //             }
        //             reader.readAsDataURL(file);
        //         }

        //         function uploadFile(e,type){
        //             e.preventDefault();			
        //             var files = "";
        //             if(type == "formControl"){
        //                 files = e.target.files;
        //             } else if(type === "drop"){
        //                 files = e.originalEvent.dataTransfer.files;
        //             }			
        //             for(var i=0;i<files.length;i++){
        //                 var file = files[i];
        //                 if(file.type.indexOf("image") !== -1){
        //                     previewFile(file);								
        //                 } else {
        //                     alert(file.name + " is not supported");
        //                 }
        //             }
        //         }	
        //         elem.find('.fileUpload').bind('change',function(e){
        //             uploadFile(e,'formControl');
        //         });

        //         elem.find('.dropzone').bind("click",function(e){
        //             $compile(elem.find('.fileUpload'))(scope).trigger('click');
        //         });

        //         elem.find('.dropzone').bind("dragover",function(e){
        //             e.preventDefault();
        //         });

        //         elem.find('.dropzone').bind("drop",function(e){
        //             uploadFile(e,'drop');																		
        //         });
        //         scope.upload=function(obj){
        //             $http({method:scope.method,url:scope.url,data: obj.data,
        //                 headers: {'Content-Type': undefined},transformRequest: angular.identity
        //             }).success(function(data){

        //             });
        //         }

        //         scope.remove=function(data){
        //             var index= scope.AttachmentList.indexOf(data);
        //             scope.AttachmentList.splice(index,1);
        //         }
        //     }
        // }




        // return {
        //     restrict: 'AE',
        //     scope: {
        //         url: "@",
        //         method: "="
        //     },
        //     template: '<input class="fileUpload" type="file" multiple />' +
        //         '<div class="dropzone">' +
        //         '<p class="msg">Click or Drag and Drop files to upload</p>' +
        //         '</div>' +
        //         '<div class="preview clearfix">' +
        //         '<div class="previewData clearfix" ng-repeat="data in previewData track by $index">' +
        //         '<img src={{data.src}}></img>' +
        //         '<div class="previewDetails">' +
        //         '<div class="detail"><b>Name : </b>{{data.name}}</div>' +
        //         '<div class="detail"><b>Type : </b>{{data.type}}</div>' +
        //         '<div class="detail"><b>Size : </b> {{data.size}}</div>' +
        //         '</div>' +
        //         '<textarea' +
        //         '    placeholder="Description"' +
        //         '    style="border:3px solid rgba(0, 0, 0, 0.12);width:98%;margin:15px 0;padding:1%;" required' +
        //         '    ng-model="data.SubmittedCampusVisitAttachmentComments" rows="6" cols="100">' +
        //         '</textarea>' +
        //         //    '<div class="previewControls">'+
        //         //        '<span ng-click="upload(data)" class="circle upload">'+
        //         //            '<i class="fa fa-check"></i>'+
        //         //        '</span>'+
        //         //        '<span ng-click="remove(data)" class="circle remove">'+
        //         //            '<i class="fa fa-close"></i>'+
        //         //        '</span>'+
        //         //    '</div>'+
        //         '</div>' +
        //         '</div>',
        //     link: function (scope, elem, attrs) {
        //         var formData = new FormData();
        //         scope.previewData = [];
        //         scope.url = "aho ne aho";
        //         function previewFile(file) {
        //             var reader = new FileReader();
        //             var obj = new FormData().append('file', file);
        //             reader.onload = function (data) {
        //                 var src = data.target.result;
        //                 var size = ((file.size / (1024 * 1024)) > 1) ? (file.size / (1024 * 1024)) + ' mB' : (file.size / 1024) + ' kB';
        //                 scope.$apply(function () {
        //                     scope.previewData.push({
        //                         'name': file.name, 'size': size, 'type': file.type,
        //                         'src': src, 'data': obj
        //                     });
        //                 });
        //                 console.log(scope.previewData);
        //             }
        //             reader.readAsDataURL(file);
        //         }

        //         function uploadFile(e, type) {
        //             e.preventDefault();
        //             var files = "";
        //             if (type == "formControl") {
        //                 files = e.target.files;
        //             } else if (type === "drop") {
        //                 files = e.originalEvent.dataTransfer.files;
        //             }
        //             for (var i = 0; i < files.length; i++) {
        //                 var file = files[i];
        //                 if (file.type.indexOf("image") !== -1) {
        //                     previewFile(file);
        //                 } else {
        //                     alert(file.name + " is not supported");
        //                 }
        //             }
        //         }
        //         elem.find('.fileUpload').bind('change', function (e) {
        //             uploadFile(e, 'formControl');
        //         });

        //         elem.find('.dropzone').bind("click", function (e) {
        //             $compile(elem.find('.fileUpload'))(scope).trigger('click');
        //         });

        //         elem.find('.dropzone').bind("dragover", function (e) {
        //             e.preventDefault();
        //         });

        //         elem.find('.dropzone').bind("drop", function (e) {
        //             uploadFile(e, 'drop');
        //         });
        //         scope.upload = function (obj) {
        //             $http({
        //                 method: scope.method, url: scope.url, data: obj.data,
        //                 headers: { 'Content-Type': undefined }, transformRequest: angular.identity
        //             }).success(function (data) {

        //             });
        //         }

        //         scope.remove = function (data) {
        //             var index = scope.previewData.indexOf(data);
        //             scope.previewData.splice(index, 1);
        //         }
        //     }
        // }
    }
})();