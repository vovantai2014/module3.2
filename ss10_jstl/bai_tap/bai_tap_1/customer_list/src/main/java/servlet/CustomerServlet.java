package servlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Mai Văn Hoàn", "20-08-1983", "Hà Nội", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "21-08-1983", "Bắc Giang", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "22-08-1983", "Nam Định", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "17-08-1983", "Hà Tây", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "19-08-1983", "Hà Nội", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));
        customerList.add(new Customer("Mohamed Salah", "19-08-1990", "Ai Cập", "https://kenh14cdn.com/k:zVtX15ebeaY8dtY6kEacMnBBQYE3NJ/Image/2013/10/3-a30f3/tron-bo-anh-dam-cuoi-cua-co-dau-giong-het-dam-vinh-hung.jpg"));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
        request.setAttribute("danhsachkhachhang", customerList);
        dispatcher.forward(request, response);
    }
}
