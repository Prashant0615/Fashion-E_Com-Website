function loading() {
    var tl = gsap.timeline()

    /*tl.from("#loader h1",{
        color:"black",
        delay:.1
    })*/

    tl.to("#yellow", {
        delay: 0.3,
        top: "-100%",
        delay: 0.5,
        duration: 0.8,
        ease: "expo.out"
    })

    tl.from("#yellow2", {
        top: "100%",
        delay: 0.6,
        duration: 0.5,
        ease: "expo.out"
    }, "anim")

    tl.to("#loader h1", {
        delay: 0.9,
        duration: 0.5,
        color: "black",
    }, "anim")

    /*
    tl.to("#loader",{
        opacity:0,
        duration:1
    })*/

    tl.to("#loader", {
        opacity: 0,
        display: "none",
        duration: .7,
        ease:"Expo.out"
    })

}

loading();

//lagging while scroll after adding images...

function loco() {
    const scroll = new LocomotiveScroll({
        el: document.querySelector("#main"),
        smooth: true
    });

    document.querySelector(".footer h2").addEventListener("click", () => {
        scroll.scrollTo(0);
    })
}

loco();


    var elms = document.querySelectorAll(".elm");
    var pg2 = document.querySelector("#page2");
    elms.forEach(function (el) {
        el.addEventListener("mouseenter", function () {
            var bgimg = el.getAttribute("data-image");
            pg2.style.backgroundImage = `url(${bgimg})`;
        })
    })


const menu_open = document.querySelector(".hb");
const menu = document.querySelector(".overlay-menu");
const close = document.querySelector("#close");
const headings = document.querySelectorAll(".navi>a>h1");
const main = document.querySelector(".navi");
const im2 = document.querySelector(".img2");

const openMenu = gsap.timeline({ paused: true })
    .to(menu, { y: '130%', duration: 0.5, ease: 'Expo.out' });

const openHeadings = gsap.timeline({ paused: true })
    .from(headings, { opacity: 0, x: "-100%", duration: 1.3, delay: .2, ease: "power3.out", stagger: .2 });

const open_img = gsap.timeline({ paused: true })
    .from(im2, { opacity: 0, height: 0, duration: .5, delay: .3, ease: "Expo.out" })

const closeMenu = gsap.timeline({ paused: true })
    .to(menu, { y: '-100%', duration: 1,delay:.1, ease: "pow1.in" })



menu_open.addEventListener("click", () => {
    openMenu.restart();
    openHeadings.restart();
    open_img.restart();
})

close.addEventListener("click", () => {
    closeMenu.restart();
})


function select(){

const H1 = document.querySelector("#h1");
const H2 = document.querySelector("#h2");
const H3 = document.querySelector("#h3");
const H4 = document.querySelector("#h4");
const H5 = document.querySelector("#h5");

const im1 = document.querySelector(".img1");
/*const im2=document.querySelector(".img2");*/
const im3 = document.querySelector(".img3");
const im4 = document.querySelector(".img4");
const im5 = document.querySelector(".img5");

const img = document.querySelectorAll(".navi .img-box");

H1.addEventListener('mouseenter', () => {
    gsap.to(im1, {
        opacity: 1,
        duration:.2,
        ease: 'Expo.out'
    })
    
    gsap.from(im1,{
        transform:"translate(0%,-100%) rotate(160deg)",
        duration:.5,
        ease:"Expo.out"
    })
     

    gsap.to(menu, {
        backgroundColor: '#e8aaf2',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(H1, {
        scale: 1.2,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })
})

H1.addEventListener('mouseleave', () => {
    gsap.to(im1, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(menu, {
        backgroundColor: '#f5bb1b',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H1, {
        scale: 1,
        duration: .2,
        ease: 'Expo.out'
    })
})

H2.addEventListener('mouseenter', () => {
    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })
})

H2.addEventListener('mouseleave', () => {
    gsap.to(im2, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

})

H3.addEventListener('mouseenter', () => {
    gsap.to(im3, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })
    
    gsap.from(im3,{
        transform:"translate(-300%,0%) rotate(135deg)",
        duration:.5,
        ease:"Expo.out"
    })
    
    gsap.to(menu, {
        backgroundColor: '#fff',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H3, {
        scale: 1.2,
        duration: .2,
        ease: 'Expo.out'
    })
})

H3.addEventListener('mouseleave', () => {
    gsap.to(im3, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(menu, {
        backgroundColor: '#f5bb1b',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H3, {
        scale: 1,
        duration: .2,
        ease: 'Expo.out'
    })
})

H4.addEventListener('mouseenter', () => {
    gsap.to(im4, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.from(im4,{
        transform:"translate(-100%,-50%) rotate(125deg)",
        duration:.2,
        ease:"Expo.out"
    })

    gsap.to(menu, {
        backgroundColor: '#a9c245',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H4, {
        scale: 1.2,
        duration: .2,
        ease: 'Expo.out'
    })
})

H4.addEventListener('mouseleave', () => {
    gsap.to(im4, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(menu, {
        backgroundColor: '#f5bb1b',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H4, {
        scale: 1,
        duration: .2,
        ease: 'Expo.out'
    })
})

H5.addEventListener('mouseenter', () => {
    gsap.to(im5, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })
    
    gsap.from(im5,{
        transform:"translate(0%,120%)",
        duration:.5,
        ease:"Expo.out"
    })
    

    gsap.to(menu, { 
        backgroundColor: 'gray',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H5, {
        scale: 1.2,
        duration: .2,
        ease: 'Expo.out'
    })
})

H5.addEventListener('mouseleave', () => {
    gsap.to(im5, {
        opacity: 0,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(menu, {
        backgroundColor: '#f5bb1b',
        duration: .4,
        ease: 'Expo.out'
    })

    gsap.to(im2, {
        opacity: 1,
        duration: .2,
        ease: 'Expo.out'
    })

    gsap.to(H5, {
        scale: 1,
        duration: .2,
        ease: 'Expo.out'
    })
})
}

window.addEventListener('load',()=>{
    select();
})


const myVid=document.querySelector("#vid2");
myVid.playbackRate=0.1;