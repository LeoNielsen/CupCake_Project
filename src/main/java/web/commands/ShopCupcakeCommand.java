package web.commands;

import business.entities.*;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ShopCupcakeCommand extends CommandUnprotectedPage{
    public ShopCupcakeCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String topping = request.getParameter("topping");
        String bottom = request.getParameter("bottom");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if(cart == null) {
            cart = new ShoppingCart();
        }

        //TODO: hent data om topping og bottom pris fra databasen
        cart.add(new Cupcake(new Topping(topping, 5), new Bottom(bottom, 5), quantity));
        session.setAttribute("cart", cart);
        session.setAttribute("cartlist", cart.getCupcakes());
        session.setAttribute("topping", topping);
        session.setAttribute("botton", bottom);
        for(Cupcake c :cart.getCupcakes()) {
            System.out.println(c.getTopping().getName());
        }

        return "shopcupcakepage";
    }
}
