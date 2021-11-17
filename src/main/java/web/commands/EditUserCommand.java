package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditUserCommand extends CommandUnprotectedPage{

    UserFacade userFacade;

    public EditUserCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        HttpSession session = request.getSession();
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phonenr = request.getParameter("phonenr");
        String streetname = request.getParameter("streetname");
        String housenr = request.getParameter("housenr");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");

        User user = (User) session.getAttribute("user");
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setPhoneNr(phonenr);
        user.setStreetname(streetname);
        user.setHouseNr(housenr);
        user.setCity(city);
        user.setZipcode(zipcode);

        userFacade.updateUser(user);

        return "profilepage";
    }
}
