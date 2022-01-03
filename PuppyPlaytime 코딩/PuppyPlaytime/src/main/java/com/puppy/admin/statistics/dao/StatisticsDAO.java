package com.puppy.admin.statistics.dao;

import java.util.List;
import java.util.Map;

public interface StatisticsDAO {

	public List<Map<String, Integer>> adminJoinStatistics();

	public Map<String, Integer> adminReservationStatistics();

	public Map<String, Integer> adminSalesStatistics();

	public Map<String, Integer> adminTodayJoinStatistics();

}
