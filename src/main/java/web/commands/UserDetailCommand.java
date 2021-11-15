package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class UserDetailCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public UserDetailCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("index"));
        ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
        User user = users.get(index);
        session.setAttribute("seemoreuser", user);
        try
        {
            ArrayList<Order> orders = orderFacade.getAllUserOrders(user);
            session.setAttribute("orderlist", orders);
        } catch (UserException e)
        {
            e.printStackTrace();
        }

        return "customerdetailspage";
    }
}
