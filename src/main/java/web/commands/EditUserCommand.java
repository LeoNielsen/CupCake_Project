package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit;

public class EditUserCommand extends CommandUnprotectedPage{

    UserFacade userFacade;

    public EditUserCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        User user;
        HttpSession session = request.getSession();
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phonenr = request.getParameter("phonenr");
        String streetname = request.getParameter("streetname");
        String housenr = request.getParameter("housenr");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("admin"));


        if (isAdmin){
            user = (User) session.getAttribute("seemoreuser");
        } else {
            user = (User) session.getAttribute("user");
        }

        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setPhoneNr(phonenr);
        user.setStreetname(streetname);
        user.setHouseNr(housenr);
        user.setCity(city);
        user.setZipcode(zipcode);

        userFacade.updateUser(user);

        if(isAdmin){
            return "customerdetailspage";
        } else {
            return "profilepage";
        }
    }
}
