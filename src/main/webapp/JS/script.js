/*const { color } = require("three/webgpu");*/

Shery.imageEffect("#back",{style:5,config:
    {"a":{"value":2,"range":[0,30]},"b":{"value":-0.98,"range":[-1,1]},
    "zindex":{"value":"-9996999223344","range":[-9999999,9999999]},
    "aspect":{"value":2.082236837977518},"ignoreShapeAspect":{"value":true},
    "shapePosition":{"value":{"x":0,"y":0}},"shapeScale":{"value":{"x":0.5,"y":0.5}},
    "shapeEdgeSoftness":{"value":0,"range":[0,0.5]},
    "shapeRadius":{"value":0,"range":[0,2]},
    "currentScroll":{"value":0},"scrollLerp":{"value":0.07},
    "gooey":{"value":true},"infiniteGooey":{"value":true},"growSize":{"value":4,"range":[1,15]},
    "durationOut":{"value":1,"range":[0.1,5]},"durationIn":{"value":1,"range":[0.1,5]},
    "displaceAmount":{"value":0.5},"masker":{"value":false},"maskVal":{"value":1,"range":[1,5]},
    "scrollType":{"value":0},"geoVertex":{"range":[1,64],"value":1},"noEffectGooey":{"value":false},
    "onMouse":{"value":1},"noise_speed":{"value":0.2,"range":[0,10]},
    "metaball":{"value":0.2,"range":[0,2],"_gsap":{"id":3}},
    "discard_threshold":{"value":0.7,"range":[0,1]},
    "antialias_threshold":{"value":0,"range":[0,0.1]},
    "noise_height":{"value":0.73,"range":[0,2]},
    "noise_scale":{"value":17.56,"range":[0,100]}},gooey:true});


    var elems=document.querySelectorAll(".elem");
    elems.forEach(function(elem){
    var h1s = elem.querySelectorAll("h1");
    var index=0;
    var animating=false;
    document.querySelector("#main").addEventListener("click",function(){
      if(!animating){
          animating=true;
          gsap.to(h1s[index],{
          top:'-=100%',
          ease:Expo.easeInOut,
          duration:1,
          onComplete:function(){
            gsap.set(this._targets[0],{top:"100%"});
            animating=false;
            }
          });
        index=== h1s.length-1?index=0:index++;
        gsap.to(h1s[index],{
            top:'-=100%',
            ease:Expo.easeInOut,
            duration:1,
        });
    }
    });
});


//js to avoid floating divs

/*let lastScrollTop=0;
const floatingDiv=document.getElementById('top')

window.addEventListener('scroll',function(){
  let st=window.pageXOffset || document.documentElement.scrollTop;
  if (st>lastScrollTop){
    this.top.classList.add('hidden');
  }
  else{
    this.top.classList.remove('hidden');
  }
  lastScrollTop=st<=0?0:st;
});*/

const loginBtn= document.querySelector('.login');
const login_menu = document.querySelector('.overlay');
let login_bar1= document.getElementById("ln1");
let login_bar2= document.getElementById("ln2");
let isOpen = false;

loginBtn.addEventListener('click', function () {
    if (isOpen) {
        login_menu.classList.remove('overlay-kianimation');
        login_bar1.classList.remove("rotate-left");
        login_bar2.classList.remove("rotate-right");
        login_menu.classList.add('overlay-kireverseanimation');    
    } 
    else {
        login_menu.classList.remove('overlay-kireverseanimation');
        login_bar1.classList.add("rotate-left");
        login_bar2.classList.add("rotate-right");
        login_menu.classList.add('overlay-kianimation');
    }
    isOpen = !isOpen;
});


  loginBtn.onclick=()=>{
     const textElement1=document.querySelector("#text1");
     const textElement2=document.querySelector("#text2");
     const textElement3=document.querySelector("#text3");
     const textElement4=document.querySelector("#text4");
     const textElement5=document.querySelector("#text5");
     textElement1.classList.toggle("show-text");
     textElement2.classList.toggle("show-text");
     textElement3.classList.toggle("show-text");
     textElement4.classList.toggle("show-text");
     textElement5.classList.toggle("show-text");
  }

