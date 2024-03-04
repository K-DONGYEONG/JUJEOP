package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//결제
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbPayVO {
    private int pay_no;
    private int order_no;
    private String pay_method;
    private String pay_date;
    private int pay_price;
}
