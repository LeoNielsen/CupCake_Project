package business.persistence;

import business.entities.Order;

import java.sql.*;


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


}
