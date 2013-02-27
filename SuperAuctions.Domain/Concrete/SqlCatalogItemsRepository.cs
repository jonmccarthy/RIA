using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Entities;
using System.Data.Linq;

namespace SuperAuctions.Domain.Concrete
{
    public class SqlCatalogItemsRepository : ICatalogItemsRepository
    {
        private Table<CatalogItem> catalogItemsTable;

        public SqlCatalogItemsRepository(string connectionString)
        {
            catalogItemsTable = (new DataContext(connectionString)).GetTable<CatalogItem>();
        }

        public IQueryable<CatalogItem> CatalogItems
        {
            get { return catalogItemsTable; }
        }
    }
}
