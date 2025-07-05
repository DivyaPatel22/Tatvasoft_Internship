using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Target.Entities.Context
{
    internal class targetDBContex : DbContext

    {
        public targetDBContex(DbContextOptions<targetDBContex> options) : base(options) { }

        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            AppContext.SetSwitch("Npgsql.EnableLegancyTimestampBehaviour", true);
            modelBuilder.Entity<User>().HasData(new User()
            {
                ID = 1,
                Name = "Chhota Bheem",
                age = 30,
                Email = "b123@gmail",
                UserType = "admin",
                CreatedDate = DateTime.Now,

            });
            base.OnModelCreating(modelBuilder);
        }
    }
}
