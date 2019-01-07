package com.me.inner.mapper;


import com.me.inner.dto.*;

import java.util.List;

/**
 * Created by Me on 2018/8/18.
 */
public interface SecurityMapper {

    BaseUserDetails getUserByUsername(String username);

    ResourceSecDTO getHomePageByUsername(String username);

    List<RoleSecDTO> listRoleByUsername(String username);

    List<ResourceSecDTO> listResourceByUsername(String username);

    List<Role2ResSecDTO> listRole2Resource();

    RoleSecDTO getRoleByName(String roleName);

    void saveLoginHistory(LoginHistorySecDTO loginHistorySecDTO);

    void saveUser(UserSecDTO user);

    void saveUser2Role(User2RoleSecDTO user2Role);
}
