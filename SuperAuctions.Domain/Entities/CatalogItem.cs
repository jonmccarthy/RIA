using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.ComponentModel.DataAnnotations;

namespace SuperAuctions.Domain.Entities
{
    [Table(Name = "CatalogItems")]
    public class CatalogItem
    {
        [ScaffoldColumn(false)]
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int CatalogItemsId { get; set; }
        [Column] public string Category { get; set; }
        [Column] public int SaleID { get; set; }
        [Column] public int LotNum { get; set; }
        [Column] public string ItemName { get; set; }
        [Column] public string PriceEstimate { get; set; }
        [Column] public string LotDescription { get; set; }
        [Column] public string ConditionReport { get; set; }
        [Column] public string Provenance { get; set; }
        [Column] public string Exhibited { get; set; }
        [Column] public string DeptInfo { get; set; }
        [Column] public double PriceAchieved { get; set; }
        [Column] public DateTime SaleDate { get; set; }
    }
}
