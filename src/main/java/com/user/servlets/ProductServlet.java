package com.user.servlets;

import com.user.DAO.CategoryDao;
import com.user.DAO.ProductDao;
import com.user.entities.Category;
import com.user.entities.Product;
import com.user.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

@MultipartConfig
public class ProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionFactory factory = FactoryProvider.getfactory();
        Session session = factory.openSession();

        String message = null;  // To hold success or error messages

        try {
            String open = request.getParameter("Open");

            if ("Add Product".equalsIgnoreCase(open)) {
                String pName = request.getParameter("productName");
                String pDesc = request.getParameter("productDescription");
                String priceParam = request.getParameter("productPrice");
                String discountParam = request.getParameter("productDiscount");
                String quantityParam = request.getParameter("productQuantity");
                String catIdParam = request.getParameter("categoryId");

                if (pName != null && pDesc != null && priceParam != null && discountParam != null
                        && quantityParam != null && catIdParam != null) {
                    try {
                        int pPrice = Integer.parseInt(priceParam);
                        int pDisc = Integer.parseInt(discountParam);
                        int pQuantity = Integer.parseInt(quantityParam);
                        int catId = Integer.parseInt(catIdParam);
                        
                        Part part = request.getPart("productImage");
                        // Save the image and get its path (update this method to handle image saving)
                        String imagePath = saveImage(part);

                        Product p = new Product();
                        p.setpName(pName);
                        p.setpDisc(pDesc);
                        p.setpPrice(pPrice);
                        p.setpDiscount(pDisc);
                        p.setpQuantity(pQuantity);
                        p.setpPhoto(imagePath); // Save the image path or filename

                        // Get category by ID
                        CategoryDao cDao = new CategoryDao(factory);
                        Category category = cDao.getCategoryById(catId);
                        p.setCategory(category);

                        // ProductDao
                        ProductDao pDao = new ProductDao(factory);
                        session.beginTransaction();
                        pDao.saveProduct(p);
                        
                        session.getTransaction().commit();
                        message = "Product saved successfully with name: " + pName; // Set success message
                    } catch (Exception e) {
                        if (session.getTransaction() != null) {
                            session.getTransaction().rollback();
                        }
                        e.printStackTrace();
                        message = "Error saving product: " + e.getMessage(); // Set error message
                    }
                } else {
                    message = "Product details are missing.";
                }
            } else {
                message = "Operation is not defined for products.";
            }
        } finally {
            session.close();
        }

        // Fetch total products to display on admin page
        List<Product> products = new ProductDao(factory).getAllProducts();
        int totalProducts = products.size();

        // Set message and total products as request attributes
        request.setAttribute("message", message);
        request.setAttribute("totalProducts", totalProducts);
        // Forward the request to admin.jsp
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }

    private String saveImage(Part part) throws IOException {
        String fileName = part.getSubmittedFileName();
        // Update this path to your desired directory where images will be saved
        String imagePath = "C:/apache-tomcat-8.5.99/webapps/yourapp/images/" + fileName; 
        File file = new File(imagePath);
        part.write(file.getAbsolutePath()); // Save the uploaded file
        return imagePath; // Return the path where the image is saved
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Product Operation Servlet";
    }
}

