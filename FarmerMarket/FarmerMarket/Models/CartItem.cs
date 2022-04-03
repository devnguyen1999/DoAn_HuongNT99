using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FarmerMarket.Models
{
    [Serializable]
    public class CartItem
    {
        public SanPham SanPham { get; set; }

        public int Soluong { get; set; }
    }
}