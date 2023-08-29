package com.ssmcrud.service;

import com.ssmcrud.bean.Employee;
import com.ssmcrud.bean.EmployeeExample;
import com.ssmcrud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service   //业务逻辑组件
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工带部门信息
     */
    public List<Employee> getAll() {
        // TODO Auto-generated method stub
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 员工保存
     */
    public void saveEmp(Employee employee) {
        // TODO Auto-generated method stub
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检验用户名是否可用  true返回当前姓名可用
     */
    public boolean checkUser(String empName) {
        // TODO Auto-generated method stub
        EmployeeExample example = new EmployeeExample();
        //创建一个规则：员工的名字必须等于给定的值，如果有返回记录数
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * 按照员工id查询员工
     */
    public Employee getEmp(Integer id) {
        // TODO Auto-generated method stub
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * 员工更新
     */
    public void updateEmp(Employee employee) {
        // TODO Auto-generated method stub
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 员工删除
     */
    public void deleteEmp(Integer id) {
        // TODO Auto-generated method stub
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        // TODO Auto-generated method stub
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }

}
