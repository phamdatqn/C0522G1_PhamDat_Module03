package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> displayAll();

    boolean delete(int id);

    User findById(int id);

    List<User> findCountry(String name);

    boolean update(int id, User user);

    void create(User user);

    List<User> sortIncrease();

    User getUserById(int id);

    void insertUser(User user);

    void addUserTransaction(User user,int[] permission);
}
