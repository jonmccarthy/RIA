using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Entities;
using System.Data.Linq;

namespace SuperAuctions.Domain.Concrete
{
    public class SqlItemVideosRepository : IItemVideoRepository
    {
        private Table<ItemVideo> itemVideosTable;

        public SqlItemVideosRepository(string connectionString)
        {
            itemVideosTable = (new DataContext(connectionString)).GetTable<ItemVideo>();
        }

        public IQueryable<ItemVideo> ItemVideos
        {
            get { return itemVideosTable; }
        }
    }
}
