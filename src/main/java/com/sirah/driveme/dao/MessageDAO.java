package com.sirah.driveme.dao;

import com.sirah.driveme.models.Message;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class MessageDAO {
    private static ArrayList<Message> messages = null;

    //get messages from messages data file
    public static ArrayList<Message> getMessages(String path)
        {
            messages = new ArrayList<Message>();
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
                        String email = t.nextToken();
                        String msgText = t.nextToken();
                        String status = t.nextToken();

                        Message message = new Message(id, firstName, lastName, email, msgText, status);
                        messages.add(message);
                    }
                    line = in.readLine();
                }
                in.close();
                return messages;
            }
            catch(IOException e)
            {
                e.printStackTrace();
                return null;
            }
        }

        public static Message getMessage(String messageId, String path)
        {
            messages = getMessages(path);
            for (Message message : messages)
            {
                if (messageId != null &&
                        messageId.equalsIgnoreCase(message.getId()))
                {
                    return message;
                }
            }
            return null;
        }


    public static Message getMessageByEmail(String email, String path)
    {
        messages = getMessages(path);
        for (Message message : messages)
        {
            if (email != null &&
                    email.equalsIgnoreCase(message.getEmail()))
            {
                return message;
            }
        }
        return null;
    }

        private static boolean saveMessages(ArrayList<Message> messages, String path)
        {
            boolean saved = false;
            try
            {
                File file = new File(path);
                PrintWriter out = new PrintWriter( new FileWriter(file));

                for (Message message : messages)
                {
                    out.println(message.toString());
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

        //add new message
        public static boolean insert(Message message, String path)
        {
            //get existing messages
            messages = getMessages(path);
            //add message to list
            messages.add(message);
            //save new message list
            return saveMessages(messages, path);
        }

        //update message
        public static boolean update(Message message, String path)
        {
            messages = getMessages(path);
            for (int i = 0; i < messages.size(); i++)
            {
                Message u = messages.get(i);
                if (message.getId() != null &&
                        message.getId().equalsIgnoreCase(u.getId()))
                {
                    messages.set(i, message);
                }
            }
            return saveMessages(messages, path);
        }

        //delete a message
        public static boolean delete(Message message, String path)
        {
            messages = getMessages(path);
            for (int i = 0; i < messages.size(); i++)
            {
                Message u = messages.get(i);
                if (message != null &&
                        message.getId().equalsIgnoreCase(u.getId()))
                {
                    messages.remove(i);
                }
            }
            return saveMessages(messages, path);
        }

}
