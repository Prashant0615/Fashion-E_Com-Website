import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean addUser(String name, String email, String password) throws SQLException {
        String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            return pst.executeUpdate() > 0;
        }
    }

    public boolean userExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            rs.next();
            return rs.getInt(1) > 0;
        }
    }
}
