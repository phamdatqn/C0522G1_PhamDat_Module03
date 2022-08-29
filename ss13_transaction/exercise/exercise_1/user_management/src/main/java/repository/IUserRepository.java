package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> displayAllCallable();

    boolean deleteCallable(int id);

    User findByIdCallable(int id);

    void insertUser(User user);

    boolean updateCallable(int id, User user);


}
