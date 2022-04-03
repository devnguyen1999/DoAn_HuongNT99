using System.Web.Mvc;

namespace FarmerMarket.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
               "Admin_default",
               "admin/{controller}/{action}",
               new { controller = "Manage", action = "Index" }
           );
            //GET: Admin
            context.MapRoute(
                "Manage",
                "Admin/{controller}",
                new { controller = "Manage", action = "Index" }
            );
            //GET: Admin/ManageCategory
            context.MapRoute(
                "ManageCategory",
                "Admin/{controller}/{action}",
                new { controller = "ManageCategory", action = "Index" }
            );

            //GET: Admin/ManageReceipt
            context.MapRoute(
                "ManageReceipt",
                "Admin/{controller}/{action}",
                new { controller = "ManageReceipt", action = "Index" }
            );
            //GET: Admin/ManageProduct
            context.MapRoute(
                "ManageProduct",
                "Admin/{controller}/{action}",
                new { controller = "ManageProduct", action = "Index" }
            );
            //GET: Admin/ManageNews
            context.MapRoute(
                "ManageNews",
                "Admin/{controller}/{action}",
                new { controller = "ManageNews", action = "Index" }
            );
            //GET: Admin/ManageTradeMark
            context.MapRoute(
                "ManageTradeMark",
                "Admin/{controller}/{action}",
                new { controller = "ManageTradeMark", action = "Index" }
            );
        }
    }
}