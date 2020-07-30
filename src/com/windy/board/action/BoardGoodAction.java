//package com.windy.board.action;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.windy.board.svc.BoardGoodSVC;
//import com.windy.vo.ActionForward;
//import com.windy.vo.Board;
//
//public class BoardGoodAction implements Action{
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// TODO Auto-generated method stub
//		int cnt=0;
//		int board_num = Integer.valueOf(request.getParameter("board_num"));
//		String board_name = request.getParameter("board_name");
//		String nick = request.getParameter("nick");
//		String cn = board_name+nick+board_num;
//		Board board = new Board();
//		board.setBoard_num(board_num);
//		board.setBoard_name(board_name);
//		Cookie[] cookies = request.getCookies();
//		
//		if(cookies!=null){
//			for(int i=0;i<cookies.length;i++){
//				if(cookies[i].getName().equals(cn)&&cookies[i].getValue().equals("ok")){
//					cnt=1;
//				}
//			}
//		}
//		if(cnt==0) {
//			BoardGoodSVC bgs = new BoardGoodSVC();
//			Boolean success = bgs.BoardGood(board);
//			if (success) {
//				Cookie cookie = new Cookie(cn, "ok");
//				cookie.setMaxAge(60*60*24);;
//				cookie.setPath("/");
//			}
//		}
//		System.out.print(cnt);
//		return null;
//	}
//
//}
