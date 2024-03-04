package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//장바구니
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbCartVO {
    private int cart_no;
    private int user_no;
    private int product_no;
    private int cart_count;
}
