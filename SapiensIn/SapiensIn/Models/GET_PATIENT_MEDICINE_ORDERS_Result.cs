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
    
    public partial class GET_PATIENT_MEDICINE_ORDERS_Result
    {
        public long PatientMedicineOrderID { get; set; }
        public string OrderNumber { get; set; }
        public Nullable<decimal> FinalAmount { get; set; }
        public Nullable<System.DateTime> AddedDateTime { get; set; }
        public Nullable<int> TotalItems { get; set; }
        public string PatientName { get; set; }
        public string PatientImage { get; set; }
        public string PatientMobileNumber { get; set; }
        public string PaymentImage { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<bool> IsDelivered { get; set; }
        public Nullable<System.DateTime> IsDeliveredDateTime { get; set; }
        public string PrescriptionImage { get; set; }
        public string ResidentialAddress { get; set; }
        public string BillingAddress { get; set; }
        public Nullable<int> DiscountVoucherID { get; set; }
        public string VoucherTitle { get; set; }
        public Nullable<decimal> DiscountVoucherAmount { get; set; }
        public Nullable<double> DiscountVoucherPercentage { get; set; }
    }
}