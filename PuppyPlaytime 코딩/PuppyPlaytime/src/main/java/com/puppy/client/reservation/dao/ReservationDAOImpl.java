package com.puppy.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.client.reservation.vo.ReserveDate;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PetVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSession session;
	
	// 룸 리스트 띄워주기
	@Override
	public List<CageRoomVO> listRoom(ReserveDate rDate) throws Exception {
		return session.selectList("listRoom", rDate);
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
	public PetVO importPetDetail(int p_no) throws Exception {
		return session.selectOne("importPetDetail", p_no);
	}

	// 아무 펫 한마리 불러오기
	@Override
	public PetVO importOnePet(String m_id) throws Exception {
		return session.selectOne("importOnePet", m_id);
	}

	// 부가서비스 띄워주기
	@Override
	public List<ExtraServiceVO> listExtraService(int c_no) throws Exception {
		return session.selectList("listExtraService", c_no);
	}

	// 예약 룸 건수를 반환한다.
	@Override
	public int roomCount(ReserveDate rDate) throws Exception {
		return session.selectOne("roomCount", rDate);
	}

	// 펫 무게 받아오기
	@Override
	public String getPetWeight(int p_no) throws Exception {
		return session.selectOne("getPetWeight", p_no);
	}
}
