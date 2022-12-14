//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SapiensIn.Models
{
    using System;
    
    public partial class GET_APPOINTMENTS_FOR_PATIENT_PROFILE_Result
    {
        public long AppointmentID { get; set; }
        public long UserID { get; set; }
        public int TeamID { get; set; }
        public decimal SessionCharges { get; set; }
        public System.DateTime SessionStartDate { get; set; }
        public string SessionStartTime { get; set; }
        public Nullable<int> TeamTimeSlotID { get; set; }
        public Nullable<bool> IsSessionEnded { get; set; }
        public Nullable<System.DateTime> SessionEndDatetime { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
        public string SpecialityTitle { get; set; }
        public string DisplayPicture { get; set; }
        public string PatientName { get; set; }
        public string PatientImage { get; set; }
        public Nullable<decimal> FinalAmount { get; set; }
        public string PatientMobileNumber { get; set; }
        public string PaymentImage { get; set; }
        public string ResidentialAddress { get; set; }
        public string BillingAddress { get; set; }
        public Nullable<int> DiscountVoucherID { get; set; }
        public string VoucherTitle { get; set; }
        public Nullable<decimal> DiscountVoucherAmount { get; set; }
        public Nullable<double> DiscountVoucherPercentage { get; set; }
    }
}
