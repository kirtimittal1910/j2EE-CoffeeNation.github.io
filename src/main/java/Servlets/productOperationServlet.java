package Servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.SessionFactory;

import Entities.Category;
import Entities.Product;
import Entities.User;
import dao.CategoryDao;
import dao.ProductDao;
import dao.UserDao;
import helper.FactoryProvider;

@WebServlet("/productOperationServlet")
@MultipartConfig 
public class productOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	try ( PrintWriter out = response.getWriter()){
			
    		try {
				
    		String op= request.getParameter("operation");
    		if(op.trim().equals("addCategory")) {
    			//addCategory
    			String Title= request.getParameter("cat-name");
        		String Description= request.getParameter("cat-description");
        		
        		Category category= new Category();
        		category.setCategoryTitile(Title);
        		category.setCategoryDescription(Description);
        		
        		CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
        		categorydao.saveCategory(category);
        		
        		
         		HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("message", "Successfully Added New Category!!");
          		response.sendRedirect("admin.jsp");
        		return;
        		
    		}
    		else if(op.trim().equals("addProduct")) {
    			//addProduct
    			String IName= request.getParameter("item-name");
    			int IPrice= Integer.parseInt(request.getParameter("item-price"));
    			int CId= Integer.parseInt( request.getParameter("catId"));
    			Part pic= request.getPart("item-pic");
    			String IDes= request.getParameter("item-des");
    			
    			Product p= new Product();
    			p.setpName(IName);
    			p.setpDesc(IDes);
    			p.setpPrice(IPrice);
    			p.setpPhoto(pic.getSubmittedFileName());
    			
    			
    			//get category by id
    			CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
    			Category category= cdao.getCategoryById(CId);
    			p.setCategory(category);
    			
    			//Product save
    			ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
    			pdao.saveProduct(p);
    			
   ////////////////pic upload-start///////////////////////
    			
    			//find the path to upload photo
    			String path= getServletContext().getRealPath("img") + File.separator + "menu" + File.separator + pic.getSubmittedFileName();
    			System.out.println(path);
    			//code for uploading....
    			FileOutputStream fos = new FileOutputStream(path);
    			InputStream is= pic.getInputStream();
    			
    			//reading data
    			byte[] data= new byte[is.available()];
    			
    			is.read(data);
    			
    			//writing the data
    			fos.write(data);
    			fos.close();
    			is.close();
      ////////////////end////////////////////////////
    			
    			HttpSession httpSession= request.getSession();
        		httpSession.setAttribute("message", "New Product Added Successfully!!");
        		response.sendRedirect("admin.jsp");
        		return;
    		}
    		
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    		
		}
    }
	
	
	

    public productOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		doGet(request, response);
	}

}
