package com.puppy.admin.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.reply.dao.ReplyDao;
import com.puppy.admin.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	//리스트불러오기
	@Override
	public List<ReplyVO> replyList(Integer q_no) {
		List<ReplyVO> myList = null;
		myList = replyDao.replyList(q_no);
		return myList;
	}

	// 댓글 입력
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		try{
			result = replyDao.replyInsert(rvo);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 댓글 수정
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		try{
			result = replyDao.replyUpdate(rvo);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	//댓글 삭제
	@Override
	public int replyDelete(int reply_no) {
		int result = 0;
		try{
			result = replyDao.replyDelete(reply_no);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
