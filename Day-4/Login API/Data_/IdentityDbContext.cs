using Microsoft.EntityFrameworkCore;

namespace Login_API.Data
{
    public class IdentityDbContext
    {
        private DbContextOptions<ApplicationDBConetext.ApplicationDbContext> options;

        public IdentityDbContext(DbContextOptions<ApplicationDBConetext.ApplicationDbContext> options)
        {
            this.options = options;
        }
    }
}