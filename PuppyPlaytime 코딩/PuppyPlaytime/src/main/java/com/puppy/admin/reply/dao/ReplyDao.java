package com.puppy.admin.reply.dao;

import java.util.List;

import com.puppy.admin.reply.vo.ReplyVO;

public interface ReplyDao {

	public List<ReplyVO> replyList(Integer q_no);

	public int replyInsert(ReplyVO rvo);

	public int replyUpdate(ReplyVO rvo);

	public int replyDelete(int reply_no);

}
