using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Entities;
using System.Data.Linq;

namespace SuperAuctions.Domain.Concrete
{
    public class SqlItemPhotosRepository : IItemPhotoRepository
    {
        private Table<ItemPhoto> itemPhotosTable;

        public SqlItemPhotosRepository(string connectionString)
        {
            itemPhotosTable = (new DataContext(connectionString)).GetTable<ItemPhoto>();
        }

        public IQueryable<ItemPhoto> ItemPhotos
        {
            get { return itemPhotosTable; }
        }
    }
}
