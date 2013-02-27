using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperAuctions.Domain.Abstract;
using SuperAuctions.Domain.Entities;
using System.Data.Linq;

namespace SuperAuctions.Domain.Concrete
{
    public class SqlAuctionsRepository : IAuctionsRepository
    {
        private Table<Auction> auctionsTable;

        public SqlAuctionsRepository (string connectionString)
        {
            auctionsTable = (new DataContext(connectionString)).GetTable<Auction>();
        }

        public IQueryable<Auction> Auctions
        {
            get { return auctionsTable; }
        }
    }
}
