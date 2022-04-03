using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FarmerMarket.Models;

namespace FarmerMarket.Areas.Admin.Controllers
{
    public class FeedbackController : ProtectAdminController
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/Feedback
        public ActionResult Index()
        {
            return View(db.PhanHois.ToList());
        }

        // GET: Admin/Feedback/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanHoi phanHoi = db.PhanHois.Find(id);
            if (phanHoi == null)
            {
                return HttpNotFound();
            }
            return View(phanHoi);
        }

    }
}
