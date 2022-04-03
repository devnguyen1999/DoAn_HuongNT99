using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Areas.Admin.Controllers
{
    public class AuthController : Controller
    {
        // GET: Admin/Auth
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Admin/Auth
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string tenTaiKhoan, string matKhau)
        {
            if (string.IsNullOrEmpty(tenTaiKhoan))
            {
                ViewBag.ErrorUsername = "Tên tài khoản không được để trống";
            }
            if (string.IsNullOrEmpty(matKhau))
            {
                ViewBag.ErrorPassword = "Mật khẩu không được để trống";

            }
            var TenTaiKhoan = db.TaiKhoans.Where(u => u.TenTaiKhoan.Equals(tenTaiKhoan) && u.MatKhau.Equals(matKhau) && u.TrangThai == true).ToList();
            if (TenTaiKhoan.Count() > 0)
            {
                if (TenTaiKhoan.First().Quyen == 0)
                {
                    ViewBag.FailedMessage = "Không được phép truy cập";
                    return View();
                }
                Session["TenTaiKhoan"] = TenTaiKhoan.FirstOrDefault().TenTaiKhoan;
                if (TenTaiKhoan.First().Quyen == 1)
                {
                    Session["Quyen"] = "Admin";
                }
                if (TenTaiKhoan.First().Quyen == 2)
                {
                    Session["Quyen"] = "Employee";
                }
                return Redirect("/Admin/Manage");
            }
            else
            {
                ViewBag.FailedMessage = "Thông tin tài khoản không chính xác!";
            }
            return View();
        }
        [HttpGet]
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}