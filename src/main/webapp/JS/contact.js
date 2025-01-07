
tl=gsap.timeline();

tl.from(".header #anim",{
    y:100,
    opacity:0,
    ease:"power2.inOut",
    duration:1.5,
})

tl.from("#anim2",{
    y:100,
    opacity:0,
    stagger:0.1,
    ease:"power3.inOut",
    duration:1.5,
})

gsap.from(".line1",{
    width:0,
    ease:"power3.inOut",
    duration:1.5,
    delay:.2,
})

gsap.from(".line2 .sub-line",{
    x:950,
    ease:"power3.inOut",
    duration:1.5,
    delay:.2,
})

gsap.to(".overlay .overlay-right",{
    x:500,
    ease:"power3.inOut",
    duration:3.5,
    delay:.5,
})

gsap.to(".overlay .overlay-left",{
    x:-500,
    ease:"power3.inOut",
    duration:3.5,
    delay:.5,
})

gsap.from(".image-container img",{
    scale:1.6,
    ease:"power3.inOut",
    duration:2.6,
    delay:.8,
})

let word=document.querySelectorAll(".word");

word.forEach(item=>{
    item.addEventListener('mouseenter',()=>{
            gsap.to(".word .upper div",{
                y:-40,
                duration:.09,
                stagger:0.06,
            })

            
            gsap.to(".word .lower div",{
                y:-90,
                duration:.05,
                stagger:0.06,
            })
    })
})


word.forEach(item=>{
    item.addEventListener('click',()=>{
        const animationType=item.getAttribute("data-animation");

        if(animationType === '1'){
            window.location.href='shop.jsp'
        }
        
        if(animationType === '2'){
            window.location.href='AboutUS.jsp'
        }

        
        if(animationType === '3'){
            window.location.href='Gallery.jsp'
    }
   })
});          

word.forEach(e=>{
    e.addEventListener("mouseleave",()=>{
        
        gsap.to(".word .upper div",{
            y:0,
            duration:.1,
            stagger:0.05,
        })

        gsap.to(".word .lower div",{
            y:0,
            duration:.1,
            stagger:0.05,
        })
    })
})


let con=document.querySelector(".upper-mail");

con.addEventListener('mouseenter',()=>{
    gsap.to(".upper-mail div",{
        y:-130,
        duration:.1,
        stagger:0.065,
    })

    gsap.to(".lower-mail div",{
        y:-130,
        duration:.1,
        stagger:0.065,
    })
})

con.addEventListener('mouseleave',()=>{
    gsap.to(".upper-mail div",{
        y:0,
        duration:.1,
        stagger:0.065,
    })

    gsap.to(".lower-mail div",{
        y:150,
        duration:.1,
        stagger:0.065,
    })
})


con.addEventListener("mouseenter",()=>{
    gsap.to("#fly",{
        x:40,
        y:-30,
        duration:.1,
        delay:.3,
    })
})

con.addEventListener("mouseleave",()=>{
    gsap.to("#fly",{
        x:0,
        y:0,
        duration:.1,
        delay:.3,
    })
})


const link=document.querySelectorAll(".struct2 div");

link.forEach(l=>{
    l.addEventListener('click',()=>{
        const Mailto=`mailto:${"baliyanlucky85@gmail.com"}`;
        window.location.href=Mailto;
    });
})

const elms=document.querySelectorAll(".para p");


elms.forEach(e=>{
    e.addEventListener('click',()=>{
        const latitude=28.3669; 
        const longitude = 77.5413;// Replace with your longitude
        const zoom = 15; // Optional zoom level for Google Maps
        
        // Google Maps URL with latitude and longitude
        const mapUrl = `https://www.google.com/maps?q=${latitude},${longitude}&z=${zoom}`;
        
        // Redirect user to the map location
        window.open(mapUrl, '_blank');
    })
})