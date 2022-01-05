package com.puppy.admin.statistics.service;

import java.util.List;
import java.util.Map;

public interface StatisticsService {

	public List<Map<String, String>> adminJoinStatistics();

	public List<Map<String, String>> adminReservationStatistics();

	public List<Map<String, String>> adminSalesStatistics();

	public int adminTodayJoinStatistics();

}
