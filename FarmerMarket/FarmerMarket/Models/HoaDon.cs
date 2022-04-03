namespace FarmerMarket.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        [DisplayName("Mã hóa đơn")]
        public int MaHoaDon { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Trạng thái")]
        public string TrangThai { get; set; }

        [Column(TypeName = "money")]
        [DisplayFormat(DataFormatString = "{0:#,###}")]
        [DisplayName("Phí vận chuyển")]
        public decimal PhiShip { get; set; }

        [Column(TypeName = "ntext")]
        [DisplayName("Ghi chú")]
        public string ChuY { get; set; }

        [StringLength(255)]
        [DisplayName("Địa chỉ nhận hàng")]
        public string DiaChi { get; set; }

        [DisplayName("Ngày đặt")]
        public DateTime NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        [DisplayName("Mã giỏ hàng")]
        public int MaGioHang { get; set; }

        public virtual GioHang GioHang { get; set; }
    }
}
