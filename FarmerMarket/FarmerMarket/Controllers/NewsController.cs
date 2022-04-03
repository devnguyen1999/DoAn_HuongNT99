using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FarmerMarket.Models;
using PagedList;

namespace FarmerMarket.Controllers
{
    public class NewsController : Controller
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: News
        public ActionResult Index(int? page)
        {
            var tinTucs = db.TinTucs.Select(t => t);
            tinTucs = db.TinTucs.OrderByDescending(t => t.NgayCapNhat);
            int pageNumber = (page ?? 1);

            return View(tinTucs.ToPagedList(pageNumber, 5));
        }
        //public ActionResult Index()
        //{
        //    //var tinTucs = db.TinTucs.Select(t => t);
        //    var tinTucs = db.TinTucs.OrderByDescending(t => t.NgayTao).ToList();
        //    return View(tinTucs);
        //}

        // GET: News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        
    }
}
