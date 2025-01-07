<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <%@include file="Component/common_css_js.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="CSS/About.css">
</head>
<body>
    <div class="logo">
        <div class="popup">
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="Gallery.jsp">GALLERY</a></li>
                <li><a href="Shop.jsp">SHOP</a></li>
                <li><a href="Contact.jsp">CONTACT</a></li>
            </ul>
        </div>
    </div>
    <div class="header">
        <div class="content">
            <div class="img-holder">
                <img src="images/jianxiang-wu-VJnqcHs2rhY-unsplash.jpg" alt="">
            </div>
            <div class="letters1 lt">
                <div>O</div>
                <div>U</div>
                <div>R</div>
                <div>W</div>
            </div>
            <div class="letters2 lt">
                <div>O</div>
                <div>R</div>
                <div>K</div>
                <div>S</div>
            </div>
        </div>

    </div>

    <div class="content-holder">
         <div class="row">
             <h1>About US</h1>
             <div class="img-container">
                <img src="images/andi-rieger-x9H9GupmS48-unsplash - Copy - Copy.jpg" alt="">
             </div>
         </div>  

         <div class="row2">
            <h1>Vis<img src="images/janis-dzenis-F2D5L0gaNow-unsplash.jpg">on</h1>
           <div class="para-content">
              <P>Our goal is to revolutionize the online shopping experience by combining innovation, quality, and customer satisfaction.</P>
              <p>
                We aim to provide a seamless platform where style meets convenience, offering curated collections that cater to diverse tastes.<br>
                By prioritizing sustainability and cutting-edge technology, we strive to make every purchase meaningful.
              </p>
              <p>At Iconic Styles, we’re not just selling products we’re building a community of fashion-forward thinkers.</p>
           </div>
         </div> 

         <div class="row3">
          <div class="elm-container">
              <div class="elm" id="elm1" data-image="https://images.unsplash.com/photo-1731331131233-4f73c93ae693?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3fHx8ZW58MHx8fHx8">
                  <div class="overlay"></div>
                  <h2>CREATIVE DESIGNE</h2>
              </div>
              <div class="elm" data-image="https://images.unsplash.com/photo-1732286521912-9c48f3faee78?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw5fHx8ZW58MHx8fHx8">
                  <div class="overlay"></div>
                  <h2>NEXT GEN</h2>
              </div>
              <div class="elm" data-image="https://images.unsplash.com/photo-1734233081965-d8f11da72fe0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzMnx8fGVufDB8fHx8fA%3D%3D">
                  <div class="overlay"></div>
                  <h2>TEAM WORK</h2>
              </div>
              <div class="elm" data-image="https://images.unsplash.com/photo-1580428180098-24b353d7e9d9?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                  <div class="overlay"></div>
                  <h2>AUTHENTICATION</h2>
              </div>
           </div>
         </div>
   </div>

   <div class="fixed-image"></div>
   <div class="overlay2"></div>

   <div class="sub-info">
     <div class="team">
     <div class="team-men">
        <div class="logo-container">
            <img src="images/OUR2.jpg" alt="">
        </div>
        <div class="descript">
            <h1>Frontend Developer</h1>
            <div><p><b>Lucky Baliayn</b> brings creativity and precision to our team, crafting visually stunning and user-friendly interfaces.</p></div>
            <div><p>With a keen eye for detail, Lucky ensures that every element of our e-commerce site is both<br> functional and beautiful.</p></div>
           <a href="mailto:baliyanlucky85@gmail.com" target="_blank" id="test1"><i class="fa-solid fa-envelope"></i></a>
        </div>
     </div>
     <div class="team-men">
        <div class="logo-container">
            <img src="images/OUR4.jpg" alt="">
        </div>
        <div class="descript">
            <h1>Backend Developer</h1>
            <div><p><b>Prashant Kumar</b> is the backbone of our platform, building and maintaining the server-side logic.</p></div>
            <div><p>His expertise ensures a seamless and robust performance for our users.</p></div>
           <a href="" id="test2"><i class="fa-solid fa-envelope"></i></a>
        </div>
     </div>
     <div class="team-men">
        <div class="logo-container">
            <img src="images/OUR5.jpg" alt="">
        </div>
        <div class="descript">
            <h1>Database Designer</h1>
            <div><p><b>Mudit Dixit</b>manages our data with precision, designing a structured and efficient database system that</p></div>
            <div><p>guarantees smooth operations and data integrity across the platform.</p></div>
            <a href="" target="_blank" id="test3"><i class="fa-solid fa-envelope"></i></a>
        </div>
     </div>
     <div class="team-men">
        <div class="logo-container">
            <img src="images/OUR3.png" alt="">
        </div>
        <div class="descript">
            <h1>Payment Gateway</h1>
           <div><p><b>Abhi Uday</b> handles the integration of secure and efficient payment gateways,</p></div>
           <div><p>ensuring a hassle-free and trustworthy transaction process for our customers.</p></div>
            <a href="" target="_blank" id="test4"><i class="fa-solid fa-envelope"></i></a>
        </div>
       </div>
     </div>
   </div>

   <!--<footer>
    <div class="upper">
       <div class="navi">
           <h1>SHOP</h1>
           <h1>CONTACT US</h1>
       </div>
       <div class="cop"></div>
    </div>
    <div class="lower">
        <p>&copy; 2024 Iconic Styles. All rights reserved.</p>
    </div>
   </footer> -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
    <script src="JS/About.js"></script>
</body>
</html>