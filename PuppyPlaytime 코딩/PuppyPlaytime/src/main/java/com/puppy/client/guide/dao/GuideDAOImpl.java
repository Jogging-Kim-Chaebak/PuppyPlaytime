package com.puppy.client.guide.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.ExtraServiceVO;



@Repository
public class GuideDAOImpl implements GuideDAO {

	private static final String namespace = "query.guide";
	
	@Autowired
	private SqlSession session;
	
	//룸리스트 구현
	@Override
	public List<CageRoomVO> roomList(CageRoomVO param) throws Exception {
		
		return session.selectList(namespace+".roomList",param);
	}
	
	
	  //부가서비스 리스트 구현
	  
	  @Override 
	  public List<ExtraServiceVO> extraList() throws Exception {
	  
	    return session.selectList(namespace+".extraServiceList");
	 }

	 //룸 상세페이지 구현
	@Override
	public CageRoomVO roomDetail(int no) throws Exception {
		
		return session.selectOne(namespace+".roomDetail",no);
	}
	 
}
