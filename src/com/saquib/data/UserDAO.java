package com.saquib.data;

import java.io.InputStream;

import com.saquib.model.User;

public interface UserDAO {
 public void addUser(User user) throws Exception;
 public User getUser(String userID)throws Exception;
 public void updatePhoto(String userId,InputStream inputStream) throws Exception;

}
