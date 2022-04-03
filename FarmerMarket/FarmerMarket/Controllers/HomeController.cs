using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FarmerMarket.Models;
using PagedList;

namespace FarmerMarket.Controllers
{
    public class HomeController : Controller
    {
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Home
        public ActionResult Index(int? page)
        {
            var products = db.SanPhams.OrderByDescending(p => p.MaSP);
                int pageNumber = (page ?? 1);
            
            return View(products.ToPagedList(pageNumber,10));
        }
        [HttpGet]
        public ActionResult CancelOrder(int MaHD)
        {
            HoaDon hd = db.HoaDons.Find(MaHD);
            hd.TrangThai = "Đã hủy";
            db.SaveChanges();
            return RedirectToAction("Index","Profile", new { TenTK = Session["TenTaiKhoan"] });
        }


        public PartialViewResult _DC_GiaoHang()
        {
            TaiKhoan tk = (TaiKhoan)Session["TaiKhoan"];
            if (tk == null)
            {
                return PartialView();
            }
            else
            {
                return PartialView(tk);
            }
        }
        public PartialViewResult _DC_LienHe()
        {
            TaiKhoan tk = (TaiKhoan)Session["TaiKhoan"];
            if (tk == null)
            {
                return PartialView();
            }
            else
            {
                return PartialView(tk);
            }
        }


    }
}