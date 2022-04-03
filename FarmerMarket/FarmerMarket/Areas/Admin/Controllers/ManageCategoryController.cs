using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Areas.Admin.Controllers
{
    public class ManageCategoryController : ProtectAdminController
    {
        // GET: Admin/ManageCategory
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/ManageCategory
        public ActionResult Index()
        {
            var danhmucs = db.DanhMucs.OrderByDescending(dm => dm.MaDanhMuc).ToList();
            return View(danhmucs);
        }

        // GET: Admin/ManageCategory/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ManageCategory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDanhMuc,TenDanhMuc,NgayTao,NgayCapNhat")] DanhMuc danhMuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.DanhMucs.Add(danhMuc);
                    db.SaveChanges();
                    setAlert("Thêm mới danh mục thành công!", "success");
                }
               
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu" + ex.Message;
                return View(danhMuc);

            }
        }

        // GET: Admin/ManageCategory/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                return HttpNotFound();
            }
            return View(danhMuc);
        }

        // POST: Admin/ManageCategory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDanhMuc,TenDanhMuc,NgayTao,NgayCapNhat")] DanhMuc danhMuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(danhMuc).State = EntityState.Modified;
                    db.SaveChanges();
                    setAlert("Sửa danh mục thành công!", "success");
                }
                
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                return View(danhMuc);
            }

        }

        // GET: Admin/ManageCategory/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                return HttpNotFound();
            }
            return View(danhMuc);
        }

        // POST: Admin/ManageCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DanhMuc danhMuc = db.DanhMucs.Find(id);
            try
            {
                db.DanhMucs.Remove(danhMuc);
                db.SaveChanges();
                setAlert("Xoá danh mục thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                return View(danhMuc);
            }

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