<%@page import="java.util.List"%>
<%@page import="com.user.DAO.CategoryDao"%>
<%@page import="com.user.helper.FactoryProvider"%>
<%@page import="com.user.entities.User"%>
<%@page import="com.user.entities.Category"%>

<%
    User user1 = (User) session.getAttribute("user");

    // Fetch categories from the database
    CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
    List<Category> categoryList = cdao.getAllCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ICONIC STYLES</title>

    <style>
        /* Custom styles for category dropdown */
        .dropdown-item {
            color: green !important;
        }

        .dropdown-item:hover {
            color: white;
            background-color: red;
        }

        /* Custom styles for the Home icon */
        .home-link {
            font-size: 30px;
            margin-left: 20px;
        }

        .home-link:hover {
            color: #28a745;
        }
    </style>

    <!-- Bootstrap CSS -->
    <!-- Add FontAwesome CDN for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

<!-- Navbar with Home Icon -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg">
    <a class="navbar-brand" href="Shop.jsp">HobbyLobby</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a href="index.jsp" class="nav-link home-link" title="Home"><i class="fas fa-home"></i></a>
            </li>
            <li class="nav-item dropdown mt-3">
                <a class="nav-link dropdown-toggle" href="Shop.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Category
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <% for (Category category : categoryList) { %>
                        <a class="dropdown-item" href="Shop.jsp?cate=<%= category.getCategoryId()%>">
                            <%= category.getCategoryTitle() %>
                        </a>
                    <% } %>
                </div>
            </li>
        </ul>

        <!-- Search Form in Navbar -->
        

        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:30px;"></i> <span class="cart-item">(0)</span></a>
            </li>
            
            
            <!<!-- REgiter of login -->

           
            
        </ul>
         <form class="form-inline my-2 my-lg-0" action="Shop.jsp" method="GET">
            <input class="form-control mr-sm-2" type="search" name="searchQuery" placeholder="Search for products" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

    </div>
</nav>

<!-- Cart Modal -->
<div class="modal fade" id="cart" tabindex="-1" aria-labelledby="cartLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cartLabel">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body cart-body">
                <h3>Cart is empty.</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout-btn disable">Proceed to Checkout</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap and jQuery JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>
// Function to add product to cart or update quantity if it's already in the cart
function add_to_cart(pid, pname, pprice) {
    // Retrieve existing cart from localStorage
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Check if the product is already in the cart
    let existingProduct = cart.find(item => item.objectId === pid);

    if (existingProduct) {
        // Product already in cart, increment the quantity
        existingProduct.objectQuantity += 1;
        console.log(`${pname} quantity increased in the cart.`);
    } else {
        // Product is not in cart, add it
        let newProduct = {
            objectId: pid,
            objectname: pname,
            objectQuantity: 1,
            objectprice: pprice
        };
        cart.push(newProduct);
    }

    // Save the updated cart back to localStorage
    localStorage.setItem("cart", JSON.stringify(cart));

    // Optional: Show a message or update the UI
    alert(`${pname} has been added to your cart.`);
    updateCart(); // Update cart display
}

// Function to update the cart status and UI (disable checkout button if empty)
function updateCart() {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    if (cart.length === 0) {
        console.log("Cart is empty.");
        $(".cart-item").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items.</h3>");
        $(".checkout-btn").addClass('disable'); // Disable the checkout button
    } else {
        console.log("Cart contains products:", cart);
        $(".cart-item").html(`(${cart.length})`);
        
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
        `;

        let totalPrice = 0;
        
        cart.forEach((item) => {
            table += `
                <tr>
                    <td>${item.objectname}</td>
                    <td>${item.objectprice}</td>
                    <td>${item.objectQuantity}</td>
                    <td>${item.objectQuantity * item.objectprice}</td>
                    <td><button class='btn btn-danger btn-sm' onclick='removeFromCart(${item.objectId})'>Remove</button></td>
                </tr>
            `;
            totalPrice += item.objectprice * item.objectQuantity;
        });

        table += `</tbody><tfoot><tr><td colspan='5' class='text-right font-weight-bold'>Total Price: ${totalPrice}</td></tr></tfoot></table>`;

        $(".cart-body").html(table);
        $(".checkout-btn").removeClass('disable'); // Enable the checkout button
    }
}

// Function to remove a product from the cart
function removeFromCart(pprice) {
    // Retrieve existing cart from localStorage
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Filter out the item with the given id
    cart = cart.filter(item => item.objectprice !== pprice);

    // Save the updated cart back to localStorage
    localStorage.setItem("cart", JSON.stringify(cart));

    // Update the cart display after removal
    updateCart();
}

// Call updateCart when the document is ready
$(document).ready(function() {
    updateCart();
});
</script>

</body>
</html>
