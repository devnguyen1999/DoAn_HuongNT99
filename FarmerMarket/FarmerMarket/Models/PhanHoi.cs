namespace FarmerMarket.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        [Key]
        public int MaPhanHoi { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        [StringLength(12)]
        public string SoDT { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(150)]
        public string DiaChi { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        public DateTime? NgayTao { get; set; }
    }
}
