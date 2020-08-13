package com.windy.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import com.windy.vo.*;




public class DAO {
	static SqlSessionFactory sqlfactory;
	private static DAO instance;
	
	public static DAO getinstance() {
		if(instance==null) {
			synchronized (DAO.class) {
				instance = new DAO();
			}
		}
		return instance;
	}
	
	public static SqlSessionFactory getConn(){
		try {
			Reader reader = Resources.getResourceAsReader("com/windy/dao/mybatis-config.xml");
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlfactory;
	}

	public static User sid(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		User user = sqlsession.selectOne("sid",id);
		sqlsession.close();
		return user;
	}
	
	public static User snick(String nick) {
		SqlSession sqlsession = sqlfactory.openSession();
		User user = sqlsession.selectOne("snick",nick);
		sqlsession.close();
		return user;
	}
	
	public static List<Board> boardlist(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board> boardl = sqlsession.selectList("boardlist",page);
		sqlsession.close();
		return boardl;
	}
	
	public static User login(User user) {
		SqlSession sqlsession = sqlfactory.openSession();
		User user1 = sqlsession.selectOne("login",user);
		sqlsession.close();
		return user1;
	}
	
	public static List<Board> boardlists(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board> boardl = sqlsession.selectList("boardlists",page);
		sqlsession.close();
		return boardl;
	}
	
	public static Board view(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		Board board1 = sqlsession.selectOne("view", board);
		sqlsession.close();
		return board1;
	}
	
	public static int count(String board_num) {
		SqlSession sqlsession = sqlfactory.openSession();
		int nop = sqlsession.selectOne("count", board_num);
		sqlsession.close();
		return nop;
	}
	
	public static int csearch(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		int nop = sqlsession.selectOne("csearch", page);
		sqlsession.close();
		return nop;
	}
	
	public static int join(User user) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("join",user);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static int ins(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("ins",board);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static int boarddel(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.delete("boarddel", board);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static String writerchk(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		String writer = sqlsession.selectOne("writerchk", board);
		sqlsession.close();
		return writer;
	}

	public static int boardupd(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.update("boardupd", board);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static int boardviewupd(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.update("boardviewupd", board);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static int boardgoodupd(Board board) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.update("boardgoodupd", board);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static List<Product> BproductList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> Bproductlist = sqlsession.selectList("Bproductlist");
		sqlsession.close();
		return Bproductlist;
	}
	public static Product productdetail(String p_code) {
		SqlSession sqlsession = sqlfactory.openSession();
		Product detail = sqlsession.selectOne("productdetail", p_code);
		sqlsession.close();
		return detail;
	}
	public static List<Product> option(String p_code) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> sm = sqlsession.selectList("option", p_code);
		sqlsession.close();
		return sm;
	}
	public static User getUserinfo(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		User info = sqlsession.selectOne("mypage_user_info_select" , id);
		sqlsession.close();
		return info;
		
	}

	public static List<Product> productList(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> list = sqlsession.selectList("productlist", page);
		sqlsession.close();
		return list;
	}
	
	public static int paging(String p_kind) {
		SqlSession sqlsession = sqlfactory.openSession();
		int x = sqlsession.selectOne("paging", p_kind);
		sqlsession.close();
		return x;
	}
	
	public static List<Event> EventList() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Event> EventList = sqlsession.selectList("EventList");
		sqlsession.close();
		return EventList;

	}
	
}
