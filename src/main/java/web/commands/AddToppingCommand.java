package web.commands;

import business.entities.Topping;
import business.services.ToppingFacade;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AddToppingCommand extends CommandProtectedPage {

    ToppingFacade toppingFacade;

    public AddToppingCommand(String pageToShow, String role) {
        super(pageToShow, role);
        toppingFacade = new ToppingFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String toppingName = request.getParameter("name");
        float toppingPrice = Float.parseFloat(request.getParameter("price"));

        ArrayList<Topping> toppings = (ArrayList<Topping>) request.getServletContext().getAttribute("toppings");
        toppings.add(toppingFacade.saveTopping(toppingName,toppingPrice));
        request.getServletContext().setAttribute("toppings",toppings);

        return "editproducttoppingpage";

    }
}
