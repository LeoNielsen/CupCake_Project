package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class OrderDetailCommand extends CommandUnprotectedPage{
    private OrderFacade orderFacade;
    private UserFacade userFacade;
    public OrderDetailCommand(String pageToShow) {
        super(pageToShow);
        orderFacade = new OrderFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("order"));
        boolean isCustomerOrderList = Boolean.parseBoolean(request.getParameter("customerorderlist"));
        ArrayList<Order> orders;
        Order order;

        if(isCustomerOrderList){
            orders = (ArrayList<Order>) session.getAttribute("orderlist");
        } else {
            ArrayList<User> users;

            users = userFacade.getAllUsers();
            orders = orderFacade.getAllOrders(users);
            session.setAttribute("allorders", orders);
        }
        order = orders.get(index);
        session.setAttribute("seemoreorder", order);
        return "orderdetailspage";
    }
}
