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
    
    public partial class Medicines
    {
        public int MedicineID { get; set; }
        public string MedicineTitle { get; set; }
        public string DisplayPicture { get; set; }
        public decimal Price { get; set; }
        public System.DateTime AddedDateTime { get; set; }
        public bool Status { get; set; }
    }
}
