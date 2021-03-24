package com.donkeycar.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.donkeycar.DAO.userDAO;
import com.donkeycar.bean.User;

@WebServlet("/loginT")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO userDAO;   

	public void init() {
		userDAO = new userDAO();
    }   
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getServletPath();
		System.out.println(action);
		
		String userAccount = request.getParameter("email");
        String password = request.getParameter("password");
        boolean flag=false;
        //System.out.println(userAccount);
        //System.out.println(password);
      //make user object
        User userModel = new User(userAccount, password);
        
        try {
        	User listUser = userDAO.validate(userModel);
        	//System.out.println(listUser.getUseraccount());
        	// listUser若為null 表示沒有此使用者
        	if(listUser==null) {
        		flag=true;
        		//request.getRequestDispatcher("errorAdminLogin.jsp").forward(request, response); 
        	}else {
        		request.setAttribute("user", listUser);
        	}
        	// System.out.println("@@@@@@@@@@@@@@@@@@******");
        	System.out.println(listUser.getAddress());
        	
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) {
        	response.sendRedirect("errorAdminLogin.jsp");
        }else {
        RequestDispatcher dispatcher = 
				request.getRequestDispatcher("adminHome.jsp");
        dispatcher.forward(request, response);}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
