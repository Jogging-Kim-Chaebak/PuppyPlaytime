package com.puppy.admin.reply.service;

import java.util.List;

import com.puppy.admin.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(Integer q_no);

	public int replyInsert(ReplyVO rvo);

	public int replyUpdate(ReplyVO rvo);

	public int replyDelete(int reply_no);

}
