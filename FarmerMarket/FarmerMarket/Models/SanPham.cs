namespace FarmerMarket.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietGioHangs = new HashSet<ChiTietGioHang>();
        }

        [Key]
        public int MaSP { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
        [DisplayName("Tên sản phẩm")]
        [StringLength(200)]
        public string TenSP { get; set; }
        [Required(ErrorMessage = "Trọng lượng không được để trống")]
        [DisplayName("Trọng lượng")]
        [StringLength(100)]
        public string TrongLuong { get; set; }

        [Required(ErrorMessage = "Mô tả không được để trống")]
        [Column(TypeName = "ntext")]
        public string MoTa { get; set; }

        [DisplayName("Giá")]
        [Required(ErrorMessage = "Giá sản phẩm không được để trống!")]
        [RegularExpression("^[0-9]*\\.?[0-9]*$", ErrorMessage = "Giá sản phẩm phải là một số.")]
        [DisplayFormat(DataFormatString = "{0:#,###}")]
        public decimal Gia { get; set; }

        [Required(ErrorMessage = "Hình ảnh không được để trống")]
        [DisplayName("Hình Ảnh")]
        [StringLength(100)]
        public string HinhAnh { get; set; }
        [Required(ErrorMessage = "Số lượng không được để trống")]
        [DisplayName("Số Lượng")]
        public int SoLuong { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        public int MaDanhMuc { get; set; }

        public int MaTH { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }

        public virtual ThuongHieu ThuongHieu { get; set; }
    }
}
