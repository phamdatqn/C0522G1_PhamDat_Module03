package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> displayAll();

    boolean delete(int id);

    User findById(int id);


    boolean update(int id, User user);




}
