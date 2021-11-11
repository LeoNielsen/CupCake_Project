package web.commands;

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
        HttpSession session = request.getSession();

        ToppingFacade toppingFacade = new ToppingFacade(database);
        BottomFacade bottomFacade = new BottomFacade(database);

        ArrayList<String> toppings = toppingFacade.getAllToppings();
        ArrayList<String> bottoms = bottomFacade.getAllBottoms();

        session.setAttribute("toppings", toppings);
        session.setAttribute("bottoms", bottoms);

        return "shopcupcakepage";
    }
}
