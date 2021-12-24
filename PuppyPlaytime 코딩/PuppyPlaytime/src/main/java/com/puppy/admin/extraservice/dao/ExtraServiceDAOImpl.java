package com.puppy.admin.extraservice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.common.vo.ExtraServiceVO;

@Repository
public class ExtraServiceDAOImpl implements ExtraServiceDAO {

	@Inject
	private SqlSession SqlSession;
	
	private static final String namespace = "com.puppy.admin.extraservice.dao.ExtraServiceDAO";
	
	@Override
	public List<ExtraServiceVO> extraServiceList(ExtraServiceVO param) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".extraServiceList",param);
	}

	@Override
	public ExtraServiceVO extraServiceDetail(int parseInt) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".extraServiceDetail",parseInt);
	}

	@Override
	public int extraServiceAdd(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.insert(namespace+".extraServiceAdd",svo);
	}

	@Override
	public int extraServiceDisabled(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.update(namespace+".extraServiceDisabled",svo);
	}

	@Override
	public int extraServiceAdd2(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.insert(namespace+".extraServiceAdd2",svo);
	}

	@Override
	public List<ExtraServiceVO> extraServiceDetail2(int parseInt) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".extraServiceDetail2",parseInt);
	}

}
