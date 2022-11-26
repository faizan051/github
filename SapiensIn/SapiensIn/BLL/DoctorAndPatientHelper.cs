using SapiensIn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SapiensIn.BLL
{
    public class DoctorAndPatientHelper
    {
        public class UniversalSearchResult
        {
            public int? ObjectID { get; set; }
            public string SearchIcon { get; set; }
            public int ModuleID { get; set; }
            public string SearchResult { get; set; }
            public string SearchQuery { get; set; }
        }

        public class GetAllTeams
        {
            public int TeamID { get; set; }
            public int SpecialityID { get; set; }
            public decimal SessionCharges { get; set; }
            public string SpecialityTitle { get; set; }
            public string SpecialityLogo { get; set; }
            public Nullable<int> ReviewsCount { get; set; }
            public Nullable<double> AverageRating { get; set; }
            public List<AllTeamMembers> TeamMembers { get; set; }
            public List<GET_TIME_SLOTS_BY_TEAM_ID_Result> TimeSlots { get; set; }
        }
        public class AllTeamMembers
        {
            public string Name { get; set; }
            public long UserID { get; set; }
            public long? TeamMemberID { get; set; }
            public string DisplayPicture { get; set; }
            public string Experience { get; set; }
            public string MobileNumber { get; set; }
            public Nullable<double> SatisfactionPercentage { get; set; }
            public int UserTypeID { get; set; }
            public string UserType { get; set; }
            public string Education { get; set; }
            public string ResidentialAddress { get; set; }
            public bool Status { get; set; }
        }

        public class AddUpdateMedicineOrder
        {
            public long? PatientMedicineOrderID { get; set; }
            public string OrderNumber { get; set; }
            public string PrescriptionImage { get; set; }
            public long UserID { get; set; }
            public decimal FinalAmount { get; set; }
            public string PaymentImage { get; set; }
            public string BillingAddress { get; set; }
            public DateTime OrderDate { get; set; }
            public int? DiscountVoucherID { get; set; }
            public string VoucherTitle { get; set; }
            public decimal? DiscountVoucherAmount { get; set; }
            public double? DiscountVoucherPercentage { get; set; }
            public bool Status { get; set; }
            public List<AddUpdateMedicineList> MedicineList { get; set; }
        }

        public class AddUpdateMedicineList
        {
            public long? PatientMedicineID { get; set; }
            public int MedicineID { get; set; }
            public int Quantity { get; set; }
            public decimal UnitPrice { get; set; }
            public decimal TotalPrice { get; set; }
            public bool Status { get; set; }
        }

        public class AddUpdatePatientLabTest
        {
            public List<AddUpdatePatientLabTestList> LabTestList { get; set; }
        }
        public class AddUpdatePatientLabTestList
        {
            public long? PatientLabTestID { get; set; }
            public int LabID { get; set; }
            public int LabTestID { get; set; }
            public long UserID { get; set; }
            public long AppointmentID { get; set; }
            public double DiscountPercentage { get; set; }
            public decimal LabTestPrice { get; set; }
            //public string SpecialityLogo { get; set; }
            public decimal FinalAmount { get; set; }
            public string PaymentImage { get; set; }
            public string BillingAddress { get; set; }
            public string LabResultFileAttachment { get; set; }
            public int? DiscountVoucherID { get; set; }
            public string VoucherTitle { get; set; }
            public decimal? DiscountVoucherAmount { get; set; }
            public double? DiscountVoucherPercentage { get; set; }
            public bool Status { get; set; }
        }

        public class PatientProfile
        {
            public GET_STATISTICS_FOR_PATIENT_PROFILE_Result MainCounts { get; set; }
            public List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result> PastAppointments { get; set; }
            public List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result> PresentAppointments { get; set; }
            public List<GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result> UpcomingAppointments { get; set; }
        }

        public class DoctorProfile
        {
            public DoctorProfileStatistics MainCounts { get; set; }
            public List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result> PastAppointments { get; set; }
            public List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result> PresentAppointments { get; set; }
            public List<GET_APPOINTMENTS_FOR_DOCTOR_PROFILE_Result> UpcomingAppointments { get; set; }
        }

        public class DoctorProfileStatistics
        {
            public int TotalAppointments { get; set; }
            public int SessionsToday { get; set; }
            public int UpcomingSessions { get; set; }
        }

        public class AddUpdatePatientAppointments
        {
            public long? AppointmentID { get; set; }
            public long UserID { get; set; }
            public int TeamID { get; set; }
            public decimal SessionCharges { get; set; }
            public string PaymentImage { get; set; }
            public System.DateTime SessionStartDate { get; set; }
            public System.TimeSpan SessionStartTime { get; set; }
            public int TeamTimeSlotID { get; set; }
            public string BillingAddress { get; set; }
            public bool? IsSessionEnded { get; set; }
            public DateTime? SessionEndDatetime { get; set; }
            public int? DiscountVoucherID { get; set; }
            public string VoucherTitle { get; set; }
            public double? DiscountVoucherPercentage { get; set; }
            public decimal? DiscountVoucherAmount { get; set; }
            public decimal? FinalAmount { get; set; }
            public DateTime AddedDateTime { get; set; }
            public bool Status { get; set; }
        }

        public class AddUpdateRatingAndReviews
        {
            public long? RatingReviewID { get; set; }
            public double? Rating { get; set; }
            public string ReviewStatement { get; set; }
            public long UserID { get; set; }
            public int TeamID { get; set; }
            public bool Status { get; set; }
        }
    }
}