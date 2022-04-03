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
    public class ManageProductController : ProtectAdminController
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/SanPhams
        // GET: Admin/ManageProduct
        public ActionResult Index(string searchString)
        {
            var sanphams = db.SanPhams.Select(p => p);
            if (!string.IsNullOrEmpty(searchString))
            {
                sanphams = sanphams.Where(p => p.TenSP.Contains(searchString));
            }

            return View(sanphams.OrderByDescending(p => p.MaSP).ToList());
        }

        // GET: Admin/ManageProduct/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDanhMuc = new SelectList(db.SanPhams, "MaDanhMuc", "TenDanhMuc", sanPham.MaDanhMuc);
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu", sanPham.MaTH);
            return View(sanPham);
        }

        // GET: Admin/ManageProduct/Create
        public ActionResult Create()
        {
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc");
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu");
            return View();
        }

        // POST: Admin/ManageProduct/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP,TrongLuong,MoTa,Gia,HinhAnh,SoLuong,NgayTao,NgayCapNhat,MaDanhMuc,MaTH")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    sanPham.HinhAnh = "";
                    var f = Request.Files["HinhAnh"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/product/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();
                    setAlert("Thêm mới sản phẩm thành công!", "success");
                  
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanPham.MaDanhMuc);
                ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu", sanPham.MaTH);
                ViewBag.Error = "Dữ liệu không hợp lệ" + ex.Message;
                return View(sanPham);
            }
        }
        // GET: Admin/ManageProduct/Edit/5

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanPham.MaDanhMuc);
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu", sanPham.MaTH);
            return View(sanPham);
        }

        // POST: Admin/ManageProduct/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,TrongLuong,MoTa,Gia,HinhAnh,SoLuong,NgayTao,NgayCapNhat,MaDanhMuc,MaTH")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["HinhAnh"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/product/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    db.Entry(sanPham).State = EntityState.Modified;
                    db.SaveChanges();
                    setAlert("Sửa sản phẩm thành công!", "success");
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanPham.MaDanhMuc);
                ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenThuongHieu", sanPham.MaTH);
                return View(sanPham);
            }
        }
        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            try
            {
                db.SanPhams.Remove(sanPham);
                db.SaveChanges();
                setAlert("Xoá sản phẩm thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ" + ex.Message;
                return View(sanPham);
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
