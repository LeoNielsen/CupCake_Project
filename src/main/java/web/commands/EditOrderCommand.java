package web.commands;

import business.entities.*;
import business.exceptions.UserException;
import business.persistence.OrderMapper;
import business.services.BottomFacade;
import business.services.OrderFacade;
import business.services.ToppingFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditOrderCommand extends CommandProtectedPage {

    private UserFacade userFacade;
    private OrderFacade orderFacade;
    private ToppingFacade toppingFacade;
    private BottomFacade bottomFacade;

    public EditOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
        toppingFacade = new ToppingFacade(database);
        bottomFacade = new BottomFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        int cupcakeid = Integer.parseInt(request.getParameter("cupcakeid"));

        HttpSession session = request.getSession();
        session.setAttribute("cupcakeid", cupcakeid);
        int orderId = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("userid"));

        try {
            User user = userFacade.getUser(userId);
            Order order = orderFacade.getOrder(user, orderId);

            session.setAttribute("editcupcake",order.getCupcakes().get(cupcakeid));

        }catch (Exception e){
            e.printStackTrace();
        }


        return "editorderpage";
    }
}
