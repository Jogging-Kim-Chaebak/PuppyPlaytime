package com.puppy.admin.statistics.service;

import java.util.List;
import java.util.Map;

public interface StatisticsService {

	public List<Map<String, Integer>> adminJoinStatistics();

	public List<Map<String, Integer>> adminReservationStatistics();

	public List<Map<String, Integer>> adminSalesStatistics();

	public Map<String, Integer> adminTodayJoinStatistics();

}
