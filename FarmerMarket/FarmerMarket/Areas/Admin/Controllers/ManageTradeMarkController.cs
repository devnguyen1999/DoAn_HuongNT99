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
    public class ManageTradeMarkController : ProtectAdminController
    {
        private FarmerMarketDB db = new FarmerMarketDB();

        // GET: Admin/ManageTradeMark
        public ActionResult Index()
        {
            var thuongHieus = db.ThuongHieux.OrderByDescending(th => th.MaTH).ToList();
            return View(thuongHieus);
        }

        // GET: Admin/ManageTradeMark/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ManageTradeMark/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTH,TenThuongHieu,NgayTao,NgayCapNhat")] ThuongHieu thuongHieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.ThuongHieux.Add(thuongHieu);
                    db.SaveChanges();
                }
                setAlert("Thêm mới thương hiệu thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                return View(thuongHieu);
            }
        }

        // GET: Admin/ManageTradeMark/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            if (thuongHieu == null)
            {
                return HttpNotFound();
            }
            return View(thuongHieu);
        }

        // POST: Admin/ManageTradeMark/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTH,TenThuongHieu,NgayTao,NgayCapNhat")] ThuongHieu thuongHieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(thuongHieu).State = EntityState.Modified;
                    db.SaveChanges();
                }
                setAlert("Sửa thương hiệu thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ" + ex.Message;
                return View(thuongHieu);
            }
        }

        // GET: Admin/ManageTradeMark/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            if (thuongHieu == null)
            {
                return HttpNotFound();
            }
            return View(thuongHieu);
        }

        // POST: Admin/ManageTradeMark/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            try
            {
                db.ThuongHieux.Remove(thuongHieu);
                db.SaveChanges();
                setAlert("Xóa thương hiệu thành công!", "success");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Dữ liệu không hợp lệ!" + ex.Message;
                return View(thuongHieu);
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
