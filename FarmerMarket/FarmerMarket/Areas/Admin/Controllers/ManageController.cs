using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Areas.Admin.Controllers
{
    public class ManageController : ProtectAdminController
    {
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Admin/Manage
        public ActionResult Index()
        {
            if (Session["TenTaiKhoan"] == null)
            {
                return RedirectToAction("Login");
            }
            var products = db.SanPhams.ToList();
            var categories = db.DanhMucs.ToList();
            var receipts = db.HoaDons.ToList();
            var trademarks = db.ThuongHieux.ToList();
            var news = db.TinTucs.ToList();
            var feedbacks = db.PhanHois.ToList();
            DateTime today = DateTime.Today;
            List<HoaDon> hd = db.HoaDons.Where(h => h.TrangThai.Equals("Đã giao")).ToList();
            List<HoaDon> hds = db.HoaDons.Where(h => h.NgayTao.Month == today.Month &&
                    h.NgayTao.Year == today.Year && h.TrangThai.Equals("Đã giao")).ToList();
            decimal tongTienNum = 0;
            foreach (var item in hds)
            {
                tongTienNum += item.GioHang.ChiTietGioHangs.Select(c => c.SoLuong * c.Gia).Sum();
            }

            List<HoaDon> hd_trong_nam = receipts.Where(h => h.NgayTao.Year == today.Year
                    && h.TrangThai.Equals("Đã giao")).ToList();
            decimal tongTienTrongNamNum = 0;
            foreach (var item in hd_trong_nam)
            {
                tongTienTrongNamNum += item.GioHang.ChiTietGioHangs.Select(c => c.SoLuong * c.Gia).Sum();
            }

            var accounts = db.TaiKhoans.Where(t => t.Quyen == 0).ToList();

            ViewBag.soLuongSp = products.Count;
            ViewBag.soLuongDm = categories.Count;
            ViewBag.soLuongDh = hds.Count;
            ViewBag.soLuongTk = accounts.Count;
            ViewBag.soLuongTT = news.Count;
            ViewBag.soLuongTH = trademarks.Count;
            ViewBag.soLuongPH = feedbacks.Count;
            ViewBag.soHD = hd.Count;
            System.Globalization.CultureInfo cul = System.Globalization.CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
            string tongTien = string.Format("{0:0,000}", tongTienNum);
            string tongTienTrongNam = string.Format("{0:0,000}", tongTienTrongNamNum);
            ViewBag.tongTienThangNay = tongTien;
            ViewBag.tongTienTrongNam = tongTienTrongNam;
            return View();
        }
        public ActionResult Product()
        {
           
            //if (!string.IsNullOrEmpty(searchString))
            //{
            //    sanphams = sanphams.Where(p => p.TenSP.Contains(searchString));
            //}

            return View();
        }
        public ActionResult ProductDetails(int id)
        {
            if (id == null)
            {
                return Redirect("/NotFound/Index");
            }
            var category = db.DanhMucs.Find(id);
            if (category == null)
            {
                return Redirect("/NotFound/Index");
            }

            var products = db.SanPhams.Where(p => p.MaDanhMuc == id).OrderByDescending(p => p.MaSP);

          
            ViewBag.Category = category.TenDanhMuc;

            return View(products.ToList());
        }
        //public ActionResult ProductDetails(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SanPham sanPham = db.SanPhams.Find(id);
        //    if (sanPham == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.MaDanhMuc = new SelectList(db.SanPhams, "MaDanhMuc", "TenDanhMuc", sanPham.MaDanhMuc);
        //    ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu", sanPham.MaTH);
        //    return View(sanPham);
        //}
        public ActionResult Category()
        {
            var danhmucs = db.DanhMucs.OrderByDescending(dm => dm.MaDanhMuc).ToList();
            return View(danhmucs);
        }
        public ActionResult SPBanChayNhat()
        {
            //var query = (from sanpham in db.SanPhams
            //             let tongSl = (from cthd in db.ChiTietGioHangs
            //                           join hd in db.HoaDons on cthd.MaGioHang equals hd.MaGioHang
            //                           where cthd.MaSP == sanpham.MaSP
            //                           select cthd.SoLuong
            //                           ).Sum()
            //             where tongSl > 0
            //             orderby tongSl descending
            //             select new
            //             {
            //                 sanpham.MaSP,
            //                 sanpham.TenSP,
            //                 sanpham.Gia,
            //                 SoLuongBan = tongSl
            //             }
            //             ).Take(10);
            
            //var danhmucs = db.DanhMucs.OrderByDescending(dm => dm.MaDanhMuc).ToList();
            return View();
        }
        public ActionResult TradeMarks()
        {
            var thuongHieus = db.ThuongHieux.OrderByDescending(th => th.MaTH).ToList();
            return View(thuongHieus);
        }
        public ActionResult TradeMarksDetails(int id)
        {
            if (id == null)
            {
                return Redirect("/NotFound/Index");
            }
            var trademark = db.ThuongHieux.Find(id);
            if (trademark == null)
            {
                return Redirect("/NotFound/Index");
            }

            var products = db.SanPhams.Where(p => p.MaTH == id).OrderByDescending(p => p.MaSP);


            ViewBag.TradeMark = trademark.TenThuongHieu;

            return View(products.ToList());
        }
        public ActionResult AccountAdmin()
        {
            // select only admin account
            var taiKhoans = db.TaiKhoans.Where(t => t.Quyen == 0).Select(t => t);
            taiKhoans = taiKhoans.OrderBy(t => t.TenTaiKhoan);
            return View(taiKhoans);
        }
        public ActionResult AdminAccountDetail(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan user = db.TaiKhoans.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }
        public ActionResult News()
        {
            var tinTucs = db.TinTucs.Select(t => t);
            tinTucs = db.TinTucs.OrderByDescending(t => t.NgayTao);
            return View(tinTucs.ToList());
        }

        // GET: Admin/ManageNews/Details/5
        public ActionResult NewDetails(int? id)
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
        public ActionResult Feedback()
        {
            return View(db.PhanHois.ToList());
        }

        // GET: Admin/Feedback/Details/5
        public ActionResult FeedbackDetails(int? id)
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
        public ActionResult ThongKeTheoThang()
        {
            DateTime today = DateTime.Today;
            var hds = db.HoaDons.Where(h => h.NgayTao.Month == today.Month &&
                    h.NgayTao.Year == today.Year && h.TrangThai.Equals("Đã giao")).ToList();
            return View(hds);
        }
        public ActionResult ChiTietDonTrongThang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }
        public ActionResult ThongKeTrongNam()
        {
            DateTime today = DateTime.Today;
            var receipts = db.HoaDons.ToList();
            var hd_trong_nam = receipts.Where(h => h.NgayTao.Year == today.Year
                   && h.TrangThai.Equals("Đã giao")).ToList();
            return View(hd_trong_nam);
        }
        public ActionResult DonHangTrongNam(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }
        public ActionResult DonHang()
        {
            var hoaDons = db.HoaDons.Where(h => h.TrangThai.Equals("Đã giao")).ToList();
            return View(hoaDons);
        }

        // GET: Admin/ManageReceipt/Details/5
        public ActionResult ChiTietDonHang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

    }
}