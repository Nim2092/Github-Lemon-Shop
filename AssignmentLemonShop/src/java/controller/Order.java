/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.CartItemDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Cart;
import model.Product;

/**
 *
 * @author asus
 */
public class Order extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        float price=0;
        String aid= request.getParameter("accountid");
        PrintWriter out = response.getWriter();
        OrderDAO odao= new OrderDAO();
        odao.insert(Integer.parseInt(aid));
        ProductDAO pdao = new ProductDAO();
        
        OrderDetailDAO detailDAO = new OrderDetailDAO();
        int oid= odao.getMaxId();
        List<Product> listP= pdao.getProductByAId(Integer.parseInt(aid));
        for (Product product : listP) {
            
            String quantity= request.getParameter("quantity"+product.getProductId());
  
            detailDAO.add(oid, product.getCategoryId(), Integer.parseInt(quantity));
            price+=(Integer.parseInt(quantity)*product.getPrice());
        }
        CartDAO cartDAO= new CartDAO();
        Cart cart=cartDAO.getCartById(Integer.parseInt(aid));
        CartItemDAO cartItemDAO= new CartItemDAO();
        cartItemDAO.deleteCartItemByCartId(cart.getCartId());
        odao.updatePrice(oid, price);
        request.setAttribute("price", price);
        AccountDAO adao=new AccountDAO();
        Account account= adao.getAccountByAid(Integer.parseInt(aid));
         request.setAttribute("name", account.getFullName());
         request.setAttribute("accountNumber", account.getUsername());
        request.getRequestDispatcher("paymentsuccessful.jsp").forward(request, response);
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
