package com.puppy.admin.statistics.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAOImpl implements StatisticsDAO {

	private static final String namespace = "query.statistics";
	
	@Inject
	private SqlSession SqlSession;
	
	@Override
	public List<Map<String, Integer>> adminJoinStatistics() {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".adminJoinStatistics","");
	}

	@Override
	public List<Map<String, Integer>> adminReservationStatistics() {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".adminReservationStatistics","");
	}

	@Override
	public List<Map<String, Integer>> adminSalesStatistics() {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".adminSalesStatistics","");
	}

	@Override
	public Map<String, Integer> adminTodayJoinStatistics() {
		// TODO Auto-generated method stub
		return SqlSession.selectMap(namespace+".adminTodayJoinStatistics","");
	}

}
