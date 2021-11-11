package web.commands;

import business.entities.ShoppingCart;
import business.entities.User;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class PaymentCommand extends CommandUnprotectedPage{
    UserFacade userFacade;
    public PaymentCommand(String pageToShow) {
        super(pageToShow);
        this.userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if(user == null){
            return "loginpage";
        }
        if (cart.getCupcakes().size() == 0){
            return "shoppingcartpage";
        }



        user.setAccountbalance(user.getAccountbalance() - cart.getTotal());

        try
        {
            userFacade.updateBalance(user.getId(), user.getAccountbalance());
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        //TODO: lave betallings side
        return "paymentpage";
    }

}
