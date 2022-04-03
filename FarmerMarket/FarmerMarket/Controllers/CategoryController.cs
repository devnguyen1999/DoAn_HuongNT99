using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FarmerMarket.Models;
using PagedList;

namespace FarmerMarket.Controllers
{
    public class CategoryController : Controller
    {
        FarmerMarketDB db = new FarmerMarketDB();

        // GET: Category
        public ActionResult Detail(int id, string order, decimal? fromPrice, decimal? toPrice, int? page)
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

            if (order != null)
                switch (order)
                {
                    case "desc":
                        products = products.OrderByDescending(p => p.Gia);
                        ViewBag.order = "desc";
                        break;
                    case "asc":
                        products = products.OrderBy(p => p.Gia);
                        ViewBag.order = "asc";
                        break;
                    default:
                        ViewBag.order = "default";
                        break;
                }

            if (fromPrice != null)
            {
                ViewBag.from = fromPrice;
                products = (IOrderedQueryable<SanPham>)products.Where(p => p.Gia >= fromPrice);
            }

            if (toPrice != null)
            {
                ViewBag.to = toPrice;
                products = (IOrderedQueryable<SanPham>)products.Where(p => p.Gia <= toPrice);
            }

            int pageNumber = (page ?? 1);
            ViewBag.Category = category.TenDanhMuc;

            return View(products.ToPagedList(pageNumber, 8));
        }
    }
}