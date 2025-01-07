import com.example.dao.UserDao;

public class UserService {
    private UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public boolean registerUser(String name, String email, String password) throws SQLException {
        if (userDao.userExists(email)) {
            throw new IllegalArgumentException("User with this email already exists");
        }
        return userDao.addUser(name, email, password);
    }
}
