package com.spring.JspringProject.service;

import java.util.List;

import com.spring.JspringProject.vo.BoardVo;

public interface BoardService {

	int getBoardTotRecCnt();

	List<BoardVo> getBoardList(int startIndexNo, int pageSize);

}
