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
    
    public partial class GET_TIME_SLOTS_BY_TEAM_ID_Result
    {
        public long TeamTimeSlotID { get; set; }
        public int TeamID { get; set; }
        public int DayNumber { get; set; }
        public System.TimeSpan TimeSlot { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
    }
}
