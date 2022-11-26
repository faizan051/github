using SapiensIn.BLL;
using SapiensIn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
namespace SapiensIn.Controllers
{
    [RoutePrefix("api/DoctorPatient")]
    public class DoctorPatientController : ApiController
    {
        Entities _entities;
        
        [HttpGet]
        [Route("UniversalSearch")]
        public List<DoctorAndPatientHelper.UniversalSearchResult> UniversalSearch(string query)
        {
            DoctorAndPatientHelper.UniversalSearchResult result;

            _entities = new Entities();

            List<DoctorAndPatientHelper.UniversalSearchResult> list = new List<DoctorAndPatientHelper.UniversalSearchResult>();
            
            List<SEARCH_LAB_TESTS_Result> list3 = _entities.SEARCH_LAB_TESTS(query).ToList<SEARCH_LAB_TESTS_Result>();
            
            List<SEARCH_MEDICINES_Result> list4 = _entities.SEARCH_MEDICINES(query).ToList<SEARCH_MEDICINES_Result>();
            
            foreach (SEARCH_TEAMS_DOCTORS_SPECIALITIES_Result result2 in _entities.SEARCH_TEAMS_DOCTORS_SPECIALITIES(query).ToList<SEARCH_TEAMS_DOCTORS_SPECIALITIES_Result>())
            {
                result = new DoctorAndPatientHelper.UniversalSearchResult
                {
                    ModuleID = result2.ModuleID,
                    ObjectID = result2.ObjectID,
                    SearchIcon = result2.SearchIcon,
                    SearchResult = result2.SearchResult,
                    SearchQuery = result2.SearchQuery
                };
                
                list.Add(result);
            }
            
            foreach (SEARCH_LAB_TESTS_Result result3 in list3)
            {
                result = new DoctorAndPatientHelper.UniversalSearchResult
                {
                    ModuleID = result3.ModuleID,
                    ObjectID = new int?(result3.ObjectID),
                    SearchIcon = result3.SearchIcon,
                    SearchResult = result3.SearchResult,
                    SearchQuery = result3.SearchQuery
                };
            
                list.Add(result);
            }
            
            foreach (SEARCH_MEDICINES_Result result4 in list4)
            {
                result = new DoctorAndPatientHelper.UniversalSearchResult
                {
                    ModuleID = result4.ModuleID,
                    ObjectID = new int?(result4.ObjectID),
                    SearchIcon = result4.SearchIcon,
                    SearchResult = result4.SearchResult,
                    SearchQuery = result4.SearchQuery
                };
                
                list.Add(result);
            }
            
            return list;
        }

