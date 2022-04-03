using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }
      
        
        [HttpPost]
        public JsonResult Send(string name, string phone, string email, string address, string content)
        {
            var feedback = new PhanHoi();
            feedback.Ten = name;
            feedback.SoDT = phone;
            feedback.Email = email;
            feedback.NgayTao = DateTime.Now;
            feedback.DiaChi = address;
            feedback.NoiDung = content;

            var id = new ContactDao().InsertFeeBack(feedback);
            if (id > 0)
                return Json(new
                {
                    status = true
                });
            else
                return Json(new
                {
                    status = false
                });
        }
    }
}