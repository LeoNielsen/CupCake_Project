package web.commands;

import business.entities.*;
import business.services.BottomFacade;
import business.services.OrderFacade;
import business.services.ToppingFacade;
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
            ArrayList<Order> orders = orderFacade.getAllUserOrders(user);
            if(orders == null){
                orders = new ArrayList<>();
            }

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

            if(user.getRole().equals("employee")){
                ToppingFacade toppingFacade = new ToppingFacade(database);
                BottomFacade bottomFacade = new BottomFacade(database);

                ArrayList<Topping> toppings = toppingFacade.getAllToppings();
                ArrayList<Bottom> bottoms = bottomFacade.getAllBottoms();

                request.getServletContext().setAttribute("toppings", toppings);
                request.getServletContext().setAttribute("bottoms", bottoms);
            }

//        String pageToShow =  user.getRole() + "page";
            return REDIRECT_INDICATOR + "index"; //REDIRECT_INDICATOR + pageToShow;
        } catch (UserException ex) {
            request.setAttribute("error", "Wrong username or password!");
            return "loginpage";
        }
    }

}
