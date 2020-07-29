<%
	Cookie[] cookies = request.getCookies();
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cookie_id")){
			session.setAttribute("id",cookies[i].getValue());
		}
		if(cookies[i].getName().equals("cookie_nick")){
			session.setAttribute("nick",cookies[i].getValue());
		}
	}
%>