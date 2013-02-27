using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.ComponentModel.DataAnnotations;

namespace SuperAuctions.Domain.Entities
{
    [Table(Name = "SaleDetails")]
    public class Auction
    {
        [ScaffoldColumn(false)]
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int SaleId { get; set; }

        [Column] public string SaleName { get; set; }
        [Column] public string SaleType { get; set; }
        [Column] public string SaleLocation { get; set; }
        [Column] public DateTime SaleDate { get; set; }
        [Column] public string SaleTime { get; set; }
        [Column] public string ViewingCentre { get; set; }
        [Column] public double PriceAchieved { get; set; }
    }
}
