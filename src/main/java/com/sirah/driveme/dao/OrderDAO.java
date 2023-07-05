package com.sirah.driveme.dao;

import com.sirah.driveme.models.Order;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class OrderDAO {
    private static ArrayList<Order> orders = null;

    //get orders from orders data file
    public static ArrayList<Order> getOrders(String path)
    {
        orders = new ArrayList<Order>();
        File file = new File(path);
        try
        {
            BufferedReader in = new BufferedReader( new FileReader(file));

            String line = in.readLine();
            while (line != null)
            {
                StringTokenizer t = new StringTokenizer(line, "|");
                if (t.countTokens() >= 13)
                {
                     String id = t.nextToken();
                     String clientId = t.nextToken();
                     String title = t.nextToken();
                     String shortDesc = t.nextToken();
                     String longDesc = t.nextToken();
                     String expertise = t.nextToken();
                     String vehicleType = t.nextToken();
                     String experience = t.nextToken();
                     String ageRange = t.nextToken();
                     double pay = Double.parseDouble(t.nextToken());
                     String uploadDate = t.nextToken();
                     String deadline = t.nextToken();
                     String status = t.nextToken();

                    Order order = new Order( id,  clientId,  title,  shortDesc,  longDesc,  expertise,  vehicleType,  experience,  ageRange,  pay,  uploadDate,  deadline,  status);
                    orders.add(order);
                }
                line = in.readLine();
            }
            in.close();
            return orders;
        }
        catch(IOException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static Order getOrder(String orderId, String path)
    {
        orders = getOrders(path);
        for (Order order : orders)
        {
            if (orderId != null &&
                    orderId.equalsIgnoreCase(order.getId()))
            {
                return order;
            }
        }
        return null;
    }

    public static ArrayList<Order> getOrdersByClientId(String clientId, String path)
    {
        orders = getOrders(path);
        ArrayList<Order> clientOrders = new ArrayList<>();
        
        for (Order order : orders)
        {
            if (clientId != null &&
                    clientId.equalsIgnoreCase(order.getClientId()))
            {
                clientOrders.add(order);
            }
        }
        return clientOrders;
    }

    private static boolean saveOrders(ArrayList<Order> orders, String path)
    {
        boolean saved = false;
        try
        {
            File file = new File(path);
            PrintWriter out = new PrintWriter( new FileWriter(file));

            for (Order order : orders)
            {
                out.println(order.toString());
            }
            saved = true;
            out.close();
        }
        catch(IOException e)
        {
            saved = false;
            e.printStackTrace();
        }
        return saved;
    }

    //add new order
    public static boolean insert(Order order, String path)
    {
        //get existing orders
        orders = getOrders(path);
        //add order to list
        orders.add(order);
        //save new order list
        return saveOrders(orders, path);
    }

    //update order
    public static boolean update(Order order, String path)
    {
        orders = getOrders(path);
        for (int i = 0; i < orders.size(); i++)
        {
            Order u = orders.get(i);
            if (order.getId() != null &&
                    order.getId().equalsIgnoreCase(u.getId()))
            {
                orders.set(i, order);
            }
        }
        return saveOrders(orders, path);
    }

    //delete a order
    public static boolean delete(Order order, String path)
    {
        orders = getOrders(path);
        for (int i = 0; i < orders.size(); i++)
        {
            Order u = orders.get(i);
            if (order != null &&
                    order.getId().equalsIgnoreCase(u.getId()))
            {
                orders.remove(i);
            }
        }
        return saveOrders(orders, path);
    }

}
