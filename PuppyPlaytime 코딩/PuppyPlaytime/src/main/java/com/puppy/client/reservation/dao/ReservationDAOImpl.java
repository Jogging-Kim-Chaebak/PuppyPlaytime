package com.puppy.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CageRoomVO> listRoom() throws Exception {
		return session.selectList("listRoom");
	}
}
