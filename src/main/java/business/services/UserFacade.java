package business.services;

import business.entities.User;
import business.persistence.Database;
import business.persistence.UserMapper;
import business.exceptions.UserException;

import java.sql.SQLException;
import java.util.ArrayList;

public class UserFacade
{
    UserMapper userMapper;

    public UserFacade(Database database)
    {
        userMapper = new UserMapper(database);
    }

    public User login(String email, String password) throws UserException
    {
        return userMapper.login(email, password);
    }

    public User createUser(String email, String password, String firstname, String lastname, String streetname, String houseNr, String zipcode, String city, String phoneNr) throws UserException
    {
        User user = new User(email, password, "customer",0,firstname, lastname, streetname, houseNr, zipcode, city, phoneNr);
        userMapper.createUser(user);
        return user;
    }

    public boolean updateBalance(int userId, float balance)throws SQLException
    {
        return userMapper.updateBalance(userId, balance);
    }

    public boolean updateUser(User user) throws UserException {
        return userMapper.updateUser(user);
    }

    public User getUser(int id) throws UserException {
        return userMapper.getUser(id);
    }

    public ArrayList<User> getAllUsers() throws UserException
    {
        ArrayList<User> users = userMapper.getAllUsers();
        for (User user : users) {
            user.setTotalOrders(getTotalUserOrderCount(user));
        }
        return users;
    }

    public int getTotalUserOrderCount(User user){
        return userMapper.getTotalUserOrderCount(user);
    }

}
