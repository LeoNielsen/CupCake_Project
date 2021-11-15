package web.commands;

import business.exceptions.UserException;
import business.persistence.Database;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Command
{
    //Return a token string from the execute method to make a client side redirect,
    // instead of a server side (forward) redirect
    public final static String REDIRECT_INDICATOR = "#*redirect*#_###_";
    public final static String WAS_NOT_FOUND_COMMAND ="404_NOT_FOUND";

    private static HashMap<String, Command> commands;
    public static Database database;

    private static void initCommands(Database database)
    {
        commands = new HashMap<>();
        commands.put("index", new CommandUnprotectedPage("index"));
        commands.put("loginpage", new CommandUnprotectedPage("loginpage"));
        commands.put("logincommand", new LoginCommand(""));
        commands.put("logoutcommand", new LogoutCommand(""));
        commands.put("registerpage", new CommandUnprotectedPage("registerpage"));
        commands.put("registercommand", new RegisterCommand(""));
        commands.put("customerpage", new CustomerCommand("", "employee"));
        commands.put("employeepage", new CommandProtectedPage("employeepage", "employee"));
        commands.put("finduspage", new CommandUnprotectedPage("finduspage"));
        commands.put("shoppingcartpage", new CommandUnprotectedPage("shoppingcartpage"));
        commands.put("removefromcartcommand", new RemoveFromCartCommand(""));
        commands.put("shopcupcakepage", new CommandUnprotectedPage("shopcupcakepage"));
        commands.put("shopcupcakecommand", new ShopCupcakeCommand(""));
        commands.put("cupcakecommand", new CupcakeCommand(""));
        commands.put("ordercommand", new OrderCommand("orderrecievedpage","customer"));
        commands.put("paymentcommand", new PaymentCommand(""));
        commands.put("orderrecievedpage", new CommandProtectedPage("orderrecievedpage","customer"));
        commands.put("orderpage", new CommandUnprotectedPage("orderpage")); //TODO: ændre to protected
        commands.put("profilepage", new CommandUnprotectedPage("profilepage")); //TODO: ændre to protected
        commands.put("editprofilepage", new CommandUnprotectedPage("editprofilepage")); //TODO: ændre to protected
        commands.put("customerdetailspage", new CommandUnprotectedPage("customerdetailspage")); //TODO: ændre to protected
        commands.put("orderdetailspage", new CommandUnprotectedPage("orderdetailspage")); //TODO: ændre to protected
        commands.put("paymentpage", new CommandUnprotectedPage("paymentpage")); //TODO: ændre to protected
        commands.put("productpage", new CommandUnprotectedPage("productpage")); //TODO: ændre to protected
        commands.put("editproductpage", new CommandUnprotectedPage("editproductpage")); //TODO: ændre to protected
        commands.put("editorderpage", new CommandUnprotectedPage("editorderpage")); //TODO: ændre to protected
    }

    public static Command fromPath(
            HttpServletRequest request,
            Database db)
    {
        String action = request.getPathInfo().replaceAll("^/+", "");
        System.out.println("--> " + action);

        if (commands == null)
        {
            database = db;
            initCommands(database);
        }

        return commands.getOrDefault(action, new CommandUnknown());   // unknowncommand is default
    }

    public abstract String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws UserException;

}
