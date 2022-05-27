package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Entities.User;
import dao.UserDao;
import helper.FactoryProvider;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	try ( PrintWriter out = response.getWriter()){
			
    		String Email= request.getParameter("email");
    		String Password= request.getParameter("password");
    		
    		//authentication user
    		UserDao userDao= new UserDao(FactoryProvider.getFactory()); 
    		User user= userDao.getUserByEmailAndPassword(Email, Password);
    		
    		 HttpSession httpSession = request.getSession();
    		  if(user==null) {
    			  httpSession.setAttribute("message", "Invalid Details!! Try with another one.");
   			      response.sendRedirect("/coffeeShop/login.jsp");
   			      return;
    		  }
    		  else {
    			//out.println("<h1>Welcome " + user.getUserName() + "</h>");
    			
    			//login
    			httpSession.setAttribute("current-user", user);
    			
    			if(user.getUserType().equals("admin")) {
    				//admin :-admin.jsp
    				response.sendRedirect("admin.jsp");
    			}else if(user.getUserType().equals("normal")) {
    				//normal :-normal.jsp
    				response.sendRedirect("normal.jsp");
    			}else {
    				out.println("Cannot Identified User Type");
    			}
    			
    			
    		}
		}
    }

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
