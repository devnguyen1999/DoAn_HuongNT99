using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace FarmerMarket.Controllers
{
    public class CheckoutController : Controller
    {
        private const string Cartsession = "Cartsession";
        FarmerMarketDB db = new FarmerMarketDB();
        // GET: Checkout
        public ActionResult Index()
        {
            var cart = Session[Cartsession];
            if (Session["TenTaiKhoan"] != null)
            {
                var list = new List<CartItem>();
                if (cart != null)
                {
                    list = (List<CartItem>)cart;
                }
                return View(list);
             
            }
            else
            {
                return RedirectToAction("Login", "Profile");
            }
            //var cart = Session[Cartsession];
            //if(Session["TenTaiKhoan"] == null)
            //{
            //    return RedirectToAction("Login", "Profile");
            //}
            //var list = new List<CartItem>();
            //if (cart != null)
            //{
            //    list = (List<CartItem>)cart;
            //}
            //return View(list);
            //else
            //{
            //    var list = new List<CartItem>();
            //    list = (List<CartItem>)cart;
            //    return View(list);
            //}

        }
        public ActionResult Additem(int productId, int quantity)
        {
            var product = db.SanPhams.Find(productId);
            var cart = Session[Cartsession];
            if (product.SoLuong == 0 || product.SoLuong < 0)
            {
                return RedirectToAction("ErrorOrder", "Checkout");
            }
            else
            {
                if (cart != null)
                {
                    var list = (List<CartItem>)cart;
                    if (list.Any(x => x.SanPham.MaSP == productId))
                    {
                        foreach (var item in list)
                        {
                            if (item.SanPham.MaSP == productId)
                            {
                                item.Soluong += quantity;
                            }
                        }
                    }
                    else
                    {
                        //tạo mới đối tượng cart item;
                        var item = new CartItem();
                        item.SanPham = product;
                        item.Soluong = quantity;
                        list.Add(item);


                    }
                    Session[Cartsession] = list;
                }
                else
                {
                    var item = new CartItem();
                    item.SanPham = product;
                    item.Soluong = quantity;
                    var list = new List<CartItem>();
                    list.Add(item);
                    //gắn với session
                    Session[Cartsession] = list;

                }
            }

            return RedirectToAction("Index", "Checkout");
        }
        public JsonResult Update(string cartModel)
        {

            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[Cartsession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.SanPham.MaSP == item.SanPham.MaSP);
                if (jsonItem != null)
                {
                    item.Soluong = jsonItem.Soluong;
                }
            }
            Session[Cartsession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var sessionCart = (List<CartItem>)Session[Cartsession];
            sessionCart.RemoveAll(x => x.SanPham.MaSP == id);
            Session[Cartsession] = sessionCart;
            return RedirectToAction("Index", "Checkout");
        }
        public ActionResult DeleteAll()
        {
            Session.Remove(Cartsession);
            return RedirectToAction("Index", "Checkout");
        }
        [HttpGet]
        public ActionResult Order(string sumTotal)
        {
            ViewBag.sumTotal = sumTotal;
            var cart = Session[Cartsession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
       
        [HttpPost]
        public ActionResult Order(string DcNhanHang, string GhiChu)
        {
            List<CartItem> ListSP = new List<CartItem>();
            if (Session["Cartsession"] != null)
            {
                ListSP = (List<CartItem>)Session["Cartsession"];
            }
            if (Session["TenTaiKhoan"] != null)
            {
                GioHang giohang = new GioHang();
                giohang.TenTaiKhoan = (string)Session["TenTaiKhoan"];
                db.GioHangs.Add(giohang);
                db.SaveChanges();
                int generatedId = giohang.MaGioHang;
                foreach (var item in ListSP)
                {
                    ChiTietGioHang ct = new ChiTietGioHang();
                    ct.MaGioHang = generatedId;
                    ct.MaSP = item.SanPham.MaSP;
                    ct.SoLuong = item.Soluong;
                    ct.Gia = item.SanPham.Gia;
                    db.ChiTietGioHangs.Add(ct);
                    db.SaveChanges();
                    var product = db.SanPhams.SingleOrDefault(x => x.MaSP == item.SanPham.MaSP);
                    product.SoLuong -= item.Soluong;

                }
                HoaDon hd = new HoaDon();
                hd.NgayTao = DateTime.Now;
                hd.TrangThai = "Chờ xác nhận";
                hd.PhiShip = 15000;
                hd.ChuY = GhiChu;
                hd.MaGioHang = generatedId;
                if (DcNhanHang != "")
                {
                    hd.DiaChi = DcNhanHang;
                }
                else
                {
                    TaiKhoan tk = Session["TaiKhoan"] as TaiKhoan;
                    hd.DiaChi = tk.DiaChi;
                }

                db.HoaDons.Add(hd);
                db.SaveChanges();
               
            }
            else
            {
                return RedirectToAction("Login", "Profile");
            }
            Session[Cartsession] = null;
            return Redirect("/");
        }

        public ActionResult ErrorOrder()
        {
            try
            {
                var sessionUser = Session["TaiKhoan"] as TaiKhoan;
                ViewBag.name = sessionUser.HoTen;
                ViewBag.userName = sessionUser.TenTaiKhoan;
                var ss = ViewBag.name;
                if (ViewBag.name != null)
                {
                    ViewBag.name = sessionUser.HoTen;
                }
                else
                {
                    ViewBag.name = null;
                }
            }
            catch
            {
                ViewBag.name = null;
            }
            return View();
        }
    }
}