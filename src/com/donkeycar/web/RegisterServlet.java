package com.donkeycar.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.donkeycar.DAO.userDAO;
import com.donkeycar.bean.User;


@WebServlet("/registerT")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO userDao;

    public void init() {
    	userDao = new userDAO();
    }   

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("name");
        String userAccount = request.getParameter("account");
        String password = request.getParameter("password");
        String address = new String( request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
        // String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        
      //make user object
        User userModel = new User(userName, userAccount, password, address, contact);
        try {
        	userDao.registerUser(userModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminLogin.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
