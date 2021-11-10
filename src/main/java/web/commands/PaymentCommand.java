package web.commands;

import business.entities.ShoppingCart;
import business.entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PaymentCommand extends CommandUnprotectedPage{
    public PaymentCommand(String pageToShow) {
        super(pageToShow);
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

        //TODO: lave betallings side
        return "paymentpage";
    }

}
