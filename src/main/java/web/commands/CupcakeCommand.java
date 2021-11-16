package web.commands;

import business.entities.Bottom;
import business.entities.Topping;
import business.exceptions.UserException;
import business.services.BottomFacade;
import business.services.ToppingFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class CupcakeCommand extends CommandUnprotectedPage {
    public CupcakeCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        ToppingFacade toppingFacade = new ToppingFacade(database);
        BottomFacade bottomFacade = new BottomFacade(database);

        ArrayList<Topping> toppings = toppingFacade.getAllToppings();
        ArrayList<Bottom> bottoms = bottomFacade.getAllBottoms();

        request.getServletContext().setAttribute("toppings", toppings);
        request.getServletContext().setAttribute("bottoms", bottoms);

        return "shopcupcakepage";
    }
}
