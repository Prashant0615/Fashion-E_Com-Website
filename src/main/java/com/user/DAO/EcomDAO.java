/*package com.user.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping;
import java.util.List;

import com.user.model.User;


public class EcomDAO {

    private String jdbcURL="jdbc:mysql://localhost:3306/userdb";
    private String jdbcUserName="root";
    private String jdbcPassword="L@m6ni9090";

    private static final String INSERT_USERS_SQL="INSERT INTO Customers"+"(name,email,mobile,passwd) VALUES"+"(?,?,?,?);";
    private static final String SELECT_USER_BY_ID="SELECT* from Customers where id=?;";
    private static final String SELECT_ALL_USERS="select * from Customers;";
    private static final String DELETE_USERS_SQL="delete from Customers where id=?;";
    private static final String UPDATE_USRES_SQL="update Customers set name=?,email=?,mobile=?,passwd=? where id=?;";

     public EcomDAO(){

     }

     public Connection getConnection(){
        Connection connection=null;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return connection;
     }

     public void resetAutoIncrement() {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("ALTER TABLE Customers AUTO_INCREMENT = 1;")) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

     public void insertUser(User user){
         EcomDAO dao=new EcomDAO();
         try(Connection connection=dao.getConnection())
         {
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getname());
            preparedStatement.setString(2,user.getemail());
            preparedStatement.setInt(3,user.getmobile());
            preparedStatement.setString(4,user.getpassword());

            preparedStatement.executeUpdate();
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }
     }

     public User selectUser(int id){
        User user=new User();
        EcomDAO dao=new EcomDAO();
        try(Connection connection=dao.getConnection())
        {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);

            ResultSet resultSet=preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User(
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getInt("mobile"),
                        resultSet.getString("passwd")
                );
            }

            /*user.setname(resultSet.getString("name"));
            user.setemail(resultSet.getString("email"));
            user.setmobile(resultSet.getInt("mobile"));
            user.setpassword(resultSet.getString("passwd"));
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return user;
     }

     public List<User> selectAllUsers(){
        List<User> users=new ArrayList<User>();
        EcomDAO dao=new EcomDAO();
        try(Connection connection=dao.getConnection())
        {
           PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_USERS);
           ResultSet resultSet=preparedStatement.executeQuery();

           while(resultSet.next()){
            //int id=resultSet.getInt("id");
            String uname=resultSet.getString("uname");
            String email=resultSet.getString("email");
            int mobile=resultSet.getInt("mobile");
            String password=resultSet.getString("passwd");

            users.add(new User(uname,email,mobile,password));
           }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return users;
     }

     public boolean deleteUser(int id){
        boolean status=false;
        EcomDAO dao=new EcomDAO();
        try(Connection connection=dao.getConnection())
        {
          PreparedStatement preparedStatement=connection.prepareStatement(DELETE_USERS_SQL);
          preparedStatement.setInt(1,id);

          status=preparedStatement.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return status;
     }

     public boolean updateUser(User user){
        boolean status=false;
        EcomDAO dao=new EcomDAO();
        try(Connection connection=dao.getConnection())
        {
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USRES_SQL);
            preparedStatement.setString(1,user.getname());
            preparedStatement.setString(2,user.getemail());
            preparedStatement.setInt(3,user.getmobile());
            preparedStatement.setString(4,user.getpassword());

            status=preparedStatement.executeUpdate()>0;
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }
        return status;
     }
     

     public static void main(String[] args){
        EcomDAO dao=new EcomDAO();
        if(dao.getConnection()!=null)
        {
            System.out.println("Sucessfully Connected");
        }
        else
        {
            System.out.println("Problem in database connection");
        }

        User user1=new User("test1","test@abc.com",897898901,"AAb@1234");
        User user2=new User("test2","test2ret@gamil.com",990288789,"testml123@");
        //dao.insertUser(user2);
        //dao.deleteUser(3);
     }
} 
*/