package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbReviewVO {
    private int review_no;
    private int order_no;
    private String review_content;
    private int review_star;
    private String review_date;
}
