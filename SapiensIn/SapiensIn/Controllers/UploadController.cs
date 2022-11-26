using SapiensIn.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace SapiensIn.Controllers
{
    [RoutePrefix("api/Upload")]
    public class UploadController : ApiController
    {
        private static int Count = 0;

        [HttpPost]
        [Route("UploadData")]
        public async Task<object> UploadData()
        {
            Count = 0;
            if (!Request.Content.IsMimeMultipartContent("form-data"))
            {
                throw new HttpResponseException
                 (Request.CreateResponse(HttpStatusCode.UnsupportedMediaType));
            }
            NamedMultipartFormDataStreamProvider streamProvider = new NamedMultipartFormDataStreamProvider(SuperAdminHelper.UPLOAD_DATA);
            await Request.Content.ReadAsMultipartAsync(streamProvider);
            return new
            {
                FileNames = streamProvider.FileData.Select(entry => Path.GetFileName(entry.LocalFileName)),
            };
        }

        private class NamedMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
        {
            public NamedMultipartFormDataStreamProvider(string fileName) : base(fileName)
            {
            }

            public override string GetLocalFileName(System.Net.Http.Headers.HttpContentHeaders headers)
            {
                string fileName = base.GetLocalFileName(headers);
                if (!string.IsNullOrEmpty(headers.ContentDisposition.FileName))
                {
                    fileName = headers.ContentDisposition.FileName;
                }
                if (fileName.StartsWith("\"") && fileName.EndsWith("\""))
                {
                    fileName = fileName.Trim('"');
                }
                if (fileName.Contains(@"/") || fileName.Contains(@"\"))
                {
                    fileName = Path.GetFileName(fileName);
                }
                var ext = fileName.Split('.');
                int len = ext.Length;

                fileName = System.DateTime.Now.ToString("yyyyMMddHHmmssms") + Count + "." + ext[len - 1];

                Count++;
                return fileName;
            }
        }
    }
}
