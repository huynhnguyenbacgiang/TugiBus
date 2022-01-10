package com.dvt.repository;


import com.dvt.pojos.Permission;

import java.util.List;

public interface IPermissionRepository extends IGenericsRepository<Permission>{
    public Permission getPerByName(String perName);
    public Permission getPerById(String perId);
}
