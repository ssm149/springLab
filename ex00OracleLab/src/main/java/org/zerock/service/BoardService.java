package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	List<BoardVO> selectBoardList() throws Exception;
}
