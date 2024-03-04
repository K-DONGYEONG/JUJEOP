package com.gudi.jujeop.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.AuthDao;

@Service
public class AuthLogic {
    Logger logger = LoggerFactory.getLogger(AuthLogic.class);

  @Autowired(required = false)
  private AuthDao authDao = null; 

}
