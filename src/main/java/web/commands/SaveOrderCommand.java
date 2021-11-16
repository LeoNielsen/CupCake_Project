package web.commands;

import business.entities.*;
import business.exceptions.UserException;
import business.services.BottomFacade;
import business.services.OrderFacade;
import business.services.ToppingFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveOrderCommand extends CommandProtectedPage{

    private UserFacade userFacade;
    private OrderFacade orderFacade;
    private ToppingFacade toppingFacade;
    private BottomFacade bottomFacade;

    public SaveOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
        toppingFacade = new ToppingFacade(database);
        bottomFacade = new BottomFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        int cupcakeid = (int) session.getAttribute("cupcakeid");

        int orderId = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("userid"));
        String status = request.getParameter("status");
        String toppingname = request.getParameter("topping");
        String bottomname = request.getParameter("bottom");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float total = Float.parseFloat((request.getParameter("total")));

        try {
            User user = userFacade.getUser(userId);
            Order order = orderFacade.getOrder(user, orderId);
            order.setStatus(status);
            Cupcake cupcake = order.getCupcakes().get(cupcakeid);
            Topping topping = toppingFacade.getTopping(toppingname);
            Bottom bottom = bottomFacade.getBottom(bottomname);
            cupcake.setTopping(topping);
            cupcake.setBottom(bottom);
            cupcake.setQuantity(quantity);
            cupcake.setTotal(total);

        } catch (UserException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "orderdetailspage";
    }
}
