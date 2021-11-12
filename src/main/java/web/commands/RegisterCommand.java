package web.commands;

import business.entities.Order;
import business.entities.ShoppingCart;
import business.entities.User;
import business.persistence.Database;
import business.services.OrderFacade;
import business.services.UserFacade;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RegisterCommand extends CommandUnprotectedPage
{
    private UserFacade userFacade;
    private OrderFacade orderFacade;

    public RegisterCommand(String pageToShow)
    {
        super(pageToShow);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String streetname = request.getParameter("streetname");
        String housenr = request.getParameter("housenr");
        String zipcode = request.getParameter("zipcode");
        String city = request.getParameter("city");
        String phonenr = request.getParameter("phonenr");

        if (password1.equals(password2))
        {
            User user = userFacade.createUser(email, password1,firstname,lastname,streetname,housenr,zipcode,city,phonenr);
            user.setRole("customer");
            HttpSession session = request.getSession();

            session.setAttribute("email", email);
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("firstname", user.getFirstname());

            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null){
                cart = new ShoppingCart();
            }

            cart.setUser(user);

            session.setAttribute("cart", cart);


            ArrayList<Order> orders = orderFacade.getAllOrder(user);
            if(orders == null){
                orders = new ArrayList<>();
            }

            session.setAttribute("orderlist",orders);

            return REDIRECT_INDICATOR + "index";
        }
        else
        {
            request.setAttribute("error", "the two passwords did not match");
            return "registerpage";
        }
    }

}
