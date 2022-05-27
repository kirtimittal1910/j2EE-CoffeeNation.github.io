package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Entities.User;
import helper.FactoryProvider;


@WebServlet("/regiterServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		try ( PrintWriter out = response.getWriter()){

			try {
				String Name= request.getParameter("name");
				String Email = request.getParameter("email");
				String Password = request.getParameter("password");
				String Number = request.getParameter("number"); 

				//create user object to save the data

				User user= new User(Name, Email, Password, Number, "normal"); 

				String query= "select userName from User where userEmail= :e";
				Session session = FactoryProvider.getFactory().openSession();


				Query q= session.createQuery(query);
				q.setParameter("e", Email);
				String result= (String)q.uniqueResult();

				if(result==null) {

					Transaction tx= session.beginTransaction();

					session.save(user);

					tx.commit();
					session.close();

					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Registration Successful!!");
					response.sendRedirect("/coffeeShop/login.jsp");

				}
				else {
					
					session.close();
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("mesaage", "Email Already Registered!!");
					response.sendRedirect("register.jsp");
					return;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public registerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		//		doGet(request, response);
	}

}
