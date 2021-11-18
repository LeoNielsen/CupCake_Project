package web.commands;

import business.entities.Bottom;
import business.entities.Topping;
import business.services.BottomFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AddBottomCommand extends CommandProtectedPage {

    BottomFacade bottomFacade;

    public AddBottomCommand(String pageToShow, String role) {
        super(pageToShow, role);
        bottomFacade = new BottomFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String bottomName = request.getParameter("name");
        float bottomPrice = Float.parseFloat(request.getParameter("price"));

        ArrayList<Bottom> bottoms = (ArrayList<Bottom>) request.getServletContext().getAttribute("bottoms");
        bottoms.add(bottomFacade.saveBottom(bottomName,bottomPrice));
        request.getServletContext().setAttribute("bottoms",bottoms);

        return "editproductbottompage";
    }
}
