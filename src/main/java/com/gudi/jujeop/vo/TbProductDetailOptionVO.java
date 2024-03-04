package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//상품옵션
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbProductDetailOptionVO {
    private int product_no;
    private String option_product;
    private int option_count;
    private int option_price;
}
