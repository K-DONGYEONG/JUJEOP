package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//문의게시판댓글
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbCommentVO {
    private int c_no;
    private int qna_no;
    private String c_date;
    private String c_content;
}
