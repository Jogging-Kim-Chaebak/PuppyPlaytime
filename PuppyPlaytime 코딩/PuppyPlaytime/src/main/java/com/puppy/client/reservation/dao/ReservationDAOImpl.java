package com.puppy.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PetVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSession session;
	
	// 룸 리스트 띄워주기
	@Override
	public List<CageRoomVO> listRoom() throws Exception {
		return session.selectList("listRoom");
	}

	// 상세 예약 창에서 펫 등록
	@Override
	public void petRegister(PetVO pvo) throws Exception {
		session.insert("petRegister", pvo);
	}
}
