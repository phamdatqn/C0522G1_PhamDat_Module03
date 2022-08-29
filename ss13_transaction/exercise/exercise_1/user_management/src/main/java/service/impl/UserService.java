package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private static IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> displayAllCallable() {
        return iUserRepository.displayAllCallable();
    }

    @Override
    public boolean deleteCallable(int id) {
        return iUserRepository.deleteCallable(id);
    }

    @Override
    public User findByIdCallable(int id) {
        return iUserRepository.findByIdCallable(id);
    }

    @Override
    public void insertUser(User user) {
        iUserRepository.insertUser(user);
    }


    @Override
    public boolean updateCallable(int id, User user) {
        return iUserRepository.updateCallable(id, user);
    }

}
