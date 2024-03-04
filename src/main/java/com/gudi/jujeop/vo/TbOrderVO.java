package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//주문정보
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbOrderVO {
    private int order_no;
    private int user_no;
    private int product_no;
    private int order_total;
    private String order_comment;
    private String order_date;
    private String res_name;
    private String res_phone;
    private String res_adderss;
    private String res_address_detail;
}
