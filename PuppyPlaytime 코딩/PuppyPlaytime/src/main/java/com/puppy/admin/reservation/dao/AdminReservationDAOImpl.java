package com.puppy.admin.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PageRequest;

@Repository
public class AdminReservationDAOImpl implements AdminReservationDAO {

	@Inject
	private SqlSession SqlSession;
	
	private static final String namespace = "query.adminReservation";
	
	@Override
	public List<ReservationVO> newReservationList(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".newReservationList",pageRequest);
	}

	@Override
	public List<ReservationVO> reservationList(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".reservationList",pageRequest);
	}

	@Override
	public ReservationVO reservationDetail(int parseInt) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".reservationDetail",parseInt);
	}

	@Override
	public int reservationApproval(ReservationVO param) {
		// TODO Auto-generated method stub
		return SqlSession.update(namespace+".reservationApproval",param);
	}

	@Override
	public int reservationCancel(ReservationVO param) {
		return SqlSession.update(namespace+".reservationCancel",param);
	}
	
	@Override
	public List<ReservationVO> todayReservationList(ReservationVO param) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".todayReservationList",param);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return (Integer)SqlSession.selectOne(namespace + ".reservationCnt");
	}
	
	@Override
	public int count2() {
		// TODO Auto-generated method stub
		return (Integer)SqlSession.selectOne(namespace + ".newReservationCnt");
	}

}
