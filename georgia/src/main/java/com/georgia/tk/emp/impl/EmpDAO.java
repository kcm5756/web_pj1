package com.georgia.tk.emp.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.georgia.tk.emp.EmpVO;

@Repository
public class EmpDAO {
	@Autowired
	public SqlSessionTemplate mybatis;

	public List<EmpVO> empList(EmpVO empVO) {
		return mybatis.selectList("empDAO.empList", empVO);
	}

	public List<EmpVO> empList(Map<String, Object> empSearchMap) {
		return mybatis.selectList("empDAO.empSearchList", empSearchMap);
	}

	public EmpVO empDetail(int empId) {
		return mybatis.selectOne("empDAO.empDetail", empId);
	}

	public void empCreate(EmpVO empVO) {
		mybatis.insert("empDAO.empCreate", empVO);
	}

	public void empUpdate(EmpVO empVO) {
		mybatis.insert("empDAO.empUpdate", empVO);
	}

	public void empDelete(int empId) {
		mybatis.insert("empDAO.empDelete", empId);
	}

	public int empListCount() {
		return mybatis.selectOne("empDAO.empListCount");
	}
	
	public int empSearchCount(Map<String, Object> empSearchMap) {
		return mybatis.selectOne("empDAO.empSearchCount", empSearchMap);
	}
}
