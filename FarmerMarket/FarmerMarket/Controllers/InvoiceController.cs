using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FarmerMarket.Controllers
{
    public class InvoiceController : ProtectController
    {
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Invoice
        public ActionResult DetailReceipt(int MaHD)
        {
            HoaDon hd = db.HoaDons.Find(MaHD);
            return View(hd);
        }

    }
}