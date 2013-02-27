using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SuperAuctions.Domain.Entities
{
    public class Customers
    {
        public int UserId { get; set; }
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