// Toggle between 100px and 0px on click
/*textElement.addEventListener('click', () => {
  if (textElement.style.transform === 'translateY(100px)') {
    textElement.style.transform = 'translateY(0px)';
  } else {
    textElement.style.transform = 'translateY(100px)';
  }
});*/

/*function isInViewport(element) {
  const rect = element.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
}*/

let banner2= document.getElementById("banners2");
let banner3= document.getElementById("banners3");
let banner4= document.getElementById("banners4");
let banner1=document.getElementById("banners1");

let Image1=document.getElementById("scale1");
let Image2=document.getElementById("scale2");
let Image3=document.getElementById("scale3");
let Image4=document.getElementById("scale4");

let boxy=document.querySelector(".img-banner");

banner1.addEventListener('mouseenter',function(){
  boxy.style.boxShadow=" 0 0 15px rgb(254, 2, 2), 0 0 25px  rgb(254, 2, 2), 0 0 45px  rgb(254, 2, 2)";
})

banner2.addEventListener('mouseenter',function(){
  Image2.style.opacity='1';
  boxy.style.boxShadow="0 0 15px rgb(61, 239, 12), 0 0 25px  rgb(61, 239, 12), 0 0 45px rgb(61, 239, 12)";
})

banner2.addEventListener('mouseout',function(){
  Image2.style.opacity="0";
  boxy.style.boxShadow=" 0 0 15px rgb(254, 2, 2), 0 0 25px  rgb(254, 2, 2), 0 0 45px  rgb(254, 2, 2)";
})


banner3.addEventListener('mouseenter',function(){
  Image3.style.opacity="1";
  boxy.style.boxShadow="0 0 15px rgb(244, 212, 28), 0 0 25px  rgb(244, 212, 28), 0 0 45px rgb(244, 212, 28)";
})

banner3.addEventListener('mouseout',function(){
   Image3.style.opacity='0';
   boxy.style.boxShadow=" 0 0 15px rgb(254, 2, 2), 0 0 25px  rgb(254, 2, 2), 0 0 45px  rgb(254, 2, 2)";
})

banner4.addEventListener('mouseenter',function(){
  Image4.style.opacity='1';
  boxy.style.boxShadow="0 0 15px rgb(12, 239, 159), 0 0 25px  rgb(12, 239, 159), 0 0 45px rgb(12, 239, 159)";
})

banner4.addEventListener('mouseout',function(){
  Image4.style.opacity='0';
  boxy.style.boxShadow=" 0 0 15px rgb(254, 2, 2), 0 0 25px  rgb(254, 2, 2), 0 0 45px  rgb(254, 2, 2)";
})



//animation of horizontal bar;

/*const material=document.querySelector(".slider");
const content=document.querySelector("#bdl");
const slide1=document.querySelector(".imge1");
const slide2=document.querySelector(".imge2");
const slide3=document.querySelector(".imge3");
const slide4=document.querySelector(".imge4");
const slide5=document.querySelector(".imge5");
let animationH1=false;
let animationH2=false;
let animationH3=false;
let animationH4=false;
let animationH5=false;

material.addEventListener('mouseenter',function() {
  if(!animationH1){
 slide1.classList.add("addme");
  animationH1=true;
  }
})

material.addEventListener('mouseleave',function(){
  slide1.classList.remove("addme");
  animationH1=true;
})

material.addEventListener('mouseenter',function() {
  if(!animationH2){
  slide2.classList.add("addme");
  animationH2=true;
  }
 })

 material.addEventListener('mouseleave',function(){
  slide2.classList.remove("addme");
})

material.addEventListener('mouseenter',function() {
  if(!animationH3){
  slide3.classList.add("addme");
  animationH3=true;
  }
 })

 material.addEventListener('mouseleave',function(){
  slide3.classList.remove("addme");
})

material.addEventListener('mouseenter',function() {
  if(!animationH4){
  slide4.classList.add("addme");
  animationH4=true;
  }
 })

 material.addEventListener('mouseleave',function(){
  slide4.classList.remove("addme");
})

material.addEventListener('mouseenter',function() {
  if(!animationH5){
  slide5.classList.add("addme");
  animationH5=true;
  }
 })

 material.addEventListener('mouseleave',function(){
  slide5.classList.remove("addme");
})*/


let land=document.querySelector(".step5");
let animationPlayed = false;


