package business.persistence;

import business.entities.Order;
import business.entities.User;

import java.sql.*;
import java.util.ArrayList;


public class OrderMapper {

    private Database database;

    public OrderMapper(Database database) {
        this.database = database;
    }

    public void saveOrder(Order order) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO user_order (id_user, status, total_price, order_date) " +
                    "VALUES(?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, order.getUser().getId());
                ps.setString(2, order.getStatus());
                ps.setFloat(3, order.getTotalPrice());
                ps.setTimestamp(4, order.getOrderDate());

                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                order.setId(id);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Order> getAllOrders() throws Exception {
        ArrayList<Order> orders = new ArrayList<>();

        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM user_order ";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int idUser = rs.getInt("id_user");
                    String status = rs.getString("status");
                    float total = rs.getFloat("total_price");
                    Timestamp timestamp = rs.getTimestamp("order_date");

                    Order order = new Order();

                    orders.add(order);
                }
                return orders;
            } catch (Exception e) {
                throw new Exception("Could not find users");
            }
        } catch (SQLException throwables) {
            throw new Exception("Could not find users");
        }
    }


}
