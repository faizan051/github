(function () {
    'use strict';

    angular
        .module('app')
        .factory('api', api);

    /** @ngInject */
    function api() {
        var api = {};

        // Local
        //var baseUrl = "http://172.16.20.173:8044/";

        //Live
        


        //api.ImagePath = baseUrl + "Uploads/Users/Images/";
        api.ImageBaseUrl = baseUrl + "Uploads/Images/";


        api.LoginUser = baseUrl + "api/Account/LoginUser";

        api.AddOrUpdateUser = baseUrl + "api/Account/AddOrUpdateUser";
        api.GetAllSpecialities = baseUrl + "api/SuperAdmin/GetAllSpecialities";
        api.UploadData = baseUrl + "api/Upload/UploadData";

        api.GetAllUsers = baseUrl + "api/SuperAdmin/GetAllUsers";
        api.GetAllLabTests = baseUrl + "api/SuperAdmin/GetAllLabTests";
        api.GetAllLabs = baseUrl + "api/SuperAdmin/GetAllLabs";
        api.AddOrUpdateLabs = baseUrl + "api/SuperAdmin/AddOrUpdateLabs";
        api.GetUserTypes = baseUrl + "api/SuperAdmin/GetUserTypes";
        api.AddOrUpdateLabTests = baseUrl + "api/SuperAdmin/AddOrUpdateLabTests";
        api.AddOrUpdateSpecialities = baseUrl + "api/SuperAdmin/AddOrUpdateSpecialities";
        api.GetAllMedicines = baseUrl + "api/SuperAdmin/GetAllMedicines";
        api.AddOrUpdateMedicines = baseUrl + "api/SuperAdmin/AddOrUpdateMedicines";

        api.AddOrUpdateTeams = baseUrl + "api/SuperAdmin/AddOrUpdateTeams";
        api.GetTeams = baseUrl + "api/DoctorPatient/GetTeams";
        api.GetTeamDetailsByTeamID = baseUrl + "api/DoctorPatient/GetTeamDetailsByTeamID";

        api.GetLabTestOrdersReport = baseUrl + "api/SuperAdmin/GetLabTestOrdersReport";
        api.GetMedicineOrdersReport = baseUrl + "api/SuperAdmin/GetMedicineOrdersReport";

        api.AddOrUpdatePatientLabTests = baseUrl + "api/DoctorPatient/AddOrUpdatePatientLabTests";
        api.MarkMedicineOrderAsDelivered = baseUrl + "api/SuperAdmin/MarkMedicineOrderAsDelivered";

        api.GetAppointmentOrdersReport = baseUrl + "api/SuperAdmin/GetAppointmentOrdersReport";
        api.AddOrUpdateDiscountVouchers = baseUrl + "api/SuperAdmin/AddOrUpdateDiscountVouchers";
        api.GetDiscountVouchers = baseUrl + "api/SuperAdmin/GetDiscountVouchers";

        // AddOrUpdatePatientLabTests

        return api;
    }
}());