package com.me.inner.service;


import com.me.inner.dto.BaseUserDetails;
import com.me.inner.dto.LoginHistorySecDTO;
import com.me.inner.dto.Role2ResSecDTO;

import java.util.List;

/**
 * Created by Me on 2018/8/18.
 */
public interface SecurityService {

    BaseUserDetails getUserByUsername(String username);

    List<Role2ResSecDTO> listRole2Resource();

    void saveLoginHistory(LoginHistorySecDTO loginHistory);
}
