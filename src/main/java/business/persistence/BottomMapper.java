package business.persistence;
import business.entities.Bottom;
import business.entities.Order;
import business.exceptions.UserException;

import java.sql.*;

public class BottomMapper {

    private Database database;

    public BottomMapper(Database database) {
        this.database = database;
    }

    public void saveBottom(Bottom bottom) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO base (name, price) " +
                    "VALUES(?,?) ON DUPLICATE KEY UPDATE price=?";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, bottom.getName());
                ps.setFloat(2, bottom.getPrice());

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Bottom getBottom(String name) throws Exception {
        try (Connection connection = database.connect())
        {
            String sql = "SELECT price FROM base WHERE name=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    float price = rs.getFloat("price");

                    Bottom bottom = new Bottom(name, price);
                    return bottom;
                } else {
                    throw new Exception("Could not find base");
                }
            }
            catch (Exception e) {
                throw new Exception("Could not find base");
            }

        } catch (SQLException throwables) {
            throw new Exception("Could not find base");
        }
    }
}
