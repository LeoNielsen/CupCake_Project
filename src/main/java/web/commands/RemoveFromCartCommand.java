package web.commands;

import business.entities.Cupcake;
import business.entities.ShoppingCart;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveFromCartCommand extends CommandUnprotectedPage{
    public RemoveFromCartCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        HttpSession session = request.getSession();

        int cupcake = Integer.parseInt(request.getParameter("cupcake"));
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        cart.remove(cupcake);

        session.setAttribute("cart", cart);

        return "shoppingcartpage";
    }
}
