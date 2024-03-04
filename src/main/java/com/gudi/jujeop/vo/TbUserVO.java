package com.gudi.jujeop.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//회원정보
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TbUserVO {
    private int user_no;                
    private String user_id;                       
    private String user_name;
    private String user_phone;
    private String user_email;
    private String user_address;
    private String user_address_detail;
    private String user_birth;
    private String user_gender;
    private String user_admin;
}
