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
    
    public partial class GET_STATISTICS_FOR_PATIENT_PROFILE_Result
    {
        public Nullable<int> TotalAppointments { get; set; }
        public Nullable<int> TodayAppointments { get; set; }
        public Nullable<int> TotalMedicineOrders { get; set; }
        public Nullable<int> PendingDeliveryMedicineOrders { get; set; }
        public Nullable<int> TotalLabTests { get; set; }
        public Nullable<int> PendingLabTestResults { get; set; }
    }
}