(function () {
    'use strict';

    angular
        .module('app')
        .factory('api', api);

    /** @ngInject */
    function api() {
        var api = {};

        // var baseUrl = "h l ottp://172.16.20.173:8044/api/";
        // var baseUrl = "h l ottp://173.212.252.86:8051/api/";
        
        //Live
        // var baseUrl = "https://api.sapiensin.com/api/";
        // var PicbaseUrl = "https://api.sapiensin.com/"

        //Local
        // var baseUrl = "http://172.16.20.173:8044/api/";
        // var PicbaseUrl = "http://172.16.20.173:8044/";

        var baseUrl = "http://173.212.252.86:8051/api/"
        var PicbaseUrl = "http://173.212.252.86:8051/"


        api.ImagePath = PicbaseUrl + "Uploads/Images/";
        api.UserImagePath = PicbaseUrl + "Uploads/Images/";

        api.GetUtilityBillTypes = baseUrl + "Constants/GetUtilityBillTypes";

        api.UploadData = baseUrl + "Upload/UploadData";

        api.AddOrUpdateUser = baseUrl + "Account/AddOrUpdateUser";
        api.LoginUser = baseUrl + "Account/LoginUser";
        api.CheckMobileNumberForAccountCreation = baseUrl + "Account/CheckMobileNumberForAccountCreation";

        api.GetUserTypes = baseUrl + "SuperAdmin/GetUserTypes";
        api.GetAllSpecialities = baseUrl + "SuperAdmin/GetAllSpecialities";
        api.GetAllLabs = baseUrl + "SuperAdmin/GetAllLabs";
        api.GetAllLabTests = baseUrl + "SuperAdmin/GetAllLabTests";
        api.GetAllMedicines = baseUrl + "SuperAdmin/GetAllMedicines";
        api.GetDiscountVouchers = baseUrl + "SuperAdmin/GetDiscountVouchers";

        api.GetTeams = baseUrl + "DoctorPatient/GetTeams";
        api.AddOrUpdatePatientLabTests = baseUrl + "DoctorPatient/AddOrUpdatePatientLabTests";
        api.AddOrUpdatePatientMedicineOrder = baseUrl + "DoctorPatient/AddOrUpdatePatientMedicineOrder";
        api.GetAppointmentProceedings = baseUrl + "DoctorPatient/GetAppointmentProceedings";
        api.AddOrUpdatePatientAppointmentProceedings = baseUrl + "DoctorPatient/AddOrUpdatePatientAppointmentProceedings";
        api.GetAppointmentsForPatientProfile = baseUrl + "DoctorPatient/GetAppointmentsForPatientProfile";
        api.GetLatestAppointmentProceedings = baseUrl + "DoctorPatient/GetLatestAppointmentProceedings";
        api.GetAppointmentsForDoctorProfile = baseUrl + "DoctorPatient/GetAppointmentsForDoctorProfile";
        api.GetPatientMedicineOrders = baseUrl + "DoctorPatient/GetPatientMedicineOrders";
        api.GetPatientMedicineOrderDetails = baseUrl + "DoctorPatient/GetPatientMedicineOrderDetails";
        api.GetPatientLabTests = baseUrl + "DoctorPatient/GetPatientLabTests";
        api.GetAvailableTimeSlotByTeamIDAndDate = baseUrl + "DoctorPatient/GetAvailableTimeSlotByTeamIDAndDate";
        api.AddOrUpdateRatingAndReviews = baseUrl + "DoctorPatient/AddOrUpdateRatingAndReviews";
        api.GetRatingAndReviews = baseUrl + "DoctorPatient/GetRatingAndReviews";
        



        api.AddOrUpdatePatientAppointments = baseUrl + "DoctorPatient/AddOrUpdatePatientAppointments"
        api.GetTeamDetailsByTeamID = baseUrl + "DoctorPatient/GetTeamDetailsByTeamID";

        api.GetPatientMedicineOrderDetails = baseUrl + "DoctorPatient/GetPatientMedicineOrderDetails";



        return api;
    }
}());