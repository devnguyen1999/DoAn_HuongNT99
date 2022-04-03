﻿using FarmerMarket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace FarmerMarket.Controllers
{
    public class ProtectController : Controller
    {
        public TaiKhoan user
        {
            get
            {
                TaiKhoan _user = Session["TaiKhoan"] as TaiKhoan;
                if(_user == null)
                {
                    _user = new TaiKhoan();
                }
                return _user;
            }
        }
        public class NotAuthorizeAttribute : FilterAttribute { }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            object[] attributes = filterContext.ActionDescriptor.GetCustomAttributes(true);
            if (attributes.Any(a => a is NotAuthorizeAttribute)) return;
            if (Session["TaiKhoan"] == null)
            {
                filterContext.Result = new RedirectResult("/Profile/Login");
            }
            base.OnActionExecuting(filterContext);
        }
        // GET: Protect
        protected void setAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
    }
}