package com.dvt.service;

import com.dvt.pojos.Permission;

import java.util.List;

public interface IPermissionService extends IGenericsServevice<Permission>{
    public Permission getPerByName(String perName);
    public Permission getPerById(String perId);
}
