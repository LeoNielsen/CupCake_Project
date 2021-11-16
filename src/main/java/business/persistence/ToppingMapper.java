package business.persistence;

import business.entities.Topping;

import java.sql.*;
import java.util.ArrayList;

public class ToppingMapper {

    private Database database;

    public ToppingMapper(Database database) {
        this.database = database;
    }

    public void saveTopping(Topping topping) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO order (name, price) " +
                    "VALUES(?,?) ON DUPLICATE KEY UPDATE price=?";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, topping.getName());
                ps.setFloat(2, topping.getPrice());

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Topping getToppping(String name) throws Exception {

        try (Connection connection = database.connect()) {
            String sql = "SELECT price FROM topping WHERE name=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    float price = rs.getFloat("price");

                    Topping topping = new Topping(name, price);
                    return topping;
                } else {
                    throw new Exception("Cloud not validate Topping");
                }
            } catch (Exception e) {
                throw new Exception("Cloud not validate Topping");
            }
        } catch (SQLException throwables) {
            throw new Exception("Cloud not validate Topping");
        }
    }

    public ArrayList<Topping> getAllToppings() throws Exception {
        ArrayList<Topping> toppings = new ArrayList<>();

        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM topping";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    toppings.add(new Topping(name, price));
                }
                return toppings;
            } catch (Exception e) {
                throw new Exception("Cloud not validate Topping");
            }
        } catch (SQLException throwables) {
            throw new Exception("Cloud not validate Topping");
        }
    }


}
