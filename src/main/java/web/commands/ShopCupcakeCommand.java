package web.commands;

import business.entities.*;
import business.exceptions.UserException;
import business.services.BottomFacade;
import business.services.ToppingFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ShopCupcakeCommand extends CommandUnprotectedPage{
    private ToppingFacade toppingFacade;
    private BottomFacade bottomFacade;
    public ShopCupcakeCommand(String pageToShow) {
        super(pageToShow);
        toppingFacade = new ToppingFacade(database);
        bottomFacade = new BottomFacade(database);
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
        try {
            cart.add(new Cupcake(toppingFacade.getTopping(topping), bottomFacade.getBottom(bottom), quantity));
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("cart", cart);
        session.setAttribute("cartlist", cart.getCupcakes());
        session.setAttribute("topping", topping);
        session.setAttribute("bottom", bottom);
        for(Cupcake c :cart.getCupcakes()) {
            System.out.println(c.getTopping().getName());
        }

        return "shopcupcakepage";
    }
}
