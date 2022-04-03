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
    public class ManageAdminAccountController : ProtectAdminController
    {
        // GET: Admin/ManageAdminAccount
        private FarmerMarketDB db = new FarmerMarketDB();
        public ActionResult Index()
        {
            // select only admin account
            var taiKhoans = db.TaiKhoans.Where(t => t.Quyen == 1 || t.Quyen == 2).OrderBy(t => t.TenTaiKhoan);
            return View(taiKhoans.ToList());
        }
        // GET: Admin/AdminTaiKhoans/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ManageAdminAccount/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TenTaiKhoan,MatKhau," +
            "Quyen,TrangThai,HoTen,Email,SoDienThoai,DiaChi")] TaiKhoan taiKhoan)
        {
            /*taiKhoan.Quyen = 1;*/
            try
            {
                if (ModelState.IsValid)
                {
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();
                }
                setAlert("Thêm mới tài khoản thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                return View(taiKhoan);
            }
        }

        // GET: Admin/ManageAdminAccount/Delete/5
        public ActionResult Delete(string id)
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


        public ActionResult Details(string id)
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

        // POST: Admin/ManageAdminAccount/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                TaiKhoan user = db.TaiKhoans.Find(id);
                db.TaiKhoans.Remove(user);
                db.SaveChanges();
                setAlert("Xoá tài khoản thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Xóa thất bại" + ex.Message;
                return View();
                //throw;
            }
        }
        public bool toggleStatus(string id)
        {
            var user = db.TaiKhoans.Find(id);
            user.TrangThai = !user.TrangThai;
            db.SaveChanges();
            setAlert("Thay đổi trạng thái thành công!", "success");
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
