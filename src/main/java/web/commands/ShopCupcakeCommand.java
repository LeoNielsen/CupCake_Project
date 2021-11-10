package web.commands;

import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShopCupcakeCommand extends CommandUnprotectedPage{
    public ShopCupcakeCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String topping = request.getParameter("topping");
        String bottom = request.getParameter("bottom");

        try {
            HttpSession session = request.getSession();
            session.setAttribute("topping", topping);
            session.setAttribute("bottom", bottom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "shopcupcakepage";
    }
}
