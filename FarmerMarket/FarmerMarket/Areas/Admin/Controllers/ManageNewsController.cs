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
    public class ManageNewsController : ProtectAdminController
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/ManageNews
        public ActionResult Index()
        {
            var tinTucs = db.TinTucs.Select(t => t);
            tinTucs = db.TinTucs.OrderByDescending(t => t.NgayTao);
            return View(tinTucs.ToList());
        }

        // GET: Admin/ManageNews/Details/5
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

        // GET: Admin/ManageNews/Create
        public ActionResult Create()
        {
            var tenTK = db.TaiKhoans.Where(t => t.Quyen == 1 && t.TrangThai == true).ToList();
            ViewBag.TenTaiKhoan = new SelectList(tenTK, "TenTaiKhoan", "TenTaiKhoan");
            return View();
        }

        // POST: Admin/ManageNews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTinTuc,TieuDe,MoTaNgan,MoTaChiTiet,HinhAnh,NgayTao,NgayCapNhat,TenTaiKhoan")] TinTuc tinTuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    tinTuc.HinhAnh = "";
                    var f = Request.Files["HinhAnh"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/news/" + FileName);
                        f.SaveAs(UploadPath);
                        tinTuc.HinhAnh = FileName;
                    }
                    db.TinTucs.Add(tinTuc);
                    db.SaveChanges();
                    setAlert("Thêm mới tin tức thành công!", "success");
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                //ViewBag.TenTaiKhoan = new SelectList(db.TaiKhoans, "TenTaiKhoan", "MatKhau", tinTuc.TenTaiKhoan);

                ViewBag.Error = "Dữ liệu không hợp lệ" + ex.Message;
                return View(tinTuc);
            }
        }

        // GET: Admin/ManageNews/Edit/5
        public ActionResult Edit(int? id)
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
        
            var tenTK = db.TaiKhoans.Where(t => t.Quyen == 1 && t.TrangThai == true).ToList();
            ViewBag.TenTaiKhoan = new SelectList(tenTK, "TenTaiKhoan", "TenTaiKhoan");
            return View(tinTuc);
        }

        // POST: Admin/ManageNews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTinTuc,TieuDe,MoTaNgan,MoTaChiTiet,HinhAnh,NgayTao,NgayCapNhat,TenTaiKhoan")] TinTuc tinTuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["HinhAnh"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/news/" + FileName);
                        f.SaveAs(UploadPath);
                        tinTuc.HinhAnh = FileName;
                    }
                    db.Entry(tinTuc).State = EntityState.Modified;
                    db.SaveChanges();
                    setAlert("Sửa tin tức thành công!", "success");
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                ViewBag.TenTaiKhoan = new SelectList(db.TaiKhoans, "TenTaiKhoan", "TenTaiKhoan", tinTuc.TenTaiKhoan);
                return View(tinTuc);
            }
        }

        public ActionResult Delete(int? id)
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

        // POST: Admin/TinTucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                TinTuc tinTuc = db.TinTucs.Find(id);
                db.TinTucs.Remove(tinTuc);
                db.SaveChanges();
                setAlert("Xoá tin tức thành công!", "success");
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Xoá thất bại" + ex.Message;
                return View();
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
