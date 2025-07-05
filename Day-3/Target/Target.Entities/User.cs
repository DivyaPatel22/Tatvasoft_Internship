using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Target.Entities
{
    [Table ("User")]
    public class User : Base
    {
        [Key]
        [Column ("id")]
        public int ID { get; set; }

        [Column("name")]
        public string Name { get; set; }

        [Column("age")]
        public int age { get; set; }

        [Column("email")]
        public string Email { get; set; }

        [Column("user_type")]
        public string UserType { get; set; }

    }
}
