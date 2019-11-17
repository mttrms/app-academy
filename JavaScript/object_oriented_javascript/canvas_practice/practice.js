document.addEventListener("DOMContentLoaded", function(){
	const canvas = document.getElementById('mycanvas');
	const ctx = canvas.getContext('2d');

	ctx.fillStyle = 'mistyrose';
	ctx.fillRect(50, 50, 400, 200);

	ctx.beginPath();
	ctx.arc(200, 200, 25, 0, 2 * Math.PI);
	ctx.strokeStyle = 'darkseagreen';
	ctx.lineWidth = 10;
	ctx.stroke();
	ctx.fillStyle = 'palegreen';
	ctx.fill();
});
