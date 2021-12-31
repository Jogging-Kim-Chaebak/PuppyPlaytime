package com.puppy.admin.extraservice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.extraservice.dao.ExtraServiceDAO;
import com.puppy.common.vo.ExtraServiceVO;

@Service
@Transactional
public class ExtraServiceServiceImpl implements ExtraServiceService {
	
	@Autowired
	private ExtraServiceDAO extraServiceDAO;
	
	@Override
	public List<ExtraServiceVO> extraServiceList(ExtraServiceVO param) {
		List<ExtraServiceVO> list = new ArrayList<ExtraServiceVO>();
		list = extraServiceDAO.extraServiceList(param);
		return list;
	}

	@Override
	public ExtraServiceVO extraServiceDetail(int parseInt) {
		// TODO Auto-generated method stub
		return extraServiceDAO.extraServiceDetail(parseInt);
	}

	@Override
	public int extraServiceAdd(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return extraServiceDAO.extraServiceAdd(svo);
	}

	@Override
	public int extraServiceDisabled(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return extraServiceDAO.extraServiceDisabled(svo);
	}

	@Override
	public int extraServiceAdd2(ExtraServiceVO svo) {
		// TODO Auto-generated method stub
		return extraServiceDAO.extraServiceAdd2(svo);
	}

	@Override
	public List<ExtraServiceVO> extraServiceDetail2(int parseInt) {
		// TODO Auto-generated method stub
		return extraServiceDAO.extraServiceDetail2(parseInt);
	}

}
