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
    
    public partial class Appointment_Proceedings
    {
        public long AppointmentProceedingID { get; set; }
        public long AppointmentID { get; set; }
        public long UserID { get; set; }
        public Nullable<int> SenderUserTypeID { get; set; }
        public Nullable<int> ReceiverUserTypeID { get; set; }
        public string AttachmentFileName { get; set; }
        public string Comment { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
    }
}
