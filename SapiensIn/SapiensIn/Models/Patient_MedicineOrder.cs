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
    using System.Collections.Generic;
    
    public partial class Patient_MedicineOrder
    {
        public long PatientMedicineOrderID { get; set; }
        public string OrderNumber { get; set; }
        public string PrescriptionImage { get; set; }
        public long UserID { get; set; }
        public Nullable<long> AppointmentID { get; set; }
        public decimal FinalAmount { get; set; }
        public string PaymentImage { get; set; }
        public Nullable<bool> IsDelivered { get; set; }
        public Nullable<System.DateTime> IsDeliveredDateTime { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string BillingAddress { get; set; }
        public Nullable<int> DiscountVoucherID { get; set; }
        public string VoucherTitle { get; set; }
        public Nullable<double> DiscountVoucherPercentage { get; set; }
        public Nullable<decimal> DiscountVoucherAmount { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
    }
}
