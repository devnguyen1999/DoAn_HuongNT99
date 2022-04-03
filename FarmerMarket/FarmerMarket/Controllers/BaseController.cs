using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Controllers
{
    public class BaseController : ProtectController
    {
        FarmerMarketDB db = new FarmerMarketDB();


        private const string Cartsession = "Cartsession";
        // GET: Base


        [NotAuthorize]
        public PartialViewResult _Header()
        {
            var carItem = Session["Cartsession"] as List<CartItem>;
            if (carItem != null)
            {
                ViewBag.cartpronumber = carItem.Count;
            }
            else
            {
                ViewBag.cartpronumber = 0;
            }
            return PartialView(user);
        }
        [NotAuthorize]
        public PartialViewResult _MenuPC()
        {
            var categories = db.DanhMucs.ToList();
            return PartialView(categories);
        }
        [NotAuthorize]
        public PartialViewResult _MenuMobile()
        {
            ViewBag.User = user.HoTen;
            var carItem = Session["Cartsession"] as List<CartItem>;
            if (carItem != null)
            {
                ViewBag.cartpronumber = carItem.Count;
            }
            else
            {
                ViewBag.cartpronumber = 0;
            }
            var categories = db.DanhMucs.ToList();
            return PartialView(categories);
        }
        [NotAuthorize]
        public PartialViewResult _BreadcrumbLevelOne(string id)
        {
            var category = db.DanhMucs.Where(c => c.MaDanhMuc.ToString() == id).SingleOrDefault();
            return PartialView(category);
        }
        [NotAuthorize]
        public PartialViewResult _BreadcrumbLevelTwo(string id)
        {
            var product = db.SanPhams.Where(c => c.MaSP.ToString() == id).SingleOrDefault();

            return PartialView(product);
        }


        public PartialViewResult _OrderView(string TenTK)
        {
                var carts = db.GioHangs.Where(g => g.TenTaiKhoan.Equals(TenTK)).ToList();
                var hds = db.HoaDons;
                var receipts = from x in carts join y in hds on x.MaGioHang equals y.MaGioHang select y;
                return PartialView(receipts);
            

        }
    }
}