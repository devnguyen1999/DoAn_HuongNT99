using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FarmerMarket.Models
{
    public partial class FarmerMarketDB : DbContext
    {
        public FarmerMarketDB()
            : base("name=FarmerMarketDB")
        {
        }

        public virtual DbSet<ChiTietGioHang> ChiTietGioHangs { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<GioHang> GioHangs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<LienHe> LienHes { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThuongHieu> ThuongHieux { get; set; }
        public virtual DbSet<TinTuc> TinTucs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietGioHang>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<DanhMuc>()
                .HasMany(e => e.SanPhams)
                .WithRequired(e => e.DanhMuc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<GioHang>()
                .HasMany(e => e.ChiTietGioHangs)
                .WithRequired(e => e.GioHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<GioHang>()
                .HasMany(e => e.HoaDons)
                .WithRequired(e => e.GioHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.PhiShip)
                .HasPrecision(18, 0);

            modelBuilder.Entity<PhanHoi>()
                .Property(e => e.SoDT)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietGioHangs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.SoDienThoai)
                .IsFixedLength();

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.GioHangs)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.TinTucs)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThuongHieu>()
                .HasMany(e => e.SanPhams)
                .WithRequired(e => e.ThuongHieu)
                .WillCascadeOnDelete(false);
        }
    }
}
