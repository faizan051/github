(function() {
    'use strict';

    angular
        .module('app' )
        .factory('HTTP', HTTP);

    /** @ngInject */
    function HTTP($http,APIDataParser) {
        // APIDataParser

        return {

            /*
             *
             * HTTTP GET
             * 
             */

            get: function(baseUrl, callback) {
                // var tokkenKey = KeyService.getConstantsKey().TOKKEN_KEY;
                // var Token = StorageService.getItem(localStorageService, tokkenKey).access_token;
                var reqHttp = {
                    method: 'GET',
                    url: baseUrl,
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        //'Authorization': 'bearer ' + Token
                    }
                }
                $http(reqHttp).then(function(response) {
                       
                        callback(true, response)
                    },
                    function(error) {
                        callback(false, error)
                    })
            },

            /*
             *
             * HTTTP POST
             * 
             */

            post: function(baseUrl, reqParam, callback) {

                // var tokkenKey = KeyService.getConstantsKey().TOKKEN_KEY;
                // var Token = StorageService.getItem(localStorageService, tokkenKey).access_token;

                var reqHttp = {
                    method: 'POST',
                    url: baseUrl,
                    // dataType: 'json',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        // 'Content-type': 'application/json',
                        //'Authorization': 'bearer ' + Token
                    },
                   
                     data: APIDataParser.getParserData(reqParam)
                    // data: JSON.stringify(reqParam)
                    //data: reqParam
                };
                $http(reqHttp).then(function(response) {
                        
                        callback(true, response)
                    },
                    function(error) {
                        callback(false, error)
                    });

            },

            /*
             *
             * HTTTP POST-TOKEN
             * 
             */

            postToken: function(baseUrl, reqParam, callback) {

                var reqHttp = {
                    method: 'POST',
                    url: baseUrl,
                    headers: {
                        'Content-Type': 'multipart/form-data'
                        
                    },
                    data: APIDataParser.getParserData(reqParam)
                };
                $http(reqHttp).then(function(response) {
                        
                        callback(true, response)
                    },
                    function(error) {
                        callback(false, error)
                    });

            },

            /*
             *
             * HTTTP POST-FORMDATA
             * 
             */

            postformData: function(baseUrl, formData, callback) {

                // var tokkenKey = KeyService.getConstantsKey().TOKKEN_KEY;
                // var Token = StorageService.getItem(localStorageService, tokkenKey).access_token;

                $http({
                    method: "POST",
                    url: baseUrl,
                    transformRequest: [],
                    headers: {
                        'Content-Type': undefined
                    },
                    data: formData
                }).then(function mySucces(response) {
                        
                        callback(true, response)
                    },
                    function(error) {
                        callback(false, error)
                    });

            },

        }


    }
}());