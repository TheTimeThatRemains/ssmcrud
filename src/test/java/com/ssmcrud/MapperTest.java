package com.ssmcrud;

import com.ssmcrud.bean.Department;
import com.ssmcrud.bean.Employee;
import com.ssmcrud.dao.DepartmentMapper;
import com.ssmcrud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/*
 * 测试dao层的工作：
 * 推荐Spring的项目可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1，导入spring-test模块
 * 2，@ContextConfiguration注解指定Spring配置文件的位置
 * 3,直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)  //指定单元测试的模块
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    //测试Departmentmapper
    @Test
    public void testCRUD(){

        //一、原生测试方法
//        //1,创建springIOC容器
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //2,从容器中获取mapper
//        DepartmentMapper ben = ioc.getBean(DepartmentMapper.class);

        //二、spring单元测试，可自动注入需要的组件

        System.out.println(departmentMapper);

        //1、插入几个部门

//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //2、生成员工数据，测试员工插入

//        employeeMapper.insertSelective(new Employee(null,"jerry","F","jerry@qq.com",2));

        //3、批量插入多个员工，使用可以执行批量操作的sqlsession

        //获取EmployeeMapper接口实现类的对象
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//
//        for(int i=0;i<300;i++){
//
//            String uid = UUID.randomUUID().toString().substring(0,5)+i;
//            mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
//        }
//        System.out.println("批量添加员工成功");
    }
}
