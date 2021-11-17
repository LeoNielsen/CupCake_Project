package business.persistence;

import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class UserMapper {
    private Database database;

    public UserMapper(Database database) {
        this.database = database;
    }

    public void createUser(User user) throws UserException {
        //TODO: fix address.
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO users (email, password, role, account_balance, firstname, lastname, phone_nr, street_name, house_nr, user_zipcode, city) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, user.getEmail());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getRole());
                ps.setFloat(4, user.getAccountbalance());
                ps.setString(5, user.getFirstname());
                ps.setString(6, user.getLastname());
                ps.setString(7, user.getPhoneNr());
                ps.setString(8, user.getStreetname());
                ps.setString(9, user.getHouseNr());
                ps.setString(10, user.getZipcode());
                ps.setString(11, user.getCity());
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                user.setId(id);
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException(ex.getMessage());
        }
    }

    public User login(String email, String password) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(2, password);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String phonenr = rs.getString("phone_nr");
                    String streetname = rs.getString("street_name");
                    String housenr = rs.getString("house_nr");
                    String zipcode = rs.getString("user_zipcode");
                    String city = rs.getString("city");
                    int id = rs.getInt("id");
                    float balance = rs.getFloat("account_balance");
                    return new User(id, email, password, role, balance, firstname, lastname, phonenr, streetname, housenr, zipcode, city);
                } else {
                    throw new UserException("Could not validate user");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public boolean updateUser(User user) {
        try (Connection connection = database.connect()) {
            String sql = "UPDATE users " +
                    "SET email = ?, password = ?, firstname = ?, lastname = ?, phone_nr = ?, street_name = ?, house_nr = ?, user_zipcode = ?, city = ? " +
                    "WHERE id = ? ";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirstname());
            ps.setString(4, user.getLastname());
            ps.setString(5, user.getPhoneNr());
            ps.setString(6, user.getStreetname());
            ps.setString(7, user.getHouseNr());
            ps.setString(8, user.getZipcode());
            ps.setString(9, user.getCity());
            ps.setInt(10, user.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            System.out.println("yo");
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean updateBalance(int userId, float balance) throws SQLException {
        try (Connection connection = database.connect()) {
            String sql = "UPDATE users " +
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

    public User getUser (int userid) throws UserException{
        User user = null;
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM users WHERE id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, userid);
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
                    String city = rs.getString("city");
                    user = new User(id, email, password, role, acBalance, firstname,
                            lastname, phoneNr, streetName, houseNr, zipcode, city);
                }
                return user;
            } catch (Exception e) {
                throw new UserException("Could not find users");
            }
        } catch (SQLException throwables) {
            throw new UserException("Could not find users");
        }
    }


    public ArrayList<User> getAllUsers() throws UserException {
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
                    String city = rs.getString("city");
                    User user = new User(id, email, password, role, acBalance, firstname,
                            lastname, phoneNr, streetName, houseNr, zipcode, city);

                    users.add(user);
                }
                return users;
            } catch (Exception e) {
                throw new UserException("Could not find users");
            }
        } catch (SQLException throwables) {
            throw new UserException("Could not find users");
        }
    }

    public int getTotalUserOrderCount(User user) {
        int orderCount = 0;

        try (Connection connection = database.connect()) {
            String sql = "select count(id_user) from user_order where id_user = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, user.getId());
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    orderCount = rs.getInt(1);
                }

                return orderCount;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return orderCount;
    }
}