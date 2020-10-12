package com.windy.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.ChallengeCompService;
import com.windy.mypage.svc.MypageEventService;
import com.windy.mypage.svc.OrderStatusService;
import com.windy.mypage.svc.UserInfoService;
import com.windy.mypage.svc.boardsSelectService;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;
import com.windy.vo.Challenge_comp;
import com.windy.vo.Mypage_event;
import com.windy.vo.Order;
import com.windy.vo.User;

public class MypageSelectAction implements Action{
	//사용자 정보 불러오기
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");//세션에 있는 아이디 받음
		String nick = (String) httpSession.getAttribute("nick");
		
		////////////유저 정보 가져오기
		UserInfoService uis = new UserInfoService();//유저 인포 서비스 객체 생성
		User info = uis.getinfo(id);//실행값 info에 넣음
		httpSession.setAttribute("info", info);//세션에 인포 저장
		
		///////////////////내가 쓴글 가져오기
		List<Board> board = null;
		boardsSelectService bss = new boardsSelectService();
		board = bss.getMyBoardList(nick);
		httpSession.setAttribute("board", board);
		
		//////////////////달성업적 리스트 가져오기
		List<Challenge_comp> cc = null;
		ChallengeCompService ccs = new ChallengeCompService();
		cc = ccs.getCompChallengeList(id);
		httpSession.setAttribute("ChallengeComp", cc);
		
		//////////////////상품주문 현황 가져오기
		List<Order> lo = null;
		OrderStatusService oss =  new OrderStatusService();
		lo = oss.getOrderList(id);
		httpSession.setAttribute("OrderList", lo);
		//////////////////찜목록
		List<Order> wishlist = null;
		wishlist = oss.getWishList(id);
		httpSession.setAttribute("wishList", wishlist);
		
		/////////////////마이페이지 참여중인 이벤트 불러오기
		List<Mypage_event> me = null;
		MypageEventService mes = new MypageEventService();
		me = mes.getMyEvent(id);
		httpSession.setAttribute("MyEvent", me);
		
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
}
