const list = document.querySelectorAll('.list');
function activeLink() {
	var currentUrl = window.location.href;
	console.log(currentUrl);
	
    list.forEach((item) =>
    item.classList.remove('active_header'));
    
///    if(currentUrl=="http://localhost:8081/Konan/Main.jsp"){
//    	this.classList.add('active_header');
//	}
}

list.forEach((item) =>
    item.addEventListener('click', activeLink));