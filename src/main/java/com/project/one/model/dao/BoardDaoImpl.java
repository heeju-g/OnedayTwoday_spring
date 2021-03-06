package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.PagingDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardDto> board_notice_list(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "board_notice_list", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BoardDto> board_qna_list(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "board_qna_list", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<BoardDto> board_notice_search(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "board_notice_search", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<BoardDto> board_qna_search(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "board_qna_search", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<BoardDto> my_qna_list(PagingDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "my_qna_list", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public BoardDto selectOne(int board_no) {
		BoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", board_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int qna_insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "qna_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int notice_insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "notice_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int board_read(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "board_read", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int board_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", board_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int qna_count() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "qna_count");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int notice_count() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "notice_count");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int my_qna_count(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "my_qna_count", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int search_notice_count(PagingDto Pdto) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "search_notice_count", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int search_qna_count(PagingDto Pdto) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "search_qna_count", Pdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
