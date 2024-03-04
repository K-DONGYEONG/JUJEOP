package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbProductVO {
    private int product_no;
    private int category_no;
    private String product_name;
    private int product_price;
    private int product_count;
    private String product_content;
    private String product_tag;
    private String product_image;
}
