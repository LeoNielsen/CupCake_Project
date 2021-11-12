package business.persistence;

import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class UserMapper
{
    private Database database;

    public UserMapper(Database database)
    {
        this.database = database;
    }

    public void createUser(User user) throws UserException
    {
        //TODO: fix address.
        try (Connection connection = database.connect())
        {
            String sql = "INSERT INTO users (email, password, role, account_balance, firstname, lastname, phone_nr, street_name, house_nr, user_zipcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, user.getEmail());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getRole());
                ps.setFloat(4, user.getAccountbalance());
                ps.setString(5, user.getFirstname());
                ps.setString(6, user.getLastname());
                ps.setString(7, user.getPhoneNr());
                ps.setString(8, user.getStreename());
                ps.setString(9, user.getHouseNr());
                ps.setString(10, user.getZipcode());
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                user.setId(id);
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }

    public User login(String email, String password) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "SELECT id, role, firstname, account_balance FROM users WHERE email=? AND password=?";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(2, password);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    String role = rs.getString("role");
                    String firstname = rs.getString("firstname");
                    int id = rs.getInt("id");
                    float balance = rs.getFloat("account_balance");
                    User user = new User(email, password, role, firstname);
                    user.setId(id);
                    user.setAccountbalance(balance);
                    return user;
                } else
                {
                    throw new UserException("Could not validate user");
                }
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
    }

    public boolean updateBalance(int userId, float balance) throws SQLException {
        try (Connection connection = database.connect()) {
            String sql = "UPDATE users "+
                    "SET account_balance = ? " +
                    "WHERE id = ? ";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, balance);
            ps.setInt(2, userId);
            ps.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            System.out.println("yo");
            throwables.printStackTrace();
        }
        return false;
    }

    public ArrayList<User> getAllUsers() throws Exception {
        ArrayList<User> users = new ArrayList<>();

        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM users ";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    float acBalance = rs.getFloat("account_balance");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String phoneNr = rs.getString("phone_nr");
                    String streetName = rs.getString("street_name");
                    String houseNr = rs.getString("house_nr");
                    String zipcode = rs.getString("user_zipcode");
                    User user = new User(id, email, password, role, acBalance, firstname,
                            lastname, phoneNr, streetName, houseNr, zipcode);

                    users.add(user);
                }
                return users;
            } catch (Exception e) {
                throw new Exception("Could not find users");
            }
        } catch (SQLException throwables) {
            throw new Exception("Could not find users");
        }
    }

}