land.addEventListener('mouseenter',function(){

  if (!animationPlayed) {
  var textWrapper=document.querySelector(".ml12");
  textWrapper.innerHTML=textWrapper.textContent.replace(
    /\S/g,
    "<span class='letter'>$&</span>"
  );
  
  anime.timeline().add({
     targets:".ml12 .letter",
     translateY:[100,0],
     translateZ:0,
     opacity:[0,1],
     easing:"easeOutExpo",
     duration:2000,
     delay:(el,i)=>1000+60*i, 
  })

  TweenMax.from(".lefty",3,{
    left:"-50%",
    ease:Expo.easeInOut,
    delay:2.5
  })

  TweenMax.from(".header_1 h1",3,{
    left:"-140%",
    ease:Expo.easeInOut,
    delay:2.8
  })

  TweenMax.staggerFrom(".images_1 > div",1,{
    y:60,
    opacity:0,
    ease:Power2.easeOut,
    delay:5.5
  },0.2)

  TweenMax.staggerFrom(".header_1 > p",1,{
    y:60,
    opacity:0,
    ease:Power2.easeOut,
    delay:5,
  },0.2)

  TweenMax.from(".link",1,{
    opacity:0,
    ease: SteppedEase.config(1),
    repeat:-1,
    repeatDelay:0.2,
    delay:6.8,
  });
  land.style.setProperty('--after_width',0);
  animationPlayed = true; 
}
});

let aja_aja=document.querySelector(".step6");
/*
aja_aja.addEventListener('mouseenter',function(){
      behind_seller.style.height="7.4vw";
})

aja_aja.addEventListener('mouseleave',function(){
    behind_seller.style.height=".4vw";
})*/


let d1=document.querySelector("#d1");
let d2=document.querySelector("#d2");
let d3=document.querySelector("#d3");
let d4=document.querySelector("#d4");
let d5=document.querySelector("#d5");
let d6=document.querySelector("#d6");
let d7=document.querySelector("#d7");
let d8=document.querySelector("#d8");
let d9=document.querySelector("#d9");
let d10=document.querySelector("#d10");
let d11=document.querySelector("#d11");

aja_aja.addEventListener("mouseenter",function(){
  d1.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d1.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d2.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d2.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d3.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d3.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d4.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d4.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d5.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d5.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d6.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d6.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d7.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d7.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d8.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d8.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d9.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d9.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d10.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d10.classList.remove("despo-ki-animation")
});

aja_aja.addEventListener("mouseenter",function(){
  d11.classList.add("despo-ki-animation")
});

aja_aja.addEventListener("mouseleave",function(){
  d11.classList.remove("despo-ki-animation")
});


/*const track=document.querySelector(".slider-sellers");

window.onmousedown=e=>{
  e.clientX;
  track.dataset.mouseDownAt= e.clientX;
}

window.onmouseup=()=>{ 
   track.dataset.mouseDownAt = "0";
   track.dataset.prevPercentage = track.dataset.percentage;
}

window.onmousemove=e=>{
  if(track.dataset.mouseDownAt === "0") return;
  const mouseDelta = parseFloat(track.dataset.mouseDownAt)-e.clientX,
  maxDelta=window.innerWidth/2;

  const percentage=(mouseDelta/ maxDelta)*-100,
  nextPercentage=parseFloat(track.dataset.prevPercentage)+percentage;
  track.dataset.percentage=Math.max(nextPercentage,-100);

  track.animate({
    transform:`translate(${nextPercentage}%,0%)`
  },{duration:1200,fill:"forwards"});

  for(const image of track.getElementsByClassName("seller-img")) {
    image.animate({
      objectPosition:`${10+nextPercentage}% center`
    },{duration:1200,fill:"forwards"});
  }
}
*/

const canvas1=document.querySelector(".step6-1");
const canvas2=document.querySelector(".step6-2");
const canvas3=document.querySelector(".step6-3");
const canvas4=document.querySelector(".step6-4");
const canvas5=document.querySelector(".step6-5");
const canvas6=document.querySelector(".step6-6");

const canvas_over=document.querySelector(".overlay-step6");

const can1=document.querySelector("#can1");
const can2=document.querySelector("#can2");
const can3=document.querySelector("#can3");
const can4=document.querySelector("#can4");
const can5=document.querySelector("#can5");
const can6=document.querySelector("#can6");

