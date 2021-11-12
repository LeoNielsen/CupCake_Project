package web.commands;

import business.entities.Order;
import business.entities.ShoppingCart;
import business.entities.User;
import business.services.OrderFacade;
import business.services.UserFacade;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class LoginCommand extends CommandUnprotectedPage {
    private UserFacade userFacade;
    private OrderFacade orderFacade;

    public LoginCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userFacade.login(email, password);
            ArrayList<Order> orders = orderFacade.getAllOrder(user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("email", email);
            session.setAttribute("orderlist", orders);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            if (cart == null) {
                cart = new ShoppingCart();
            }

            cart.setUser(user);

            session.setAttribute("cart", cart);

//        String pageToShow =  user.getRole() + "page";
            return REDIRECT_INDICATOR + "index"; //REDIRECT_INDICATOR + pageToShow;
        } catch (UserException ex) {
            request.setAttribute("error", "Wrong username or password!");
            return "loginpage";
        }
    }

}
