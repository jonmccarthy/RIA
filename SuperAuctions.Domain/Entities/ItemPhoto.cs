using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.ComponentModel.DataAnnotations;

namespace SuperAuctions.Domain.Entities
{
    [Table(Name = "ItemPhotos")]
    public class ItemPhoto
    {
        [ScaffoldColumn(false)]
        [Column(IsPrimaryKey = true, IsDbGenerated = true, AutoSync = AutoSync.OnInsert)]
        public int ItemPhotos { get; set; }
        [Column] public int CatalogItemsId { get; set; }
        [Column] public string Photo { get; set; }
    }
}
