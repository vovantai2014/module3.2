package controller;

import bean.Student;
import service.StudentService;
import service.StudentServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/student")
public class StudentServlet extends HttpServlet {
    private StudentService service = new StudentServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                showList(request, response);
                break;
            case "detail":
                showDetail(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            case "update":
                showUpdate(request, response);
                break;
            case "delete":
                showDelete(request, response);
            default:
                showError(request, response);

        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Customer customer = this.customerService.findById(id);
//        RequestDispatcher dispatcher;
//        if(customer == null){
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        } else {
//            request.setAttribute("customer", customer);
//            dispatcher = request.getRequestDispatcher("customer/delete.jsp");
//        }
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        String id = request.getParameter("id");
        Student student = service.findById(id);
        RequestDispatcher dispatcher;
        if (student == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("st", student);
            dispatcher = request.getRequestDispatcher("/students/delete.jsp");
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
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = productRepository.selectProduct(id);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
//        request.setAttribute("product", product);
//        dispatcher.forward(request, response);

//        int id = Integer.parseInt(request.getParameter("id"));
//        Customer customer = iCustomerRepository.selectIdCustomer(id);
//        RequestDispatcher requestDispatcher =request.getRequestDispatcher("view/customer/edit.jsp");
//        request.setAttribute("customer",customer);
//        List<CustomerType> customerTypeList = iCustomerRepository.selectCusType();
//        request.setAttribute("customerTypeList",customerTypeList);
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        String id = request.getParameter("id");
        Student student = service.findById(id);
        RequestDispatcher dispatcher;
        if (student == null) {
            dispatcher = request.getRequestDispatcher("/students/error-404jsp");
        } else {
            request.setAttribute("s", student);
            dispatcher = request.getRequestDispatcher("/students/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/students/error.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/students/create.jsp").forward(request, response);
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("student", service.findById(id));
        request.getRequestDispatcher("/students/detail.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Student> students = service.findAll();
//        request.setAttribute("students", students);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/students/list.jsp");
//        dispatcher.forward(request, response);
        request.setAttribute("students", service.findAll());
        request.getRequestDispatcher("/students/list.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            showError(request, response);
            return;
        }
        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "update":
                doUpdate(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
                break;
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Customer customer = this.customerService.findById(id);
//        RequestDispatcher dispatcher;
//        if(customer == null){
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        } else {
//            this.customerService.remove(id);
//            try {
//                response.sendRedirect("/customers");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        String id = request.getParameter("id");
        Student student = service.findById(id);
        RequestDispatcher dispatcher;
        if (student == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            service.delete(id);
            try {
                response.sendRedirect("/student");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        String name = request.getParameter("name");
//        String price = request.getParameter("price");
//        String describe = request.getParameter("describe");
//        String producer = request.getParameter("producer");
//
//        Product product = new Product(id,name, price,describe,producer);
//        productRepository.updateProduct(product);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/edit.jsp");
//        dispatcher.forward(request, response)
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String address = request.getParameter("address");
        float mark = Float.parseFloat(request.getParameter("mark"));
        Student student = new Student(id, name, sex, address, mark);
        service.update(student);
        response.sendRedirect("/student?action=list");

    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("msv");
        String name = request.getParameter("tsv");
        int sex = Integer.parseInt(request.getParameter("gt"));
        String address = request.getParameter("dc");
        float mark = Float.parseFloat(request.getParameter("d"));
        Student student = new Student(id, name, sex, address, mark);
        service.create(student);
        response.sendRedirect("/student?action=list");
    }
}

