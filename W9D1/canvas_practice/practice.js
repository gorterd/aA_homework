document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById("mycanvas");
    [canvas.height, canvas.width] = [500, 500];
    let ctx = canvas.getContext('2d');
    
    ctx.fillStyle = "#5ac18e";
    ctx.fillRect(0,0,500,500);

    
    ctx.beginPath();
    ctx.arc(250, 250, 125, 0, 2 * Math.PI);
    ctx.fillStyle = "#FF7373";
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(161.61,338.39);
    ctx.bezierCurveTo(190,200,310,300,338.39,161.61);
    ctx.arc(250, 250, 125, 5.49779, 2.35619);
    ctx.fillStyle = "#576675";
    ctx.fill();

});
