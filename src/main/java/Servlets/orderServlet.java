package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Entities.order;
import helper.FactoryProvider;

@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			
			String userName= request.getParameter("name");
			String userContact= request.getParameter("contact");
			String userProduct= request.getParameter("product");
			
			order o= new order(userName, userContact, userProduct);
			
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction tx = session.beginTransaction();
			
			session.save(o);
			
			tx.commit();
			session.close();
			
			
			response.sendRedirect("thankyouOrder.jsp");
			return;
			
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		
	}
	
	
    public orderServlet() {
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
