package com.puppy.admin.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyVO> replyList(Integer q_no) {
		return session.selectList("replyList", q_no);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		return session.insert("replyInsert", rvo);
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		return session.update("replyUpdate", rvo);
	}

	@Override
	public int replyDelete(int reply_no) {
		return session.delete("replyDelete", reply_no);
	}

}
