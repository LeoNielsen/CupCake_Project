package business.services;

import business.entities.Cupcake;
import business.entities.Order;
import business.entities.User;
import business.persistence.Database;
import business.persistence.OrderMapper;

import java.util.ArrayList;


public class OrderFacade {
    OrderMapper orderMapper;

    public OrderFacade(Database database)
    {
        orderMapper = new OrderMapper(database);
    }

    public Order saveOrder(ArrayList<Cupcake> cupcakes, User user, String status, float totalprice){
        Order order = new Order(cupcakes,user,status, totalprice);
        orderMapper.saveOrder(order);
        return order;
    }



}
