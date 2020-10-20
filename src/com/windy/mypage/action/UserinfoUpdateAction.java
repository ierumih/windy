package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.windy.board.action.Action;
import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class UserinfoUpdateAction implements Action{
	//����� ���� ����
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");
		
		User info = new User();
		info.setId(id);
		info.setName(request.getParameter("name"));//jsp�� name���� ����
		info.setNick(request.getParameter("nick_name"));
		info.setTel(request.getParameter("tel"));
		info.setEmail(request.getParameter("email"));
		info.setAddr1(request.getParameter("addr1"));//�����ȣ
		info.setAddr(request.getParameter("addr"));//�ּ�
		info.setAddr2(request.getParameter("addr2"));//���ּ�
		info.setAddr3(request.getParameter("addr3"));//����
		
		////�̹��� ���� �޾ƿ���////
		info.setProfile_img(request.getParameter("img_file"));//������ �̹���
		if(info.getProfile_img().length() ==0) {
			info.setProfile_img(null);
		}
		System.out.println("action Profil_img : " + info.getProfile_img());
		
//		String realFolder = "";
//		int fileSize=5*1024*1024;
//		
//		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8" , new DefaultFileRenamePolicy());
		
		//////////////////////
		
		
		UserInfoService uis = new UserInfoService();
		uis.updateInfo(info);
		
		
		forward.setPath("mypage.b");
		
		return forward;
	}
	
}
