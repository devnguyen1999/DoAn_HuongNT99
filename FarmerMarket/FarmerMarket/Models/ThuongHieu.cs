namespace FarmerMarket.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuongHieu")]
    public partial class ThuongHieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuongHieu()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        public int MaTH { get; set; }

        [DisplayName("Tên Thương Hiệu")]
        [Required(ErrorMessage = "Tên thương hiệu không được để trống")]
        [StringLength(150)]
        public string TenThuongHieu { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
