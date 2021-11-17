package business.persistence;

import business.entities.Cupcake;
import business.entities.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CupcakeMapper {

    private Database database;

    public CupcakeMapper(Database database) {
        this.database = database;
    }

    public void saveCupcakes(Order order) {

        List<Cupcake> cupcakes = order.getCupcakes();

        try (Connection connection = database.connect()) {

            for (Cupcake cupcake : cupcakes) {
                String sql = "INSERT INTO cupcake (id_order, base_name, topping_name, quantity, cupcake_total_price) " +
                        "VALUES(?,?,?, ?,?)";

                try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, order.getId());
                    ps.setString(2, cupcake.getBottom().getName());
                    ps.setString(3, cupcake.getTopping().getName());
                    ps.setInt(4, cupcake.getQuantity());
                    ps.setFloat(5, cupcake.getTotal());

                    ps.executeUpdate();

                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
