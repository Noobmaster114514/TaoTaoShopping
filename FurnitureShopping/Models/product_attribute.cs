//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace FurnitureShopping.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class product_attribute
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product_attribute()
        {
            this.shop_car = new HashSet<shop_car>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public Nullable<decimal> price { get; set; }
        public Nullable<int> pid { get; set; }
        public string attrimg { get; set; }
        public string attristock { get; set; }
    
        public virtual shopping shopping { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<shop_car> shop_car { get; set; }
    }
}