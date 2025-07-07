using Login_API.Data;
using Microsoft.EntityFrameworkCore;


namespace Login_API
{
    public class ApplicationDBConetext
    {
        public class ApplicationDbContext : IdentityDbContext
        {
            public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        }
    }

}
