package com.saquib.data;

import com.saquib.model.User;

public interface UserDAO {
 public void addUser(User user) throws Exception;
 public User getUser(String userID)throws Exception;

}
