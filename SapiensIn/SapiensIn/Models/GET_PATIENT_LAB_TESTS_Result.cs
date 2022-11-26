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
    
    public partial class GET_PATIENT_LAB_TESTS_Result
    {
        public long PatientLabTestID { get; set; }
        public int LabID { get; set; }
        public int LabTestID { get; set; }
        public long UserID { get; set; }
        public Nullable<long> AppointmentID { get; set; }
        public double DiscountPercentage { get; set; }
        public decimal LabTestPrice { get; set; }
        public decimal FinalAmount { get; set; }
        public string PaymentImage { get; set; }
        public string LabResultFileAttachment { get; set; }
        public string BillingAddress { get; set; }
        public Nullable<int> DiscountVoucherID { get; set; }
        public string VoucherTitle { get; set; }
        public Nullable<double> DiscountVoucherPercentage { get; set; }
        public Nullable<decimal> DiscountVoucherAmount { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
        public string LabTitle { get; set; }
        public string LabLogo { get; set; }
        public string LabTestTitle { get; set; }
        public string PatientName { get; set; }
        public string PatientImage { get; set; }
        public string PatientMobileNumber { get; set; }
    }
}
