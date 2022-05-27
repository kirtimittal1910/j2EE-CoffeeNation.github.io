package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Entities.feedback;
import helper.FactoryProvider;

@WebServlet("/feedbackServlet")
public class feedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException{
		response.setContentType("text/html; charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			
			String rating= request.getParameter("feedback");
			String email= request.getParameter("email");
			String experience= request.getParameter("experience");
			
			feedback fdb= new feedback(rating, email, experience);
			
			Session session = FactoryProvider.getFactory().openSession(); 
			 
			Transaction tx= session.beginTransaction();
			
			session.save(fdb);
			
			tx.commit();
			session.close();
			
			HttpSession httpSession= request.getSession();
    		httpSession.setAttribute("message", "Thanks for rating us!");
      		response.sendRedirect("normal.jsp");
    		return;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
       
    
    public feedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
