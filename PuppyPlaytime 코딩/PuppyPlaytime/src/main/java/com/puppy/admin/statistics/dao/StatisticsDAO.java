package com.puppy.admin.statistics.dao;

import java.util.List;
import java.util.Map;

public interface StatisticsDAO {

	public List<Map<String, String>> adminJoinStatistics();

	public List<Map<String, String>> adminReservationStatistics();

	public List<Map<String, String>> adminSalesStatistics();

	public int adminTodayJoinStatistics();

}
