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
    public class ManageClientAccountController : ProtectAdminController
    {

        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/ManageClientAccount
        public ActionResult Index()
        {
            // select only customer account
            var taiKhoans = db.TaiKhoans.Where(t => t.Quyen == 0).Select(t => t);
            taiKhoans = taiKhoans.OrderBy(t => t.TenTaiKhoan);
            return View(taiKhoans);
        }

        // GET: Admin/ManageClientAccount/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // GET: Admin/AdminKhachHangs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/AdminKhachHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TenTaiKhoan,MatKhau,Quyen,TrangThai,HoTen,Email,SoDienThoai,DiaChi")] TaiKhoan taiKhoan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.SaveChanges();
                    setAlert("Sửa trạng thái thành công!", "success");
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                return View(taiKhoan);
            }
        }

        public bool toggleStatus(string id)
        {
            var user = db.TaiKhoans.Find(id);
            user.TrangThai = !user.TrangThai;
            db.SaveChanges();
            return user.TrangThai;
        }

        [HttpPost]
        public JsonResult ChangeStatus(string id)
        {
            var result = toggleStatus(id);
            return Json(new
            {
                status = result
            });
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
