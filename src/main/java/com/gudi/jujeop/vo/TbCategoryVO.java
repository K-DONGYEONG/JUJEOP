package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카테고리
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbCategoryVO {
    private int category_no;
    private String category_name;
}
