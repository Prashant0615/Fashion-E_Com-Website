gsap.registerPlugin(ScrollTrigger);

tl=gsap.timeline();

tl.to(".overlay2",{
    width:0,
    ease:"powe4.inOut",
    duration:1,
    delay:.8,
})

tl.from(".header .lt div",{
    y:100,
    opacity:0,
    stagger:0.1,
    duration:.5,
})


gsap.to(".header .letters1",{
    scale:10,
    x:-5000,
    ease:"power2.inOut",
    scrollTrigger:{
        trigger:".letters1",
        start:"top -50%",
        end:"top 100%",
        scroller:'body',
        scrub:3,
    }
})

gsap.to(".header .letters2",{
    scale:10,
    x:5000,
    ease:"power2.inOut",
    scrollTrigger:{
        trigger:'.letters2',
        scroller:'body',
        start:"top -50%",
        end:"top 100%",
        scrub:3,
        pin:true,
    }
})



/*gsap.from(".img-holder", {
    clipPath: 'polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)',
    clipPath:'polygon(37.5% 20%,62.5% 20%,62.5% 80%,37.5% 80%)',
    rotation: 0,
    ease: "power2.inOut",
    scrollTrigger: {
        trigger: '.img-holder',
        start: "top top", // Starts when the img-holder reaches the top of the viewport
        end: "200px top", // Ends after 200px of scrolling
        scrub: 1, // Smooth scrolling effect
        markers: true, // Debugging markers
    },
});
gsap.from(".img-holder img", {
    scale:10, // Adjust scaling for a subtle effect
    ease: "power2.inOut",
    scrollTrigger: {
        trigger: '.img-holder',
        start: "top top", // Starts with the img-holder
        end: "200px top",
        scrub: 1,
        markers: true,
    },
});*/

gsap.from(".img-holder", {
    rotation:30,
    clipPath:'polygon(37.5% 20%,62.5% 20%,62.5% 80%,37.5% 80%)',
    ease: "none", 
    scrollTrigger: {
        trigger: ".img-holder", 
        start: "top -50%",
        end: "top 0%", 
        scrub:3,
        pin:true, 
    },
});


gsap.to(".contnet-holder",{
    y:-1000,
    ease:"power3.inOut",
    scrollTrigger:{
        trigger:".content-holder",
        scroller:"body",
        start:"top 0%",
        end:"top 100%",
        scrub:true,
    },
});


gsap.from(".row2 h1",{
    y:100,
    opacity:0,
    ease:"power4.inOut",
    scrollTrigger:{
        trigger:'.row2 h1',
        scroller:"body",
        start:"top 50%",
        end:"to 100%",
        scrub:2,
    }
})

gsap.from(".row2 p",{
    y:100,
    opacity:0.2,
    ease:"power4.inOut",
    stagger:0.1,
    scrollTrigger:{
        trigger:'.row2 p',
        scroller:"body",
        start:"top 50%",
        end:"to 100%",
        scrub:2,
    }
})


var elm=document.querySelector(".elm-container");
var card=document.querySelector(".fixed-image");

elm.addEventListener('mouseenter',()=>{
    card.style.display='block';
})

/*card.addEventListener("mouseenter",()=>{
    card.style.display='block';
})*/

elm.addEventListener('mouseleave',()=>{
    card.style.display='none';
})

var elems=document.querySelectorAll(".elm");
elems.forEach(function(e){
    e.addEventListener('mouseenter',function(){
        var image=e.getAttribute("data-image");
        card.style.backgroundImage=`url(${image})`;
    })
})



gsap.from(".team-men .logo-container",{
    y:200,
    opacity:0,
    stagger:0.1,
    scrollTrigger:{
        trigger:'.team-men .logo-container',
        scroller:"body",
        top:"top 10%",
        end:"top 100%",
        scrub:2,
    }
})

gsap.from(".team-men .descript h1",{
    y:200,
    opacity:0,
    stagger:0.1,
    scrollTrigger:{
        trigger:'.team-men .descript h1',
        scroller:"body",
        top:"top 10%",
        end:"top 100%",
        scrub:2,
    }
})

gsap.from(".team-men .descript div p",{
    y:200,
    opacity:0,
    stagger:0.1,
    scrollTrigger:{
        trigger:'.team-men .descript div p',
        scroller:"body",
        top:"top 10%",
        end:"top 100%",
        scrub:2,
    }
})



    let navButton = document.querySelector(".logo");
    let popupNav = document.querySelector(".popup");

    // Toggle popup visibility on button click
    navButton.addEventListener("click", function () {
        if (popupNav.style.display === "none" || popupNav.style.display === "") {
            popupNav.style.display = "block";
        } else {
            popupNav.style.display = "none";
        }
    });

    // Close the popup when clicking outside of it
    document.addEventListener("click", function (event) {
        if (!popupNav.contains(event.target) && event.target !== navButton) {
            popupNav.style.display = "none";
        }
    });

    
