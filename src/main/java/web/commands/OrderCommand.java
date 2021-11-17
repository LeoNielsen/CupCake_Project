package web.commands;

import business.entities.Order;
import business.entities.ShoppingCart;
import business.services.CupcakeFacade;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class OrderCommand extends CommandProtectedPage{

    OrderFacade orderFacade;
    CupcakeFacade cupcakeFacade;

    public OrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
        cupcakeFacade = new CupcakeFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();


        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("orderlist");
        if (orders == null){
            orders = new ArrayList<>();
        }

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        String status = "Pending";
        Order order = orderFacade.saveOrder(cart.getCupcakes(), cart.getUser(), status);
        cupcakeFacade.saveCupcakes(order);
        orders.add(order);

        session.setAttribute("orderlist", orders);
        session.setAttribute("status", order);

        return pageToShow;
    }
}
