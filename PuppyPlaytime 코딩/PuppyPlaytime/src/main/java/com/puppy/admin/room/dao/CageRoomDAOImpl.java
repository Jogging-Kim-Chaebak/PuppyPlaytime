package com.puppy.admin.room.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PageRequest;

@Repository
public class CageRoomDAOImpl implements CageRoomDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CageRoomDAOImpl.class);
	
	@Inject
	private SqlSession SqlSession;
	
	private static final String namespace = "query.adminCageroom";
	
	@Override
	public List<CageRoomVO> roomList(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".roomList",pageRequest);
	}

	@Override
	public CageRoomVO roomDetail(int no) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".roomDetail",no);
	}

	@Override
	public int roomAdd(CageRoomVO param) {
		// TODO Auto-generated method stub
		logger.info(param.getC_picture());
		return SqlSession.insert(namespace+".roomAdd",param);
	}

	@Override
	public int roomDisabled(CageRoomVO param) {
		// TODO Auto-generated method stub
		return SqlSession.update(namespace+".roomDisabled",param);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return (Integer)SqlSession.selectOne(namespace + ".roomCnt");
	}

}
