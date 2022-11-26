using Newtonsoft.Json;
using SapiensIn.BLL;
using SapiensIn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace SapiensIn.Controllers
{
    [RoutePrefix("api/SuperAdmin")]
    public class SuperAdminController : ApiController
    {
        Entities _entities;

        [HttpGet]
        [Route("GetUserTypes")]
        public List<GET_USER_TYPES_Result> GetUserTypes()
        {
            _entities = new Entities();

            return _entities.GET_USER_TYPES().ToList<GET_USER_TYPES_Result>();
        }

        [HttpGet]
        [Route("GetAllSpecialities")]
        public List<GET_ALL_SPECIALITIES_Result> GetAllSpecialities()
        {
            _entities = new Entities();

            return _entities.GET_ALL_SPECIALITIES().ToList<GET_ALL_SPECIALITIES_Result>();
        }

        [HttpGet]
        [Route("GetAllMedicines")]
        public List<GET_ALL_MEDICINES_Result> GetAllMedicines(string query, int PageNumber, int PageSize)
        {
            _entities = new Entities();

            return _entities.GET_ALL_MEDICINES(query, PageNumber, PageSize).ToList<GET_ALL_MEDICINES_Result>();
        }

        [HttpGet]
        [Route("GetAllLabs")]
        public List<GET_ALL_LABS_Result> GetAllLabs()
        {
            _entities = new Entities();

            return _entities.GET_ALL_LABS().ToList<GET_ALL_LABS_Result>();
        }

        [HttpGet]
        [Route("GetAllLabTests")]
        public List<GET_ALL_LAB_TESTS_Result> GetAllLabTests(string query)
        {
            _entities = new Entities();

            return _entities.GET_ALL_LAB_TESTS(query).ToList<GET_ALL_LAB_TESTS_Result>();
        }

        [HttpGet]
        [Route("GetAllUsers")]
        public List<GET_USERS_Result> GetAllUsers(int UserTypeID)
        {
            _entities = new Entities();

            return _entities.GET_USERS(UserTypeID).ToList<GET_USERS_Result>();
        }

        [HttpPost]
        [Route("AddOrUpdateTeams")]
        public bool AddOrUpdateTeams(SuperAdminHelper.AddUpdateTeams obj)
        {
            try
            {
                _entities = new Entities();

                obj.TeamID = _entities.ADD_OR_UPDATE_TEAMS(obj.TeamID, "", obj.SpecialityID, obj.SessionCharges, obj.Status).ToList<int?>()[0];

                if(obj.Status == true)
                {
                    if (obj.TimeSlots != null)
                    {
                        foreach (var a in obj.TimeSlots)
                        {
                            using (Entities e = new Entities())
                            {
                                e.ADD_OR_UPDATE_TEAM_TIME_SLOTS(a.TeamTimeSlotID, obj.TeamID, a.DayNumber, a.TimeSlot, a.Status);
                            }
                        }
                    }

                    if (obj.TeamMembers != null)
                    {
                        foreach (var a in obj.TeamMembers)
                        {
                            using (Entities e = new Entities())
                            {
                                e.ADD_OR_UPDATE_TEAM_MEMBERS(a.TeamMemberID, obj.TeamID, a.UserID, a.Status);
                            }
                        }
                    }
                }
               
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateSpecialities")]
        public bool AddOrUpdateSpecialities(int? SpecialityID, string SpecialityTitle, string DisplayPicture, bool Status)
        {
            try
            {
                _entities = new Entities();

                _entities.ADD_OR_UPDATE_SPECIALITIES(SpecialityID, SpecialityTitle, DisplayPicture, Status);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateMedicines")]
        public bool AddOrUpdateMedicines(int? MedicineID, string MedicineTitle, string DisplayPicture, decimal Price, bool Status)
        {
            try
            {
                _entities = new Entities();

                _entities.ADD_OR_UPDATE_MEDICINES(MedicineID, MedicineTitle, DisplayPicture, Price, Status);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateLabs")]
        public bool AddOrUpdateLabs(int? LabID, string LabTitle, string DisplayPicture, double DiscountPercentage, bool Status)
        {
            try
            {
                _entities = new Entities();

                _entities.ADD_OR_UPDATE_LABS(LabID, LabTitle, DisplayPicture, DiscountPercentage, Status);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateLabTests")]
        public bool AddOrUpdateLabTests(int? LabTestID, string LabTestTitle, decimal LabTestPrice, bool Status)
        {
            try
            {
                _entities = new Entities();

                _entities.ADD_OR_UPDATE_LAB_TESTS(LabTestID, LabTestTitle, LabTestPrice, Status);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("MarkMedicineOrderAsDelivered")]
        public bool MarkMedicineOrderAsDelivered(long PatientMedicineOrderID)
        {
            try
            {
                _entities = new Entities();

                _entities.MARK_PATIENT_MEDICINE_ORDER_AS_DELIVERED(PatientMedicineOrderID);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("GetAppointmentOrdersReport")]
        public List<GET_APPOINTMENTS_REPORT_Result> GetAppointmentOrdersReport(DateTime StartDate, DateTime EndDate, string SpecialityID, string TeamID)
        {
            _entities = new Entities();

            return _entities.GET_APPOINTMENTS_REPORT(null, StartDate, EndDate, SpecialityID, TeamID).ToList<GET_APPOINTMENTS_REPORT_Result>();
        }

        [HttpGet]
        [Route("GetLabTestOrdersReport")]
        public List<GET_PATIENT_LAB_TEST_REPORT_Result> GetLabTestOrdersReport(DateTime StartDate, DateTime EndDate, string LabID, string LabTestID)
        {
            _entities = new Entities();

            return _entities.GET_PATIENT_LAB_TEST_REPORT(null, StartDate, EndDate, LabID, LabTestID).ToList<GET_PATIENT_LAB_TEST_REPORT_Result>();
        }

        [HttpGet]
        [Route("GetMedicineOrdersReport")]
        public List<GET_PATIENT_MEDICINE_ORDER_REPORT_Result> GetMedicineOrdersReport(DateTime StartDate, DateTime EndDate)
        {
            try
            {
                _entities = new Entities();

                return _entities.GET_PATIENT_MEDICINE_ORDER_REPORT(null, StartDate, EndDate).ToList<GET_PATIENT_MEDICINE_ORDER_REPORT_Result>();
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateDiscountVouchers")]
        public bool AddOrUpdateDiscountVouchers(int? DiscountVoucherID, string VoucherTitle, string VoucherCode, string VoucherDecription, string VoucherImage, double? DiscountPercentage, decimal? DiscountAmount, bool IsLabApplicable, bool IsMedicineApplicable, bool IsAppointmentApplicable, bool IsEnabled, bool Status)
        {
            try
            {
                _entities = new Entities();

                _entities.ADD_OR_UPDATE_DISCOUNT_VOUCHERS(DiscountVoucherID, VoucherTitle, VoucherCode, VoucherDecription, VoucherImage, DiscountPercentage, DiscountAmount, IsLabApplicable, IsMedicineApplicable, IsAppointmentApplicable, IsEnabled, Status);

                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("GetDiscountVouchers")]
        public List<GET_DISCOUNT_VOUCHERS_Result> GetDiscountVouchers(string VoucherTitle)
        {
            _entities = new Entities();

            return _entities.GET_DISCOUNT_VOUCHERS(VoucherTitle).ToList<GET_DISCOUNT_VOUCHERS_Result>();
        }

        //    [HttpPost]
        //    [Route("GetSessionDetailsForCardTransaction")]
        //    public HttpResponseMessage GetSessionDetailsForCardTransaction(SuperAdminHelper.CardTransactionData data)
        //    {
        //        //SuperAdminHelper.Responseobj res = new SuperAdminHelper.Responseobj();

        //        try
        //        {

        //            //var jsonObj = JsonConvert.SerializeObject("{" +
        //            //                        "\"apiOperation\": \"CREATE_CHECKOUT_SESSION\"," +
        //            //                        "\"apiPassword\": \"506ba44c797ebff3c7706d3330d67dae\"," +
        //            //                        "\"apiUsername\": \"merchant.MCBPK\"," +
        //            //                        "\"merchant\": \"MCBPK\"," +
        //            //                        "\"interaction\": {\"operation\":\"PURCHASE\"}," +
        //            //                        "\"order\": {\"id\":\"" + data.ChallanNumber + "\", \"currency\": \"PKR\", \"amount\": \"" + data.Amount + "\"}" +
        //            //                        "}");


        //            //string URL = "https://test-mcbpk.mtf.gateway.mastercard.com/api/rest/version/56/merchant/MCBPK/session";


        //            //SuperAdminHelper.Responseobj resObj = new SuperAdminHelper.Responseobj();

        //            //using (var client = new WebClient())
        //            //{
        //            //    client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

        //            //    var response = client.UploadString(URL, jsonObj.ToString());
        //            //    resObj = JsonConvert.DeserializeObject<SuperAdminHelper.Responseobj>(response);
        //            //}


        //            Entities _entities = new Entities();


        //            string DATA = "{" +
        //                                    "\"apiOperation\": \"CREATE_CHECKOUT_SESSION\"," +
        //                                    "\"apiPassword\": \"506ba44c797ebff3c7706d3330d67dae\"," +
        //                                    "\"apiUsername\": \"merchant.MCBPK\"," +
        //                                    "\"merchant\": \"MCBPK\"," +
        //                                    "\"interaction\": {\"operation\":\"PURCHASE\"}," +
        //                                    "\"order\": {\"id\":\"" + data.ChallanNumber + "\", \"currency\": \"PKR\", \"amount\": \"" + data.Amount + "\"}" +
        //                                    "}";

        //            string URL = "https://test-mcbpk.mtf.gateway.mastercard.com/api/rest/version/56/merchant/MCBPK/session";

        //            HttpResponseMessage res = CallPostAPI(URL, DATA);

        //            return res;

        //        }
        //        catch (Exception ex)
        //        {
        //            var ee = ex.ToString();

        //            return null;
        //        }
        //    }

        //    public static HttpResponseMessage CallPostAPI(string url, string data)
        //    {
        //        System.Net.Http.HttpClient client = new System.Net.Http.HttpClient();
        //        client.BaseAddress = new System.Uri(url);

        //        //byte[] cred = UTF8Encoding.UTF8.GetBytes("username:password");
        //        //client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(cred));

        //        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));


        ////    headers:
        ////        {
        ////            'Authorization': 'Basic bWVyY2hhbnQuTUNCUEs6NTA2YmE0NGM3OTdlYmZmM2M3NzA2ZDMzMzBkNjdkYWU=',//merhcant ID and API password
        ////'Content-Type': 'application/json',
        ////// 'Host': 'https://mcbpk.gateway.mastercard.com',
        ////// 'Referer': 'https://sapiensin.com/abc.html', //Your referrer address
        ////'cache-control': 'no-cache',
        ////'Accept': 'application/json'// acceptance jason or XML or Plain text etc.

        ////        },

        //        System.Net.Http.HttpContent content = new StringContent(data, UTF8Encoding.UTF8, "application/json");
        //        content.Headers.Add("Authorization", "Basic bWVyY2hhbnQuTUNCUEs6NTA2YmE0NGM3OTdlYmZmM2M3NzA2ZDMzMzBkNjdkYWU=");
        //        content.Headers.Add("Content-Type", "application/json");
        //        content.Headers.Add("Host", "https://mcbpk.gateway.mastercard.com");
        //        content.Headers.Add("Referer", "https://sapiensin.com/abc.html");
        //        content.Headers.Add("cache-control", "no-cache");
        //        content.Headers.Add("Accept", "application/json");

        //        HttpResponseMessage messge = client.PostAsync(url, content).Result;
        //        string description = string.Empty;
        //        if (messge.IsSuccessStatusCode)
        //        {
        //            string result = messge.Content.ReadAsStringAsync().Result;
        //            description = result;
        //        }

        //        return messge;
        //    }
    }
}
