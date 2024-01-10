window.onload = function () {
    canvasClick();
}

export function draw() {
    let canvas = document.getElementById("canvas");
    if (canvas.getContext) {
        let ctx = canvas.getContext("2d");

        ctx.beginPath();
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // setting blue color
        ctx.strokeStyle = "#3399ff";
        ctx.fillStyle = "#3399ff";

        // filling area
        // rectangle
        ctx.fillRect(canvas.width / 2, canvas.height / 2, canvas.width / 3, canvas.height / 3);
        ctx.moveTo(canvas.width / 2, canvas.height / 2);
        // 1/4 of circle
        ctx.arc(150, 150, 50, -3.14/2, 3.14, 1);
        ctx.fill();
        // triangle
        ctx.moveTo(150, 150);
        ctx.lineTo(150, 100);
        ctx.lineTo(200, 150);
        ctx.lineTo(150, 150);
        ctx.fill();

        // setting black color
        ctx.fillStyle = "black";
        ctx.font = "12px serif";

        // vertical 'R' marks
        ctx.fillText("R", canvas.width / 1.95, canvas.height / 5.5);
        ctx.fillText("R/2", canvas.width / 1.93, canvas.height / 2.85);
        ctx.fillText("-R/2", canvas.width / 1.93, canvas.height / 1.475);
        ctx.fillText("-R", canvas.width / 1.93, canvas.height / 1.184);

        // horizontal 'R' marks
        ctx.fillText("-R", canvas.width / 6.7, canvas.height / 2.05);
        ctx.fillText("-R/2", canvas.width / 3.38, canvas.height / 2.05);
        ctx.fillText("R/2", canvas.width / 1.59, canvas.height / 2.05);
        ctx.fillText("R", canvas.width / 1.23, canvas.height / 2.05);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = "black";
        // graph arrows
        // vertical arrow
        ctx.moveTo(canvas.width / 2, 0);
        ctx.lineTo(canvas.width / 2, canvas.height);
        ctx.moveTo(canvas.width / 1.95, canvas.height * 0.03);
        ctx.lineTo(canvas.width / 2, 0);
        ctx.moveTo(canvas.width / 2.05, canvas.height * 0.03);
        ctx.lineTo(canvas.width / 2, 0);
        // horizontal arrow
        ctx.moveTo(0, canvas.height / 2);
        ctx.lineTo(canvas.width, canvas.height / 2);
        ctx.moveTo(canvas.width * 0.97, canvas.height / 1.95);
        ctx.lineTo(canvas.width, canvas.height / 2);
        ctx.moveTo(canvas.width * 0.97, canvas.height / 2.05);
        ctx.lineTo(canvas.width, canvas.height / 2);

        // R unit marks
        // vertical marks
        ctx.moveTo(canvas.width / 2.04, canvas.height / 1.20);
        ctx.lineTo(canvas.width / 1.96, canvas.height / 1.20);
        ctx.moveTo(canvas.width / 2.04, canvas.height / 1.5);
        ctx.lineTo(canvas.width / 1.96, canvas.height / 1.5);
        ctx.moveTo(canvas.width / 2.04, canvas.height / 3);
        ctx.lineTo(canvas.width / 1.96, canvas.height / 3);
        ctx.moveTo(canvas.width / 2.04, canvas.height / 6);
        ctx.lineTo(canvas.width / 1.96, canvas.height / 6);

        // horizontal marks
        ctx.moveTo(canvas.width / 1.2, canvas.height / 2.04);
        ctx.lineTo(canvas.width / 1.2, canvas.height / 1.96);
        ctx.moveTo(canvas.width / 1.5, canvas.height / 2.04);
        ctx.lineTo(canvas.width / 1.5, canvas.height / 1.96);
        ctx.moveTo(canvas.width / 3, canvas.height / 2.04);
        ctx.lineTo(canvas.width / 3, canvas.height / 1.96);
        ctx.moveTo(canvas.width / 6, canvas.height / 2.04);
        ctx.lineTo(canvas.width / 6, canvas.height / 1.96);



        ctx.stroke();
    }
}

// function canvasClick() {
//     let canvas = document.getElementById("canvas");
//     canvas.addEventListener('click', ev => {
//         let radius = $('input[type="radio"]:checked:first').val()
//         if (!radius) {
//             alert("R is undefined");
//         }
//     });
// }