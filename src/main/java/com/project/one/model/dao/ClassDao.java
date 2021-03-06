package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.StorePagingDto;

public interface ClassDao {

	String NAMESPACE = "class.";
	
	public List<ClassDto> selectList();
	
	public List<ClassDto> totalList();
	
	public List<ClassDto> classList(PagingDto pDto);
	
	public List<ClassDto> classListPaging(PagingDto pDto);
	
	public List<ClassDto> classListSearch(PagingDto pDto);
	
	public List<ClassDto> main_selectList();
	
	public List<ClassDto> categoryListPaging(PagingDto pDto); 
	
	public List<ClassDto> selectfile(int class_no);
	
	public ClassDto selectOne(int class_no);
	
	public ClassDto selectOneByTitle(String class_title);
	
	public int insert(ClassDto dto);
	
	public int class_location(ClassDto dto);
	
	public int update(ClassDto dto);
	
	public int updateSale(ClassDto dto);
	
	public int delete(int class_no);

	public int classListCount();
	
	public int myClassCount(String member_id);
	
	public int classcategoryCount(String class_category);
	
	public int classSearchCount(PagingDto pDto);
	
	public List<ClassDto> searchedList(String search_keyword);
	
	public List<ClassDto> myClassList(PagingDto pDto);
}
