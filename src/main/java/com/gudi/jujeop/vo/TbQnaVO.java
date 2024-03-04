package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//문의게시판
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbQnaVO {
    private int qna_no;
    private int user_no;
    private String qna_title;
    private String qna_content;
    private String qna_date;
    private int qna_hitcount;

}
