package com.windy.dao;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import com.windy.vo.*;




public class DAO {
	static SqlSessionFactory sqlfactory;
	private static DAO instance;
	
	static Date date = new Date();
	
	static SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
	static String time = format.format(date);
	
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
	
	public static List<Product> BproductList_r() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> Bproductlist_r = sqlsession.selectList("Bproductlist_r","road");
		sqlsession.close();
		return Bproductlist_r;
	}
	public static List<Product> BproductList_m() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> Bproductlist_m = sqlsession.selectList("Bproductlist_m","mtb");
		sqlsession.close();
		return Bproductlist_m;
	}
	public static List<Product> BproductList_h() {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> Bproductlist_h = sqlsession.selectList("Bproductlist_h","hy");
		sqlsession.close();
		return Bproductlist_h;
	}
	public static Product productdetail(String p_code) {
		SqlSession sqlsession = sqlfactory.openSession();
		Product detail = sqlsession.selectOne("productdetail", p_code);
		sqlsession.close();
		return detail;
	}
	public static List<Product> findproduct(Product pd) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> fp = sqlsession.selectList("findp", pd);
		sqlsession.close();
		return fp;
	}
	public static List<Product> option(String p_code) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Product> sm = sqlsession.selectList("option", p_code);
		sqlsession.close();
		return sm;
	}
	public static int pr_chk(Order order) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.selectOne("pr_chk", order);
		sqlsession.close();
		return chk;
	}
	public static List<P_review> p_review(String p_code) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<P_review> pr = sqlsession.selectList("p_review", p_code);
		sqlsession.close();
		return pr;
	}
	public static int pr_write(P_review p_review) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("pr_write", p_review);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	public static int prodctOrd(List<Order> or_list) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("ord", or_list);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	
	
	
	////V
	public static User getUserinfo(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		User info = sqlsession.selectOne("mypage_user_info_select" , id);
		sqlsession.close();
		return info;
	}
	public static void updateInfo(User info) {
		System.out.println("dao");
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.update("mypage_user_info_update" , info);
		System.out.println("DAO Front commit");
		sqlsession.commit();
		sqlsession.close();
	}
	
	public static List<Board> getMyBoard(String nick) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Board> board = sqlsession.selectList("mypage_board_select" , nick);
		sqlsession.close();
		return board;
	}
	public static List<Challenge_comp> getCompChallengList(String id) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Challenge_comp> cc = sqlsession.selectList("mypage_comp_challenge_select" , id);
		sqlsession.close();
		return cc;
	}
	
	public static List<Order> getOrderList(String id){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Order> o = sqlsession.selectList("mypage_orderList_select" , id);
		sqlsession.close();
		return o;
		
	}
	public static List<Order> getWishList(String id){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Order> o = sqlsession.selectList("mypage_wish_list_select" , id);
		sqlsession.close();
		return o;
		
	}
	public static void deleteAccount(String id) {
		System.out.println("dao in:");
		SqlSession sqlsession = sqlfactory.openSession();
		sqlsession.delete("mypage_delete_Account" , id);
		sqlsession.commit();
		sqlsession.close();
		System.out.println("service out:");
	}
	public static List<Mypage_event> getMypageEvent(String id){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Mypage_event> me = sqlsession.selectList("mypage_event_select" , id);
		sqlsession.close();
		return me;
	}
	public static List<Challenge_list> getChallengeList(){
		SqlSession sqlsession = sqlfactory.openSession();
		List<Challenge_list> cl = sqlsession.selectList("challenge_list_select");
		sqlsession.close();
		return cl;
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
		public static List<Event> EventListing(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Event> EventListing = sqlsession.selectList("EventListing", page);
		sqlsession.close();
		return EventListing;
	}

	public static List<Event> EventListend(Page page) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Event> EventListend = sqlsession.selectList("EventListend", page);
		sqlsession.close();
		return EventListend;

	}
	
	public static Event EventDetail(String e_num) {
		SqlSession sqlsession = sqlfactory.openSession();
		Event EventDetail = sqlsession.selectOne("EventDetail", e_num);
		sqlsession.close();
		return EventDetail;
	}
	
	public static int insert(Event_p event) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("EventInsert",event);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	public static Event_p EventCheck(String e_num) {
		SqlSession sqlsession = sqlfactory.openSession();
		Event_p EventCheck = sqlsession.selectOne("EventCheck", e_num);
		sqlsession.close();
		return EventCheck;
	}
	
	public static List<Event_p> EventWinner(String e_num) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Event_p> EventWinner = sqlsession.selectList("EventWinner", e_num);
		sqlsession.close();
		return EventWinner;
	}
	
	public static int eventpageing(String time) {
		SqlSession sqlsession = sqlfactory.openSession();
		int x = sqlsession.selectOne("eventpaging", time);
		sqlsession.close();
		return x;
	}
	public static int eventpageend(String time) {
		SqlSession sqlsession = sqlfactory.openSession();
		int x = sqlsession.selectOne("eventpagend", time);
		sqlsession.close();
		return x;
	}

	public static List<Bike> BikeList(String select) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Bike> BikeList = sqlsession.selectList("BikeList", select);
		sqlsession.close();
		return BikeList;
	}
	
	public static List<Bike> BikeBackList(String num) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Bike> BikeList = sqlsession.selectList("BikeBackList", num);
		sqlsession.close();
		return BikeList;
	}
	
	public static List<B_comment> BikeComment(String comment) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<B_comment> commentlist = sqlsession.selectList("BikeComment", comment);
		sqlsession.close();
		return commentlist;
	}
	public static int CommentInsert(B_comment insert) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.insert("CommentInsert",insert);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	public static List<Bike> BikeListSelect(String select) {
		SqlSession sqlsession = sqlfactory.openSession();
		List<Bike> BikeList = sqlsession.selectList("BikeListSelect", select);
		sqlsession.close();
		return BikeList;
	}
	
	public static void CommentEdit(B_comment comment) {
		SqlSession sqlsession = sqlfactory.openSession();
		//int chk = sqlsession.update("CommentEdit", comment);
		sqlsession.update("CommentEdit", comment);
		sqlsession.commit();
		sqlsession.close();
	}
	public static int commentdelete(B_comment comment) {
		SqlSession sqlsession = sqlfactory.openSession();
		int chk = sqlsession.delete("CommentDelete", comment);
		sqlsession.commit();
		sqlsession.close();
		return chk;
	}
	
	
	//course
		public static List<Course> courselist(String c_area) {
			SqlSession sqlsession = sqlfactory.openSession();
			List<Course> listc = sqlsession.selectList("courselist", c_area);
			sqlsession.close();
			return listc;
		}
		
		public static Course coursedetail(String c_name) {
			SqlSession sqlsession = sqlfactory.openSession();
			Course coursed = sqlsession.selectOne("coursedetail", c_name);
			sqlsession.close();
			return coursed;
		}
		
		public static int coursecount() {
			SqlSession sqlsession = sqlfactory.openSession();
			int nop = sqlsession.selectOne("coursecount");
			sqlsession.close();
			return nop;
		}
		
		public static int coursecountsearch(Page page) {
			SqlSession sqlsession = sqlfactory.openSession();
			int nop = sqlsession.selectOne("coursecountsearch", page);
			sqlsession.close();
			return nop;
		}
		
		public static List<Course> courseboardlist(Page page) {
			SqlSession sqlsession = sqlfactory.openSession();
			List<Course> cboardl = sqlsession.selectList("courseboardlist",page);
			sqlsession.close();
			return cboardl;
		}
		
		public static List<Course> courseboardlists(Page page) {
			SqlSession sqlsession = sqlfactory.openSession();
			List<Course> cboardl = sqlsession.selectList("courseboardlists",page);
			sqlsession.close();
			return cboardl;
		}
		
		public static int courseboardupd(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			int chk = sqlsession.update("courseboardupd", course);
			sqlsession.commit();
			sqlsession.close();
			return chk;
		}
		
		public static Course courseboardview(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			Course course1 = sqlsession.selectOne("courseboardview", course);
			sqlsession.close();
			return course1;
		}
		
		public static int courseboardviewupd(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			int chk = sqlsession.update("courseboardviewupd", course);
			sqlsession.commit();
			sqlsession.close();
			return chk;
		}
		
		public static int courseboardgoodupd(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			int chk = sqlsession.update("courseboardgoodupd", course);
			sqlsession.commit();
			sqlsession.close();
			return chk;
		}
		
		public static int courseins(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			int chk = sqlsession.insert("courseins",course);
			sqlsession.commit();
			sqlsession.close();
			return chk;
		}
		
		public static int courseboarddel(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			int chk = sqlsession.delete("courseboarddel", course);
			sqlsession.commit();
			sqlsession.close();
			return chk;
		}
		
		public static String coursewriterchk(Course course) {
			SqlSession sqlsession = sqlfactory.openSession();
			String writer = sqlsession.selectOne("coursewriterchk", course);
			sqlsession.close();
			return writer;
		}
	
	
	
}