        [HttpGet]
        [Route("GetTeams")]
        public List<DoctorAndPatientHelper.GetAllTeams> GetTeams(string SpecialityID, string query)
        {
            _entities = new Entities();

            List<DoctorAndPatientHelper.GetAllTeams> list = new List<DoctorAndPatientHelper.GetAllTeams>();

            int? teamID = null;

            var allData = _entities.GET_TEAMS(teamID, SpecialityID, query).ToList<GET_TEAMS_Result>();

            var uniqueTeamIDs = allData.Select(a => a.TeamID).Distinct().ToList();

            DoctorAndPatientHelper.GetAllTeams t;

            foreach (int s in uniqueTeamIDs)
            {
                t = new DoctorAndPatientHelper.GetAllTeams();

                t.TeamID = s;
                t.SessionCharges = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).SessionCharges;
                t.SpecialityID = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).SpecialityID;
                t.SpecialityLogo = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).SpecialityLogo;
                t.SpecialityTitle = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).SpecialityTitle;
                t.AverageRating = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).AverageRating;
                t.ReviewsCount = allData.First<GET_TEAMS_Result>(a => (a.TeamID == s)).ReviewsCount;

                var data = allData.Where(a => a.TeamID == s).ToList();

                t.TeamMembers = new List<DoctorAndPatientHelper.AllTeamMembers>();

                DoctorAndPatientHelper.AllTeamMembers m;

                foreach (var result in data)
                {
                    m = new DoctorAndPatientHelper.AllTeamMembers();

                    m.DisplayPicture = result.DisplayPicture;
                    m.Experience = result.Experience;
                    m.MobileNumber = result.MobileNumber;
                    m.Name = result.Name;
                    m.TeamMemberID = result.TeamMemberID;
                    m.UserID = result.UserID;
                    m.SatisfactionPercentage = result.SatisfactionPercentage;
                    m.UserType = result.UserType;
                    m.UserTypeID = result.UserTypeID;
                    m.Education = result.Education;
                    m.ResidentialAddress = result.ResidentialAddress;
                    m.Status = true;

                    t.TeamMembers.Add(m);
                }

                t.TeamMembers = t.TeamMembers.OrderBy(a => a.UserTypeID).ToList();

                list.Add(t);
            }
            return list;
        }

        [HttpGet]
        [Route("GetTeamDetailsByTeamID")]
        public DoctorAndPatientHelper.GetAllTeams GetTeamDetailsByTeamID(int TeamID)
        {
            _entities = new Entities();

            var allData = _entities.GET_TEAMS(TeamID, null, null).ToList<GET_TEAMS_Result>();

            DoctorAndPatientHelper.GetAllTeams t;

            t = new DoctorAndPatientHelper.GetAllTeams();

            t.TeamID = TeamID;
            t.SessionCharges = allData[0].SessionCharges;
            t.SpecialityID = allData[0].SpecialityID;
            t.SpecialityLogo = allData[0].SpecialityLogo;
            t.SpecialityTitle = allData[0].SpecialityTitle;

            t.TeamMembers = new List<DoctorAndPatientHelper.AllTeamMembers>();

            DoctorAndPatientHelper.AllTeamMembers m;

            foreach (var result in allData)
            {
                m = new DoctorAndPatientHelper.AllTeamMembers();

                m.DisplayPicture = result.DisplayPicture;
                m.Experience = result.Experience;
                m.MobileNumber = result.MobileNumber;
                m.Name = result.Name;
                m.SatisfactionPercentage = result.SatisfactionPercentage;
                m.UserType = result.UserType;
                m.UserTypeID = result.UserTypeID;
                m.TeamMemberID = result.TeamMemberID;
                m.Education = result.Education;
                m.ResidentialAddress = result.ResidentialAddress;
                m.UserID = result.UserID;
                m.Status = true;

                t.TeamMembers.Add(m);
            }

            t.TeamMembers = t.TeamMembers.OrderBy(a => a.UserTypeID).ToList();

            t.TimeSlots = new List<GET_TIME_SLOTS_BY_TEAM_ID_Result>();

            t.TimeSlots = _entities.GET_TIME_SLOTS_BY_TEAM_ID(TeamID).ToList<GET_TIME_SLOTS_BY_TEAM_ID_Result>();

            return t;
        }

        [HttpGet]
        [Route("GetAvailableTimeSlotByTeamIDAndDate")]
        public List<GET_AVAILABLE_TIME_SLOTS_BY_TEAM_ID_AND_DATE_Result> GetAvailableTimeSlotByTeamIDAndDate(int TeamID, DateTime Date)
        {
            _entities = new Entities();

            return _entities.GET_AVAILABLE_TIME_SLOTS_BY_TEAM_ID_AND_DATE(TeamID, Date).ToList<GET_AVAILABLE_TIME_SLOTS_BY_TEAM_ID_AND_DATE_Result>();
        }

        [HttpGet]
        [Route("GetPatientMedicineOrders")]
        public List<GET_PATIENT_MEDICINE_ORDERS_Result> GetPatientMedicineOrders(long UserID)
        {
            _entities = new Entities();

            return _entities.GET_PATIENT_MEDICINE_ORDERS(UserID).ToList<GET_PATIENT_MEDICINE_ORDERS_Result>();
        }

        [HttpGet]
        [Route("GetPatientMedicineOrderDetails")]
        public List<GET_PATIENT_MEDICINE_DETAILS_BY_ORDER_ID_Result> GetPatientMedicineOrderDetails(long PatientMedicineOrderID)
        {
            _entities = new Entities();

            return _entities.GET_PATIENT_MEDICINE_DETAILS_BY_ORDER_ID(PatientMedicineOrderID).ToList<GET_PATIENT_MEDICINE_DETAILS_BY_ORDER_ID_Result>();
        }

        [HttpGet]
        [Route("GetPatientLabTests")]
        public List<GET_PATIENT_LAB_TESTS_Result> GetPatientLabTests(long UserID)
        {
            _entities = new Entities();
            return _entities.GET_PATIENT_LAB_TESTS(new long?(UserID)).ToList<GET_PATIENT_LAB_TESTS_Result>();
        }

        [HttpGet]
        [Route("GetAppointmentsForPatientProfile")]
        public DoctorAndPatientHelper.PatientProfile GetAppointmentsForPatientProfile(long UserID)
        {
            _entities = new Entities();

            DoctorAndPatientHelper.PatientProfile result = new DoctorAndPatientHelper.PatientProfile();


            result.MainCounts = new GET_STATISTICS_FOR_PATIENT_PROFILE_Result();

            result.MainCounts = _entities.GET_STATISTICS_FOR_PATIENT_PROFILE(UserID).ToList<GET_STATISTICS_FOR_PATIENT_PROFILE_Result>()[0];


            var AllApp = _entities.GET_APPOINTMENTS_FOR_PATIENT_PROFILE(UserID).ToList<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result>();

            result.PastAppointments = new List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result>();

            result.PastAppointments = AllApp.Where(a => a.SessionStartDate.Date < DateTime.Now.Date).ToList();

            result.PresentAppointments = new List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result>();

            result.PresentAppointments = AllApp.Where(a => a.SessionStartDate.Date == DateTime.Now.Date).ToList();

            result.UpcomingAppointments = new List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result>();

            result.UpcomingAppointments = AllApp.Where(a => a.SessionStartDate.Date > DateTime.Now.Date).ToList();

            return result;
        }

        [HttpGet]
        [Route("GetAppointmentsForDoctorProfile")]
        public DoctorAndPatientHelper.DoctorProfile GetAppointmentsForDoctorProfile(long UserID)
        {
            _entities = new Entities();

            DoctorAndPatientHelper.DoctorProfile result = new DoctorAndPatientHelper.DoctorProfile();

            var AllApp = _entities.GET_APPOINTMENTS_FOR_DOCTOR_PROFILE(UserID).ToList<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result>();

            result.PastAppointments = new List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result>();

            result.PastAppointments = AllApp.Where(a => a.SessionStartDate.Date < DateTime.Now.Date).ToList();

            result.PresentAppointments = new List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result>();

            result.PresentAppointments = AllApp.Where(a => a.SessionStartDate.Date == DateTime.Now.Date).ToList();

            result.UpcomingAppointments = new List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result>();

            result.UpcomingAppointments = AllApp.Where(a => a.SessionStartDate.Date > DateTime.Now.Date).ToList();


            result.MainCounts = new DoctorAndPatientHelper.DoctorProfileStatistics();

            result.MainCounts.SessionsToday = result.PresentAppointments.Count;
            result.MainCounts.TotalAppointments = AllApp.Count;
            result.MainCounts.UpcomingSessions = result.UpcomingAppointments.Count;

            return result;
        }

        [HttpGet]
        [Route("GetAppointmentProceedings")]
        public List<GET_APPOINTMENT_PROCEEDINGS_Result> GetAppointmentProceedings(long AppointmentID, int UserTypeID)
        {
            _entities = new Entities();

            return _entities.GET_APPOINTMENT_PROCEEDINGS(AppointmentID, UserTypeID).ToList<GET_APPOINTMENT_PROCEEDINGS_Result>();
        }

        [HttpGet]
        [Route("GetLatestAppointmentProceedings")]
        public List<GET_LATEST_APPOINTMENT_PROCEEDINGS_Result> GetLatestAppointmentProceedings(long AppointmentID, int UserTypeID, long AppointmentProceedingID)
        {
            _entities = new Entities();

            return _entities.GET_LATEST_APPOINTMENT_PROCEEDINGS(AppointmentID, UserTypeID, AppointmentProceedingID).ToList<GET_LATEST_APPOINTMENT_PROCEEDINGS_Result>();
        }

        [HttpPost]
        [Route("AddOrUpdatePatientMedicineOrder")]
        public bool AddOrUpdatePatientMedicineOrder(DoctorAndPatientHelper.AddUpdateMedicineOrder obj)
        {
            try
            {
                _entities = new Entities();
                
                long? appointmentID = null;

                obj.PatientMedicineOrderID = _entities.ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER(obj.PatientMedicineOrderID, "SAP", obj.PrescriptionImage, obj.UserID, appointmentID, obj.FinalAmount, 
                    obj.PaymentImage, obj.BillingAddress, obj.OrderDate, obj.DiscountVoucherID, obj.VoucherTitle, obj.DiscountVoucherPercentage, obj.DiscountVoucherAmount, obj.Status).ToList<long?>()[0];
                
                if (obj.Status && (obj.MedicineList != null))
                {
                    foreach (DoctorAndPatientHelper.AddUpdateMedicineList list in obj.MedicineList)
                    {
                        using (Entities entities = new Entities())
                        {
                            entities.ADD_OR_UPDATE_PATIENT_MEDICINE_ORDER_DETAILS(list.PatientMedicineID, obj.PatientMedicineOrderID, list.MedicineID, list.Quantity, list.UnitPrice, list.TotalPrice, list.Status);
                        }
                    }
                }
                
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpPost]
        [Route("AddOrUpdatePatientLabTests")]
        public bool AddOrUpdatePatientLabTests(DoctorAndPatientHelper.AddUpdatePatientLabTest obj)
        {
            try
            {
                foreach(var a in obj.LabTestList)
                {
                    using (Entities e = new Entities())
                    {
                        e.ADD_OR_UPDATE_PATIENT_LAB_TESTS(a.PatientLabTestID, a.LabID, a.LabTestID, a.UserID, a.AppointmentID, a.DiscountPercentage, a.LabTestPrice, a.FinalAmount, 
                            a.LabResultFileAttachment, a.PaymentImage, a.BillingAddress, a.DiscountVoucherID, a.VoucherTitle, a.DiscountVoucherPercentage, a.DiscountVoucherAmount, a.Status);
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpPost]
        [Route("AddOrUpdatePatientAppointments")]
        public bool AddOrUpdatePatientAppointments(DoctorAndPatientHelper.AddUpdatePatientAppointments o)
        {
            try
            {
                _entities = new Entities();

                DateTime? sessionEndDatetime = null;

                if(o.DiscountVoucherID == null)
                {
                    o.FinalAmount = o.SessionCharges;
                }
                else
                {
                    if(o.DiscountVoucherAmount != null && o.DiscountVoucherAmount != 0)
                    {
                        o.FinalAmount = o.SessionCharges - o.DiscountVoucherAmount;
                    }
                    else
                    {
                        o.FinalAmount = o.SessionCharges - ((o.SessionCharges * (decimal)o.DiscountVoucherPercentage)/100);
                    }
                }

                _entities.ADD_OR_UPDATE_PATIENT_APPOINTMENTS(o.AppointmentID, o.UserID, o.TeamID, o.SessionCharges, o.SessionStartDate, o.SessionStartTime, o.TeamTimeSlotID, false, sessionEndDatetime,
                    o.PaymentImage, o.BillingAddress, o.DiscountVoucherID, o.VoucherTitle, o.DiscountVoucherPercentage, o.DiscountVoucherAmount, o.FinalAmount, o.Status);
                
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdatePatientAppointmentProceedings")]
        public long? AddOrUpdatePatientAppointmentProceedings(long? AppointmentProceedingID, long AppointmentID, long UserID, int SenderUserTypeID, int ReceiverUserTypeID, string AttachmentFileName, string Comment, bool Status)
        {
            try
            {
                _entities = new Entities();

                AppointmentProceedingID = _entities.ADD_OR_UPDATE_PATIENT_APPOINTMENT_PROCEEDINGS(AppointmentProceedingID, AppointmentID, UserID, SenderUserTypeID, ReceiverUserTypeID, AttachmentFileName, Comment, Status).ToList<long?>()[0];
                
                return AppointmentProceedingID;
            }
            catch
            {
                return null;
            }
        }

        [HttpGet]
        [Route("GetRatingAndReviews")]
        public List<GET_REV_EWS_AND_RATINGS_Result> GetRatingAndReviews(long? UserID, int? TeamID)
        {
            _entities = new Entities();

            return _entities.GET_REV_EWS_AND_RATINGS(UserID, TeamID).ToList<GET_REV_EWS_AND_RATINGS_Result>();
        }

        [HttpPost]
        [Route("AddOrUpdateRatingAndReviews")]
        public DoctorAndPatientHelper.AddUpdateRatingAndReviews AddOrUpdateRatingAndReviews(DoctorAndPatientHelper.AddUpdateRatingAndReviews obj)
        {
            try
            {
                _entities = new Entities();

                obj.RatingReviewID = _entities.ADD_OR_UPDATE_RATING_AND_REVIEW(obj.RatingReviewID, obj.Rating, obj.ReviewStatement, obj.UserID, obj.TeamID, obj.Status).ToList<long?>()[0];

                return obj;
            }
            catch
            {
                return null;
            }
        }
    }
}
