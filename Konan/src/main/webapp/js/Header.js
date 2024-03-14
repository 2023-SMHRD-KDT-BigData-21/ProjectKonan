/*
const list = document.querySelectorAll('.list');

function activeLink() {
	console.log(currentUrl);
	
    list.forEach((item) =>
    item.classList.remove('active_header'));
	this.classList.add('active_header');
}

list.forEach((item) =>
    item.addEventListener('click', activeLink));
*/

const list = document.querySelectorAll('.list');
let previousActiveItem = null;

function activeLink(event) {
    const clickedItem = event.currentTarget;

    // 이전에 활성화된 메뉴 아이템이 있다면 해당 클래스를 제거
    if (previousActiveItem) {
        previousActiveItem.classList.remove('active_header');
    }

    // 현재 클릭된 메뉴 아이템에 활성화 클래스 추가
    clickedItem.classList.add('active_header');

    // 이전에 클릭된 메뉴 아이템을 현재 클릭된 메뉴 아이템으로 갱신
    previousActiveItem = clickedItem;

    // 클릭한 메뉴 아이템 이외의 모든 아이템을 비활성화
    list.forEach(function(item) {
        if (item !== clickedItem) {
            item.classList.remove('active_header');
        }
    });
}

list.forEach(function(item) {
    item.addEventListener('click', activeLink);
});
