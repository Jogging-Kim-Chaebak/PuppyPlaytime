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
	
	public static void barJoinChart(List<Map<String, Integer>> resultList) {
		String docRoot = "C:\\PuppyPlaytimeRepository\\graph\\";
		
		log.info("업로드할 파일 경로(docRoot) : " + docRoot);
		
		File file = new File(docRoot + "/barJoinChart.jpg");
		FileOutputStream fos = null;
		
		try {
			// 데이터로 사용할 카테고리 데이터 셋을 생성
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			
			for(int i=0; i<resultList.size(); i++) {
				// [Map 객체 를 넣기 시작한다.]
				Map<String, Integer> treemap = new TreeMap<String, Integer>(resultList.get(i));
				log.info("treeMap : " + treemap.toString());
				System.out.println("treeMap : " + treemap.toString());
			
				// 데이터 입력 (값, 범례, 카테고리)
				//dataset.addValue(treemap.getValue(), result.getKey(), result.getKey());
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
	}
	
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
	}
}
