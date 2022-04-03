using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FarmerMarket.Models;
using PagedList;

namespace FarmerMarket.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Product
        public ActionResult Detail(int id)
        {
            if (id == null)
            {
                return Redirect("/NotFound/Index");
            }
            var product = db.SanPhams.Find(id);
            if (product == null)
            {
                return Redirect("/NotFound/Index");
            }
            return View(product);
        }
        public ActionResult Search(string keyword, string order, decimal? fromPrice, decimal? toPrice, string category, int page = 1)
        {
            if (keyword == null)
            {
                keyword = "";
            }
            var products = db.SanPhams.Where(p => p.TenSP.Contains(keyword)).OrderByDescending(p => p.MaSP);

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

            if (category != null)
            {
                string[] ids = category.Split(',');
                ViewBag.category = category;
                products = (IOrderedQueryable<SanPham>)products.Where(p => ids.Contains(p.MaDanhMuc.ToString()));
            }

            ViewBag.keyword = keyword;
            ViewBag.Categories = db.DanhMucs.OrderBy(c => c.MaDanhMuc).ToList();
            return View(products.ToPagedList(page, 12));
        }
        public JsonResult Index(int id)
        {
            if (id == null)
            {
                return Json("NOT_FOUND", JsonRequestBehavior.AllowGet);
            }
            var product = db.SanPhams.Find(id);
            if (product == null)
            {
                return Json("NOT_FOUND", JsonRequestBehavior.AllowGet);
            }
            return Json(
                new
                {
                    id = product.MaSP,
                    name = product.TenSP,
                    price = product.Gia,
                    quantity = product.SoLuong,
                    image = product.HinhAnh
                },
                JsonRequestBehavior.AllowGet
                );
        }
        public JsonResult List(string ids)
        {
            if (ids == null)
            {
                return Json("NOT_FOUND", JsonRequestBehavior.AllowGet);
            }
            string[] listId = ids.Split(',');
            var product = db.SanPhams.Where(p => listId.Contains(p.MaSP.ToString())).ToList();
            if (product == null)
            {
                return Json("NOT_FOUND", JsonRequestBehavior.AllowGet);
            }

            List<object> list = new List<object>();

            foreach (var item in product)
            {
                list.Add(new
                {
                    id = item.MaSP,
                    name = item.TenSP,
                    image = item.HinhAnh,
                    price = item.Gia,
                    quantity = item.SoLuong
                });
            }

            return Json(
                list,
                JsonRequestBehavior.AllowGet
                );
        }
    }
}