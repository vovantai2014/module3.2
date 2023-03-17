package controller;

import bean.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService service = new ProductServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "list";
        }
        switch (action){
            case "list":
                showList(request,response);
                break;
            case "detail":
                showDetail(request,response);
                break;
            case "update":
                showUpdate(request,response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            case "create":
                showCreate(request,response);
                break;
            default:
                showError(request,response);
        }

    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/product/create.jsp").forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = service.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("prod", product);
            dispatcher = request.getRequestDispatcher("/product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = service.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("/product/error-404.jsp");
        }else {
            request.setAttribute("pr",product);
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("pro", service.findById(id));
        request.getRequestDispatcher("/product/detail.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("p",service.findAll());
        request.getRequestDispatcher("/product/list.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            showError(request,response);
            return;
        }
        switch (action){
            case "update":
                doUpdate(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "create":
                doCreate(request,response);
                break;
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String id = request.getParameter("msv");
//        String name = request.getParameter("tsv");
//        int sex = Integer.parseInt(request.getParameter("gt"));
//        String address = request.getParameter("dc");
//        float mark = Float.parseFloat(request.getParameter("d"));
//        Student student = new Student(id, name, sex, address, mark);
//        service.create(student);
//        response.sendRedirect("/student?action=list");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        service.create(product);
        response.sendRedirect("/product?action = list");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
//        String id = request.getParameter("id");
//        Student student = service.findById(id);
//        RequestDispatcher dispatcher;
//        if (student == null) {
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        } else {
//            service.delete(id);
//            try {
//                response.sendRedirect("/student");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        String id = request.getParameter("id");
        Product product = service.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            service.delete(id);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void showError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/product/error.jsp").forward(request, response);
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        service.update(product);
        response.sendRedirect("/product?action=list");
    }


}
