
using FarmerMarket.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Controllers
{
    public class ProfileController : ProtectController
    {
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Profile
        public ActionResult Index()
        {
            TaiKhoan oldUser = Session["TaiKhoan"] as TaiKhoan;
            TaiKhoan newUser = db.TaiKhoans.Where(us => us.TenTaiKhoan.Equals(oldUser.TenTaiKhoan)).FirstOrDefault();
            Session["TaiKhoan"] = newUser;
            var errMsg = TempData["ErrorMessage"] as string;
            ViewBag.Infor = errMsg;
            return View(newUser);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(FormCollection frm)
        {
            string tenTaiKhoan = frm["TenTaiKhoan"];
            string hoTen = frm["HoTen"];
            string soDienThoai = frm["SoDienThoai"];
            string Email = frm["Email"];
            string diaChi = frm["DiaChi"];

            TaiKhoan user = db.TaiKhoans.Where(us => us.TenTaiKhoan == tenTaiKhoan).SingleOrDefault();
            user.HoTen = hoTen;
            user.SoDienThoai = soDienThoai;
            user.DiaChi = diaChi;
            user.Email = Email;
            if (user!=null)
            {
                db.Entry(user).State = EntityState.Modified;
                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();
                ViewBag.Information = "Cập nhật thành công";
            }
            else
            {
                ViewBag.Information = "Có lỗi xảy ra khi cập nhật";
            }
            
            return View("Index",user);
        }

        public ActionResult ChangePass(string TenTK)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(TenTK);
            return View(taiKhoan);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePass([Bind(Include = "TenTaiKhoan,MatKhau,Quyen,TrangThai,HoTen,Email,SoDienThoai,DiaChi")] TaiKhoan taiKhoan,
            string OldPassword)
        {
            string old_pass = db.TaiKhoans.AsNoTracking().
                Where(t => t.TenTaiKhoan.Equals(taiKhoan.TenTaiKhoan)).
                FirstOrDefault().MatKhau;
            if (old_pass.Equals(OldPassword))
            {
                if (ModelState.IsValid)
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["message"] = "Thành công";
                    setAlert("Đổi mật khẩu thành công mời đăng nhập lại!", "success");
                    //ViewBag.Information = "Đổi mật khẩu thành công";
                    //return View("Index", taiKhoan);
                    return RedirectToAction("Logout");
                   
                }
                else
                {
                    ViewBag.Message = "Lỗi nhập dữ liệu!!!";
                }
            }
            else
            {
                ViewBag.Message = "Mật khẩu cũ không chính xác!!!";
            }
            return View(taiKhoan);
        }

        [NotAuthorize]
        public ActionResult Logout()
        {
            Session.Clear();
            //Session["TaiKhoan"] = null;
            //Session["Cartsession"] = null;
            return Redirect("/");
        }
        [NotAuthorize]
        public ActionResult Login()
        {

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [NotAuthorize]
        public ActionResult Login(string TenTaiKhoan, string MatKhau)
        {
            if (string.IsNullOrEmpty(TenTaiKhoan))
            {
                ViewBag.ErrorTenTaiKhoan = "Tên tài khoản không được để trống";
            }
            if (string.IsNullOrEmpty(TenTaiKhoan))
            {
                ViewBag.ErrorMatKhau = "Mật khẩu không được để trống";
            }
            var response = Request["g-Recaptcha-Response"];
            string secretKey = "6Lc6858dAAAAAFiGln-5wwd0CiKgyGW2eA6_j3H1";
            var client = new WebClient();
            var resultcaptcha = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
            var obj = JObject.Parse(resultcaptcha);
            var status = (bool)obj.SelectToken("success");
            ViewBag.Message = status ? "" : "Xác thực thất bại";
            if (ModelState.IsValid && status)
            {
                var user = db.TaiKhoans.Where(t => t.TenTaiKhoan.Equals(TenTaiKhoan) && t.MatKhau.Equals(MatKhau) && t.Quyen == 0).ToList();
                if (user.Count() > 0)
                {

                    if (user.FirstOrDefault().TrangThai == false)
                    {
                        // Hien thi thong bao loi
                        ViewBag.error = "Tài khoản bị khóa. Đăng nhập không thành công";
                    }
                    else
                    {
                        //Su dung session: add Session
                        Session["TaiKhoan"] = user.FirstOrDefault();
                        Session["TenKhachHang"] = user.FirstOrDefault().HoTen;
                        Session["TenTaiKhoan"] = user.FirstOrDefault().TenTaiKhoan;
                        // Sang trang ch
                        return RedirectToAction("Index","Home");
                    }
                }
                else
                {
                    ViewBag.error = "Đăng nhập không thành công";
                }
            }
            return View();
        }

        [NotAuthorize]
        [HttpGet]
        public ActionResult Register()
        {

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [NotAuthorize]
        public ActionResult Register([Bind(Include = "TenTaiKhoan,MatKhau,Quyen,TrangThai,HoTen,Email,SoDienThoai,DiaChi")] TaiKhoan taiKhoan)
        {
            var response = Request["g-Recaptcha-Response"];
            string secretKey = "6Lc6858dAAAAAFiGln-5wwd0CiKgyGW2eA6_j3H1";
            var client = new WebClient();
            var resultcaptcha = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
            var obj = JObject.Parse(resultcaptcha);
            var status = (bool)obj.SelectToken("success");
            ViewBag.Message = status ? "Xác thực thành công" : "Xác thực thất bại";
            if (ModelState.IsValid && status)
            {
                var taiKhoanFind = db.TaiKhoans.Find(taiKhoan.TenTaiKhoan);
                if (taiKhoanFind == null)
                {
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.ErrorSign = "Tên tài khoản trùng. Vui lòng nhập tên khác";
                }
            }
            //ViewBag.Infor = taiKhoan.ToString();
            return View(taiKhoan);
        }
    }
}