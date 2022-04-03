using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FarmerMarket.Models
{
    public class ContactDao
    {
        FarmerMarketDB db = null;
        public ContactDao()
        {
            db = new FarmerMarketDB();
        }
        public LienHe GetActiveContact()
        {
            return db.LienHes.Single(x => x.TrangThai == true);
        }
        public int InsertFeeBack(PhanHoi ph)
        {
            db.PhanHois.Add(ph);
            db.SaveChanges();
            return ph.MaPhanHoi;
        }
    }
}