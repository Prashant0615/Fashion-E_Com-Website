package com.user.DAO;

import com.user.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Method to get all users
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Session session = this.factory.openSession()) {
            Query<User> query = session.createQuery("from User", User.class);
            users = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try (Session session = this.factory.openSession()) { // Use try-with-resources for session management
            String hql = "FROM User WHERE userEmail = :e AND userPassword = :p"; 
            Query<User> q = session.createQuery(hql, User.class); 
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = q.uniqueResult(); 
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return user; 
    }

    // Method to get the total count of users
    public int getUserCount() {
        int count = 0;
        try (Session session = this.factory.openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(u.id) FROM User u", Long.class);
            count = query.uniqueResult().intValue(); // Get the count as an int
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}

