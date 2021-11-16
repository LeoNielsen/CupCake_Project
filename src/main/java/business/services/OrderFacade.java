package business.services;

import business.entities.Cupcake;
import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.persistence.Database;
import business.persistence.OrderMapper;

import java.sql.SQLException;
import java.util.ArrayList;


public class OrderFacade {
    OrderMapper orderMapper;

    public OrderFacade(Database database) {
        orderMapper = new OrderMapper(database);
    }

    public Order saveOrder(ArrayList<Cupcake> cupcakes, User user, String status, float totalprice) {
        Order order = new Order(cupcakes, user, status, totalprice);
        orderMapper.saveOrder(order);
        return order;
    }

    public ArrayList<Order> getAllUserOrders(User user) throws UserException {
        ArrayList<Order> orders = new ArrayList<>();
        ArrayList<Integer> idOrders;
        try {
            idOrders = orderMapper.getOrderId(user.getId());
            for (int id : idOrders) {
                ArrayList<Cupcake> cupcakes = orderMapper.getAllCupcake(id);
                Order order = orderMapper.getAllOrdersUser(id, user, cupcakes);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return orders;
    }

    public Order getOrder(User user, int orderId) {
        Order order = null;
        try {
            ArrayList<Cupcake> cupcakes = orderMapper.getAllCupcake(orderId);
            order = orderMapper.getAllOrdersUser(orderId, user, cupcakes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public ArrayList<Order> getAllOrders(ArrayList<User> users) throws UserException {
        ArrayList<Order> orders = new ArrayList<>();
        for (User user : users) {

            orders.addAll(getAllUserOrders(user));
        }

        return orders;

    }

    public boolean updateOrder(int orderId, String status, float totalPrice, String bottom, String topping, int quantity) throws SQLException
    {
        return orderMapper.updateOrder(orderId,status,totalPrice,bottom,topping,quantity);
    }


}
