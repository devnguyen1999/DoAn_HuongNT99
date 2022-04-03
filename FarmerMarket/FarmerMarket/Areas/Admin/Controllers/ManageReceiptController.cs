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
    public class ManageReceiptController : ProtectAdminController
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/ManageReceipt
        public ActionResult Index()
        {
            var hoaDons = db.HoaDons.Select(h=>h);
            hoaDons = hoaDons.OrderByDescending(s => s.NgayTao);
            return View(hoaDons.ToList());
        }

        // GET: Admin/ManageReceipt/Details/5
        public ActionResult Details(int? id)
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

        // GET: Admin/ManageReceipt/Create
        

        // POST: Admin/ManageReceipt/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        
        // GET: Admin/ManageReceipt/Edit/5
        public ActionResult Edit(int? id)
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
            //ViewBag.MaGioHang = new SelectList(db.GioHangs, "MaGioHang", "TenTaiKhoan", hoaDon.MaGioHang);
            return View(hoaDon);
        }

        // POST: Admin/ManageReceipt/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHoaDon,TrangThai,PhiShip,ChuY,DiaChi,NgayTao,NgayCapNhat,MaGioHang")] HoaDon hoaDon)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(hoaDon).State = EntityState.Modified;
                    db.SaveChanges();
                    setAlert("Sửa trạng thái đơn hàng thành công!", "success");
                }
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu!" + ex.Message;
                //ViewBag.MaGioHang = new SelectList(db.GioHangs, "MaGioHang", "TenTaiKhoan", hoaDon.MaGioHang);
                return View(hoaDon);
            }
            
        }

        // GET: Admin/ManageReceipt/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Admin/ManageReceipt/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            db.HoaDons.Remove(hoaDon);
            db.SaveChanges();
            setAlert("Xoá đơn hàng thành công!", "success");
            return RedirectToAction("Index");
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
