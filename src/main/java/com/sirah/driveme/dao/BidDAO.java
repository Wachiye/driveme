package com.sirah.driveme.dao;

import com.sirah.driveme.models.Bid;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class BidDAO {
    private static ArrayList<Bid> bids = null;

    //get bids from bids data file
    public static ArrayList<Bid> getBids(String path)
    {
        bids = new ArrayList<Bid>();
        File file = new File(path);
        try
        {
            BufferedReader in = new BufferedReader( new FileReader(file));

            String line = in.readLine();
            while (line != null)
            {
                StringTokenizer t = new StringTokenizer(line, "|");
                if (t.countTokens() >= 7)
                {
                    String id = t.nextToken();
                    String driverId = t.nextToken();
                    String orderId = t.nextToken();
                    String profile = t.nextToken();
                    String bidDate = t.nextToken();
                    String status = t.nextToken();
                    String closureDate = t.nextToken();

                    Bid bid = new Bid(  id,  driverId,  orderId,  profile,  bidDate,  status,  closureDate);
                    bids.add(bid);
                }
                line = in.readLine();
            }
            in.close();
            return bids;
        }
        catch(IOException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static Bid getBid(String bidId, String path)
    {
        bids = getBids(path);
        for (Bid bid : bids)
        {
            if (bidId != null &&
                    bidId.equalsIgnoreCase(bid.getId()))
            {
                return bid;
            }
        }
        return null;
    }
    
    public static ArrayList<Bid> getBidsByDriverId(String driverId, String path)
    {
        bids = getBids(path);
        ArrayList<Bid> driverBids = new ArrayList<>();

        for (Bid bid : bids)
        {
            if (driverId != null &&
                    driverId.equalsIgnoreCase(bid.getDriverId()))
            {
                driverBids.add(bid);
            }
        }
        return driverBids;
    }
    
    public static ArrayList<Bid> getBidsByOrderId(String orderId, String path)
    {
        bids = getBids(path);
        ArrayList<Bid> orderBids = new ArrayList<>();

        for (Bid bid : bids)
        {
            if (orderId != null &&
                    orderId.equalsIgnoreCase(bid.getOrderId()))
            {
                orderBids.add(bid);
            }
        }
        return orderBids;
    }

    private static boolean saveBids(ArrayList<Bid> bids, String path)
    {
        boolean saved = false;
        try
        {
            File file = new File(path);
            PrintWriter out = new PrintWriter( new FileWriter(file));

            for (Bid bid : bids)
            {
                out.println(bid.toString());
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

    //add new bid
    public static boolean insert(Bid bid, String path)
    {
        //get existing bids
        bids = getBids(path);
        //add bid to list
        bids.add(bid);
        //save new bid list
        return saveBids(bids, path);
    }

    //update bid
    public static boolean update(Bid bid, String path)
    {
        bids = getBids(path);
        for (int i = 0; i < bids.size(); i++)
        {
            Bid u = bids.get(i);
            if (bid.getId() != null &&
                    bid.getId().equalsIgnoreCase(u.getId()))
            {
                bids.set(i, bid);
            }
        }
        return saveBids(bids, path);
    }

    //delete a bid
    public static boolean delete(Bid bid, String path)
    {
        bids = getBids(path);
        for (int i = 0; i < bids.size(); i++)
        {
            Bid u = bids.get(i);
            if (bid != null &&
                    bid.getId().equalsIgnoreCase(u.getId()))
            {
                bids.remove(i);
            }
        }
        return saveBids(bids, path);
    }

}
