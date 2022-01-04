package com.puppy.common.graph;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.puppy.common.file.FileUploadUtil;

public class ChartMake {
	public static Logger log = LoggerFactory.getLogger(ChartMake.class);
	
	// 월별 가입자 수
	public static void barJoinChart(List<Map<String, String>> resultList) {
		String docRoot = "C:\\PuppyPlaytimeRepository\\graph\\";
		FileUploadUtil.makeDir(docRoot);
		log.info("업로드할 파일 경로(docRoot) : " + docRoot);
		
		File file = new File(docRoot + "/barJoinChart.jpg");
		FileOutputStream fos = null;
		
		try {
			// 데이터로 사용할 카테고리 데이터 셋을 생성
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			
			for(int i=0; i<resultList.size(); i++) {
				// [Map 객체 를 넣기 시작한다.]
				Map<String, String> treemap = new TreeMap<String, String>();
				treemap = resultList.get(i);
				
				log.info("treeMap : " + treemap.toString());
				
				int joinCount;
				String joinDate;
				
				// 데이터 입력 (값, 범례, 카테고리)
				joinCount = Integer.parseInt(treemap.get("joinCount"));
				joinDate = treemap.get("joinDate");
				
				//System.out.println(joinCount + " " + joinDate);
				
				dataset.addValue(joinCount, "해당 월", joinDate);
			}
			
			// createBarChart(chart title, domain axis label, range axis label, data, orientation, include legend, tooltips, URLS)
			JFreeChart chart = ChartFactory.createBarChart("월별 가입자 수", "해당 월", "가입자 수", dataset, PlotOrientation.VERTICAL, false, true, false);
		
			chart.setBackgroundPaint(Color.white);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sansserif", Font.BOLD, 12);
			//chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			// X축 라벨
			plot.getDomainAxis().setLabelFont(font);		// 해당 월
			// Y축 도메인
			plot.getDomainAxis().setTickLabelFont(font); 	// 월 나열
			// Y축 라벨
			plot.getRangeAxis().setLabelFont(font); 		// 매출액
			// Y축 범위
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			ChartUtilities.writeChartAsJPEG(fos, chart, 500, 280);
		}catch(Exception e) {
			e.getMessage();
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException e) {
				e.getMessage();
			}
		}
	}

	// 월별 매출액 수
	public static void barSalesChart(List<Map<String, String>> resultList) {
		String docRoot = "C:\\PuppyPlaytimeRepository\\graph\\";
		FileUploadUtil.makeDir(docRoot);
		log.info("업로드할 파일 경로(docRoot) : " + docRoot);
		
		File file = new File(docRoot + "/barSalesChart.jpg");
		FileOutputStream fos = null;
		
		try {
			// 데이터로 사용할 카테고리 데이터 셋을 생성
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			
			for(int i=0; i<resultList.size(); i++) {
				// [Map 객체 를 넣기 시작한다.]
				Map<String, String> treemap = new TreeMap<String, String>();
				treemap = resultList.get(i);
				
				log.info("treeMap : " + treemap.toString());
				
				int salesPrice;
				String salesDate;
				
				// 데이터 입력 (값, 범례, 카테고리)
				salesPrice = Integer.parseInt(treemap.get("salesPrice"));
				salesDate = treemap.get("salesDate");
							
				dataset.addValue(salesPrice, "해당 월", salesDate);
			}
			
			// createBarChart(chart title, domain axis label, range axis label, data, orientation, include legend, tooltips, URLS)
			JFreeChart chart = ChartFactory.createBarChart("월별 매출액", "해당 월", "매출액", dataset, PlotOrientation.VERTICAL, false, true, false);
		
			chart.setBackgroundPaint(Color.white);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sansserif", Font.BOLD, 12);
			//chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			// X축 라벨
			plot.getDomainAxis().setLabelFont(font);		// 해당 월
			// Y축 도메인
			plot.getDomainAxis().setTickLabelFont(font); 	// 월 나열
			// Y축 라벨
			plot.getRangeAxis().setLabelFont(font); 		// 매출액
			// Y축 범위
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			ChartUtilities.writeChartAsJPEG(fos, chart, 500, 280);
		}catch(Exception e) {
			e.getMessage();
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException e) {
				e.getMessage();
			}
		}
	}
	
	// 월별 예약 수
	public static void barReservationChart(List<Map<String, String>> resultList) {
		String docRoot = "C:\\PuppyPlaytimeRepository\\graph\\";
		FileUploadUtil.makeDir(docRoot);
		log.info("업로드할 파일 경로(docRoot) : " + docRoot);
		
		File file = new File(docRoot + "/barReservationChart.jpg");
		FileOutputStream fos = null;
		
		try {
			// 데이터로 사용할 카테고리 데이터 셋을 생성
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			
			for(int i=0; i<resultList.size(); i++) {
				// [Map 객체 를 넣기 시작한다.]
				Map<String, String> treemap = new TreeMap<String, String>();
				treemap = resultList.get(i);
				
				log.info("treeMap : " + treemap.toString());
				
				int reservationCount;
				String reservationDate;
				
				// 데이터 입력 (값, 범례, 카테고리)
				reservationCount = Integer.parseInt(treemap.get("reservationCount"));
				reservationDate = treemap.get("reservationDate");
							
				dataset.addValue(reservationCount, "해당 월", reservationDate);
			}
			
			// createBarChart(chart title, domain axis label, range axis label, data, orientation, include legend, tooltips, URLS)
			JFreeChart chart = ChartFactory.createBarChart("월별 예약 수", "해당 월", "예약 수", dataset, PlotOrientation.VERTICAL, false, true, false);
		
			chart.setBackgroundPaint(Color.white);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sansserif", Font.BOLD, 12);
			//chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			// X축 라벨
			plot.getDomainAxis().setLabelFont(font);		// 해당 월
			// Y축 도메인
			plot.getDomainAxis().setTickLabelFont(font); 	// 월 나열
			// Y축 라벨
			plot.getRangeAxis().setLabelFont(font); 		// 매출액
			// Y축 범위
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			ChartUtilities.writeChartAsJPEG(fos, chart, 500, 280);
		}catch(Exception e) {
			e.getMessage();
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException e) {
				e.getMessage();
			}
		}
	}
	
	/* 통계 예제
	public static void barChart(Map<String, Integer> resultMap, int number) {
		String docRoot = "C:\\PuppyPlaytimeRepository\\graph\\";
		System.out.println(docRoot);
		FileUploadUtil.makeDir(docRoot);
		log.info("업로드할 파일 경로(docRoot) : " + docRoot);
		
		File file = new File(docRoot + "/barChart" +number + ".jpg");
		FileOutputStream fos = null;
		
		try {
			// 데이터로 사용할 카테고리 데이터 셋을 생성
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			for(Map.Entry<String, Integer> result : resultMap.entrySet()) {
				log.info(result.getKey() + " = " + result.getValue());
				dataset.addValue(result.getValue(), result.getKey(), result.getKey());
			}
			
			JFreeChart chart = ChartFactory.createBarChart("월별 매출액", "해당 월", "매출액", dataset, PlotOrientation.VERTICAL, true, true, false);
		
			chart.setBackgroundPaint(Color.white);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sansserif", Font.BOLD, 12);
			chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			// X축 라벨
			plot.getDomainAxis().setLabelFont(font);		// 해당 월
			// Y축 도메인
			plot.getDomainAxis().setTickLabelFont(font); 	// 월 나열
			// Y축 라벨
			plot.getRangeAxis().setLabelFont(font); 		// 매출액
			// Y축 범위
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			ChartUtilities.writeChartAsJPEG(fos, chart, 500, 280);
		}catch(Exception e) {
			e.getMessage();
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException e) {
				e.getMessage();
			}
		}
	}*/
}
