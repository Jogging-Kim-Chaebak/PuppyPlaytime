package com.puppy.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.vo.ReservationVO;
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

	// cage 상세정보 가져오기
	@Override
	public CageRoomVO cageDetail(int c_no) throws Exception {
		return session.selectOne("cageDetail", c_no);
	}

	// 실제 예약 완료
	@Override
	public void requestReservation(ReservationVO rvo) throws Exception {
		session.insert("requestReservation", rvo);
	}

	// 펫 불러오기
	@Override
	public List<PetVO> importPetList(String m_id) throws Exception {
		return session.selectList("importPetList", m_id);
	}

	// 펫 상세 불러오기
	@Override
	public PetVO importPetDetail(String p_no) throws Exception {
		return session.selectOne("importPetDetail", p_no);
	}
}