let behind_seller=document.querySelector(".behind-seller");




can2.addEventListener('click',function(){
    behind_seller.style.backgroundColor="#D3FD50";
    behind_seller.style.filter="none";
    behind_seller.style.opacity='.8';
    canvas2.style.width='100%';
    canvas3.style.width='0%';
    canvas4.style.width='0%';
    canvas5.style.width='0%';
    canvas6.style.width='0%';  
})


can1.addEventListener('click',function(){
  behind_seller.style.backgroundColor="#F4BF3C";
  canvas1.style.width='100%';
  canvas2.style.width='0%';
  canvas3.style.width='0%';
  canvas4.style.width='0%';
  canvas5.style.width='0%';
  canvas6.style.width='0%';  
})

can3.addEventListener('click',function(){
  canvas3.style.width='100%';
  behind_seller.style.backgroundColor='#FD6504';
  behind_seller.style.opacity='.8';
  canvas4.style.width='0%';
  canvas5.style.width='0%';
  canvas6.style.width='0%';  
})

can4.addEventListener('click',function(){
  behind_seller.style.backgroundColor='#9678D3';
  behind_seller.style.opacity='.8';
  canvas4.style.width='100%';
  canvas5.style.width='0%';
  canvas6.style.width='0%';  
})

can5.addEventListener('click',function(){
  canvas5.style.width='100%';
  behind_seller.style.backgroundColor='#B692A1';
  canvas6.style.width='0%';  
})

can6.addEventListener('click',function(){
  behind_seller.style.backgroundColor='#7E929C';
  canvas6.style.width='100%';  
})


let triggerdiv=document.querySelector(".step6");
let triggertext=document.querySelector("#seller-ki-text");

triggerdiv.addEventListener('mouseenter',function(){
  gsap.to(triggertext,{
    y:0,
    opacity:1,
    delay:.5,
    duration:1,
    ease:'power2.out'
  })
})

/*triggerdiv.addEventListener("mouseleave",function(){
  gsap.to(triggertext,{
    y:'140%',
    opacity:0,
    filter:'blur(20px)',
    duration:1.4,
    ease:'power2.out'
  })
})*/


let public=document.querySelector(".publicity");
let step7=document.querySelector(".step7");

step7.addEventListener("mouseenter",()=>{
  gsap.to(public,{
    width:'50%',
    opacity:1,
    duration:.34,
    ease:'cubic-bezier(.36,.07,.19,.97)',
    yoyo:true,
  })
})

step7.addEventListener("mouseleave",()=>{
  gsap.to(public,{
    width:'0%',
    opacity:.2,
    duration:.34,
    ease:'cubic-bezier(.36,.07,.19,.97)',
    yoyo:true,
  })
})


function startLoader() {
  let counterElement=document.querySelector(".counter");
  let currentVal=0;
   
   function updateCounter(){
      if(currentVal===100){
        return;
      }
      currentVal+=Math.floor(Math.random()*10)+1;

      if(currentVal>100){
        currentVal=100;
      }

      counterElement.textContent=currentVal;

      let delay=Math.floor(Math.random()*200)+50;
      setTimeout(updateCounter,delay);
   }
   updateCounter();
}
startLoader();

gsap.to(".counter",0.25,{
  delay:3.5,
  opacity:0,
})

gsap.to(".bar",1.4,{
  delay:3.5,
  height:0,
  stagger:{
    amount:1.5,
  },
  ease:"pow4.inout",
});



gsap.from(".quoted p",{
  scale:1.2,
  y:10,
  ease:"pow4.inout",
  scrollTrigger:{
    trigger:".quoted",
    scroller:"body",
    start:"top 50%",
    end:"top -100%",
    scrub:true,
    pin:true,
  }
})

// Register ScrollTrigger plugin
gsap.registerPlugin(ScrollTrigger);

// Animate each image with the class 'reveal'
gsap.utils.toArray('.phn').forEach((img, index) => {
  gsap.from(img, {
    y:100, 
    duration: 1.1, 
    ease: "power2.out", 
    scrollTrigger: {
      trigger:img, 
      start: "top 100%", 
      toggleActions: "play none none none",
      scrub:2,
    }
  });
});



