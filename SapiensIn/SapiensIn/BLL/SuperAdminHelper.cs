using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SapiensIn.BLL
{
    public class SuperAdminHelper
    {
        public static string UPLOAD_DATA = HttpContext.Current.Server.MapPath("~/Uploads/Images/");
        public class AddUpdateTeams
        {
            public int? TeamID { get; set; }
            public string TeamTitle { get; set; }
            public int SpecialityID { get; set; }
            public decimal SessionCharges { get; set; }
            public bool Status { get; set; }
            public List<AddUpdateTeamTimeSlots> TimeSlots { get; set; }
            public List<AddUpdateTeamMembers> TeamMembers { get; set; }
        }

        public class AddUpdateTeamTimeSlots
        {
            public long TeamTimeSlotID { get; set; }
            public int DayNumber { get; set; }
            public TimeSpan TimeSlot { get; set; }
            public bool Status { get; set; }
        }

        public class AddUpdateTeamMembers
        {
            public long? TeamMemberID { get; set; }
            public long UserID { get; set; }
            public bool Status { get; set; }
        }

        //public class CardTransactionData
        //{
        //    public string ChallanNumber { get; set; }
        //    public string Amount { get; set; }
        //}
        //public class Responseobj
        //{
        //    public string merchat { get; set; }
        //    public string result { get; set; }
        //    public string successIndicator { get; set; }
        //    public Sessionobj session { get; set; }
        //}

        //public class Sessionobj
        //{
        //    public string id { get; set; }
        //    public string updateStatus { get; set; }
        //    public string version { get; set; }
        //}
    }
}