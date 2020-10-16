package com.windy.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.svc.JoinSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String bry = request.getParameter("birth1");
		String brm = request.getParameter("birth2");
		String brd = request.getParameter("birth2");
		String mail = request.getParameter("email1");
		String e_addr = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String sex = request.getParameter("sex");
		String b_have = request.getParameter("have");
		String bikes = request.getParameter("bike");
		String sms = request.getParameter("sms");
		String addr = request.getParameter("addr1");
		String addr1 = request.getParameter("addr2");
		String addr2 = request.getParameter("addr3");
		String addr3 = request.getParameter("addr4");
		String birth = bry+"/"+brm+"/"+brd;
		String etc = request.getParameter("etc");
		String tel = tel1+tel2+tel3;
		String email = mail+"@"+e_addr;
		String f_bike="";
		if(request.getParameter("etc")==null)
			f_bike=bikes;
		else
			f_bike = bikes+", "+etc;
		user.setId(id);
		user.setPw(pw);
		user.setName(name);
		user.setNick(nick);
		user.setBirth(birth);
		user.setEmail(email);
		user.setTel(tel);
		user.setSex(sex);
		user.setAddr(addr);
		user.setAddr1(addr1);
		user.setAddr2(addr2);
		user.setAddr3(addr3);
		user.setB_have(b_have);
		user.setF_bike(f_bike);
		user.setSms(sms);
		JoinSVC js = new JoinSVC();
		boolean Success = js.join(user);
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���Խ���')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.jsp");
		}
		
		return forward;
	}
	
}
