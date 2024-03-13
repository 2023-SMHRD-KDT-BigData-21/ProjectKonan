$(".list").on("click", function () {
  $(".list").css('color', 'inherit');
  $(this).css('color', '#1088a6');
});


const list = document.querySelectorAll('.list');
function activeLink() {
	console.log(currentUrl);
	
    list.forEach((item) =>
    item.classList.remove('active_header'));
	this.classList.add('active_header');
}

list.forEach((item) =>
    item.addEventListener('click', activeLink));