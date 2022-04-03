namespace FarmerMarket.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TinTuc")]
    public partial class TinTuc
    {
        [Key]
        public int MaTinTuc { get; set; }


        [Required(ErrorMessage = "Tiêu đề không được để trống")]
        [DisplayName("Tiêu đề")]
        [StringLength(255)]
        public string TieuDe { get; set; }

        [Required(ErrorMessage = "Mô tả ngắn không được để trống")]
        [DisplayName("Mô tả ngắn")]
        [StringLength(300)]
        public string MoTaNgan { get; set; }

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "Mô tả chi tiết không được để trống")]
        [DisplayName("Tiêu đề")]
        public string MoTaChiTiet { get; set; }

        [Required(ErrorMessage = "Hình ảnh không được để trống")]
        [DisplayName("Hình ảnh")]
        [StringLength(100)]
        public string HinhAnh { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        [Required]
        [StringLength(100)]
        public string TenTaiKhoan { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
