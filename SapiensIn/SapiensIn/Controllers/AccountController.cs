using SapiensIn.BLL;
using SapiensIn.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SapiensIn.Controllers
{
    [RoutePrefix("api/Account")]
    public class AccountController : ApiController
    {
        Entities _entities;

        [HttpGet]
        [Route("LoginUser")]
        public LOGIN_USER_Result LoginUser(string MobileNumber, string Password)
        {
            try
            {
                _entities = new Entities();

                return _entities.LOGIN_USER(MobileNumber, Password, null).ToList<LOGIN_USER_Result>()[0];
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("CheckMobileNumberForAccountCreation")]
        public bool CheckMobileNumberForAccountCreation(string MobileNumber)
        {
            try
            {
                _entities = new Entities();

                int? Count = _entities.CHECK_MOBILE_NUMBER_FOR_ACCOUNT_CREATION(MobileNumber).ToList<int?>()[0];

                if(Count == 0)
                {
                    return true;
                }

                return false;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        [Route("AddOrUpdateUser")]
        public LOGIN_USER_Result AddOrUpdateUser(long? UserID, string Name, int UserTypeID, int? SpecialityID, string Experience, double? SatisfactionPercentage, string DisplayPicture, string MobileNumber, string Password, string ResidentialAddress, string Education, bool Status)
        {
            try
            {
                using (Entities e = new Entities())
                {
                    UserID = e.ADD_OR_UPDATE_USERS(UserID, Name, UserTypeID, SpecialityID, Experience, SatisfactionPercentage, DisplayPicture, MobileNumber, Password, Status, ResidentialAddress, Education).ToList<long?>()[0];
                }

                if(UserID == -9)// Mob num duplicate
                {
                    return null;
                }
                else
                {
                    _entities = new Entities();

                    return _entities.LOGIN_USER(null, null, UserID).ToList<LOGIN_USER_Result>()[0];
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
