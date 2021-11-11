package web.commands;

import business.exceptions.UserException;
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

        ArrayList<String> toppings = toppingFacade.getAllToppings();

        session.setAttribute("toppings", toppings);

        return "shopcupcakepage";
    }
}
