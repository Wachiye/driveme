package com.sirah.driveme.dao;

import com.sirah.driveme.models.User;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class UserDAO {
    private static ArrayList<User> users = null;

    //get users from users data file
    public static ArrayList<User> getUsers(String path)
        {
            users = new ArrayList<User>();
            File file = new File(path);
            try
            {
                BufferedReader in = new BufferedReader( new FileReader(file));

                String line = in.readLine();
                while (line != null)
                {
                    StringTokenizer t = new StringTokenizer(line, "|");
                    if (t.countTokens() >= 6)
                    {
                        String id = t.nextToken();
                        String firstName = t.nextToken();
                        String lastName = t.nextToken();
                        String username = t.nextToken();
                        String email = t.nextToken();
                        String password = t.nextToken();
                        String userType = t.nextToken();

                        User user = new User(id, firstName, lastName, username, email, password, userType);
                        users.add(user);
                    }
                    line = in.readLine();
                }
                in.close();
                return users;
            }
            catch(IOException e)
            {
                e.printStackTrace();
                return null;
            }
        }

        public static User getUser(String userId, String path)
        {
            users = getUsers(path);
            for (User user : users)
            {
                if (userId != null &&
                        userId.equalsIgnoreCase(user.getId()))
                {
                    return user;
                }
            }
            return null;
        }
        public static User getUserByUsername(String username, String path)
        {
            users = getUsers(path);
            for (User user : users)
            {
                if (username != null &&
                        username.equalsIgnoreCase(user.getUsername()))
                {
                    return user;
                }
            }
            return null;
        }

    public static User getUserByEmail(String email, String path)
    {
        users = getUsers(path);
        for (User user : users)
        {
            if (email != null &&
                    email.equalsIgnoreCase(user.getEmail()))
            {
                return user;
            }
        }
        return null;
    }
        public static boolean usernameExists(String username, String path)
        {
            users = getUsers(path);
            for (User user : users)
            {
                if (username != null && username.equalsIgnoreCase(user.getUsername()))
                {
                    return true;
                }
            }
            return false;
        }

    public static boolean emailExists(String email, String path)
    {
        users = getUsers(path);
        if(users.size() < 1)
            return false;
        for (User user : users)
        {
            if (email != null && email.equalsIgnoreCase(user.getEmail()))
            {
                return true;
            }
        }
        return false;
    }

        private static boolean saveUsers(ArrayList<User> users, String path)
        {
            boolean saved = false;
            try
            {
                File file = new File(path);
                PrintWriter out = new PrintWriter( new FileWriter(file));

                for (User user : users)
                {
                    out.println(user.toString());
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

        //add new user
        public static boolean insert(User user, String path)
        {
            //get existing users
            users = getUsers(path);
            //add user to list
            users.add(user);
            //save new user list
            return saveUsers(users, path);
        }

        //update user
        public static boolean update(User user, String path)
        {
            users = getUsers(path);
            for (int i = 0; i < users.size(); i++)
            {
                User u = users.get(i);
                if (user.getId() != null &&
                        user.getId().equalsIgnoreCase(u.getId()))
                {
                    users.set(i, user);
                }
            }
            return saveUsers(users, path);
        }

        //delete a user
        public static boolean delete(User user, String path)
        {
            users = getUsers(path);
            for (int i = 0; i < users.size(); i++)
            {
                User u = users.get(i);
                if (user != null &&
                        user.getId().equalsIgnoreCase(u.getId()))
                {
                    users.remove(i);
                }
            }
            return saveUsers(users, path);
        }

}
