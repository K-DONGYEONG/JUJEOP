package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//공지사항게시판
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbNoticeVO {
    private int notice_no;
    private int user_no;
    private String notice_title;
    private String notice_content;
    private String notice_date;
    private int notice_hitcount;
}
