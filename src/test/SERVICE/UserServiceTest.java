import org.junit.jupiter.api.*;
import org.mockito.*;

import java.sql.SQLException;
import com.example.service.UserService; // Add this import statement

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class UserServiceTest {
    private UserService userService;
    private UserDao mockUserDao;

    @BeforeEach
    void setup() {
        mockUserDao = mock(UserDao.class); // Mock the DAO
        userService = new UserService(mockUserDao);
    }

    @Test
    void testRegisterUser_Success() throws SQLException {
        when(mockUserDao.userExists("john@example.com")).thenReturn(false);
        when(mockUserDao.addUser("John Doe", "john@example.com", "password123")).thenReturn(true);

        boolean result = userService.registerUser("John Doe", "john@example.com", "password123");

        assertTrue(result, "User should be registered successfully");
        verify(mockUserDao).userExists("john@example.com");
        verify(mockUserDao).addUser("John Doe", "john@example.com", "password123");
    }

    @Test
    void testRegisterUser_AlreadyExists() throws SQLException {
        when(mockUserDao.userExists("john@example.com")).thenReturn(true);

        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            userService.registerUser("John Doe", "john@example.com", "password123");
        });

        assertEquals("User with this email already exists", exception.getMessage());
        verify(mockUserDao).userExists("john@example.com");
        verify(mockUserDao, never()).addUser(anyString(), anyString(), anyString());
    }
}
