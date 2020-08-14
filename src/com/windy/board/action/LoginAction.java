package com.windy.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.svc.LoginSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getParameter("ur");
		ActionForward forward = null;
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		LoginSVC ls = new LoginSVC();
		String nick = ls.Login(user);
		if(nick=="") {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", request.getParameter("id"));
			httpSession.setAttribute("nick", nick);
			forward.setRedirect(true);
			if(!(url.equals("null")))
				forward.setPath(url);
			else
				forward.setPath("main.jsp");
		}		
		return forward;
	}

}
