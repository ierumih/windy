package com.windy.event.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.HiddenAction;

import com.windy.board.action.Action;
import com.windy.event.svc.EventInsertService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event_p;

public class EventInsertAction  implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		HttpSession httpSession = request.getSession();
		
		
		String id=request.getParameter("hidden1");
		String e_num=request.getParameter("hidden2");
		
		System.out.println("action"+id+","+e_num);
		
		ActionForward forward = null;
		Event_p event = new Event_p();
		
		event.setId(id);
		event.setE_num(e_num);
		EventInsertService eis = new EventInsertService();
		boolean Success = eis.EventInsert(event);
		
		
		
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setPath("eventlisting.b");
		}
		
		return forward;
	}

}
