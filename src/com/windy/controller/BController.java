package com.windy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.bike.action.BikeCommentAction;
import com.windy.bike.action.BikeListAction;
import com.windy.bike.action.CommentDeleteAction;
import com.windy.bike.action.CommentInsertAction;
import com.windy.board.action.*;
import com.windy.course.action.*;
import com.windy.event.action.EventDetailendAction;
import com.windy.event.action.EventDetailingAction;
import com.windy.event.action.EventInsertAction;
import com.windy.event.action.EventListendAction;
import com.windy.event.action.EventListingAction;
import com.windy.mypage.action.Go_to_BMI_Action;
import com.windy.mypage.action.MypageDeleteAction;
import com.windy.mypage.action.MypageSelectAction;
import com.windy.mypage.action.ChallengeListSelectAction;
import com.windy.mypage.action.userinfoUpdateAction;
import com.windy.shop.action.FindProductAction;
import com.windy.shop.action.ProductDetailAction;
import com.windy.shop.action.ProductListAction;
import com.windy.shop.action.ProductOrderAction;
import com.windy.shop.action.ProductReviewAction;
import com.windy.vo.ActionForward;

@WebServlet("*.b")
public class BController extends javax.servlet.http.HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/write.b")){
			forward=new ActionForward();
			forward.setPath("/write.jsp");
		}
		else if(command.equals("/writeaction.b")){
			action = new BoardWriteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/editaction.b")){
			action = new BoardEditAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteaction.b")){
			action = new BoardDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/loginaction.b")){
			action = new LoginAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/joinaction.b")){

			action = new JoinAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardlist.b")){
			action = new BoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardview.b")){
			action = new BoardViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardeditform.b")){
			action = new BoardEditFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardedit.b")){
			action = new BoardEditAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boarddelete.b")){
			action = new BoardDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/findProduct.b")){
			action = new FindProductAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/shopBestList.b")){
			action = new ProductListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/productDetail.b")){
			action = new ProductDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/productOrder.b")){
			action = new ProductOrderAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/productReview.b")){
			
			action = new ProductReviewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/bikelist.b")){
			action = new ProductListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage.b")){
			action = new MypageSelectAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/eventlisting.b")){
			System.out.println("list");
			action = new EventListingAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/eventlistend.b")){
			action = new EventListendAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/eventdetailing.b")){
			action = new EventDetailingAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/eventdetailend.b")){
			action = new EventDetailendAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/eventinsert.b")){
			action = new EventInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/brandselect.b")){
			action = new BikeListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/bikecomment.b")){
			action = new BikeCommentAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/commentinsert.b")){
			action = new CommentInsertAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/back.b")){
			action = new BikeListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/commentdelete.b")){
			action = new CommentDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/deleteAccount.b")){
			action = new MypageDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/mypage_info_update.b")){
			action = new userinfoUpdateAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/checkBMI.b")){
			action = new Go_to_BMI_Action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/challengeList.b")){
			action = new ChallengeListSelectAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courselist.b")){
			action = new CourseListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courseboardlist.b")){
			action = new CourseBoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/coursedetail.b")){
			action = new CourseDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courseboardview.b")){
			action = new CourseBoardViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courseboarddelete.b")){
			action = new CourseBoardDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/coursewrite.b")){
			forward=new ActionForward();
			forward.setPath("/course_write.jsp");
		}
		
		
		
		else if(command.equals("/coursewriteaction.b")){
			action = new CourseBoardWriteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courseboardeditform.b")){
			action = new CourseBoardEditFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/courseboardedit.b")){
			action = new CourseBoardEditAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		

			
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
}

