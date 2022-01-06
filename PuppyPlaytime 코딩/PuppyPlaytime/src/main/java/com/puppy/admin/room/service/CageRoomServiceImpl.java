package com.puppy.admin.room.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.dao.CageRoomDAO;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PageRequest;

@Service
@Transactional
public class CageRoomServiceImpl implements CageRoomService {

	private static final Logger logger = LoggerFactory.getLogger(CageRoomServiceImpl.class);
	
	@Autowired
	private CageRoomDAO cageRoomDAO;
	
	@Override
	public List<CageRoomVO> roomList(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		List<CageRoomVO> list = new ArrayList<CageRoomVO>();
		list = cageRoomDAO.roomList(pageRequest);
		return list;
	}

	@Override
	public CageRoomVO roomDetail(int no) {
		// TODO Auto-generated method stub
		return cageRoomDAO.roomDetail(no);
	}

	@Override
	public int roomAdd(CageRoomVO param) {
		// TODO Auto-generated method stub
		logger.info(param.getC_picture());
		return cageRoomDAO.roomAdd(param);
	}

	@Override
	public int roomDisabled(CageRoomVO param) {
		// TODO Auto-generated method stub
		return cageRoomDAO.roomDisabled(param);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return cageRoomDAO.count();
	}

}
