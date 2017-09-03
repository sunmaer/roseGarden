window.onload = function () {
    var container = document.getElementById('container');
    var list = document.getElementById('list');
    var buttons = document.getElementById('buttons').getElementsByTagName('span');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');
    var index = 1;
    var len = 5;
    var animated = false;
    var interval = 3000;
    var timer;

    /* 轮播图文字内容改变 */
    function carousel_p_text(index) {
        var picture_dec = document.getElementById("picture_dec");
        if(index == 1) {
            picture_dec.innerText = "瓶插月季";
        } 
        if(index == 2) {
            picture_dec.innerText = "现代月季比基尼";
        } 
        if(index == 3) {
            picture_dec.innerText = "花卉基地一角";
        } 
        if(index == 4) {
            picture_dec.innerText = "月季捧花";
        } 
        if(index == 5) {
            picture_dec.innerText = "翘首盼花";
        } 
    }

    function animate (offset) {
        if (offset == 0) {
            return;
        }
        animated = true;
        var time = 300;
        var inteval = 10;
        var speed = offset/(time/inteval);
        var left = parseInt(list.style.left) + offset;

        var go = function (){
            if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                list.style.left = parseInt(list.style.left) + speed + 'px';
                setTimeout(go, inteval);
            }
            else {
                list.style.left = left + 'px';
                if(left>-200){
                    list.style.left = -710 * len + 'px';
                }
                if(left<(-710 * len)) {
                    list.style.left = '-710px';
                }
                animated = false;
            }
        }
        go();
    }

    function showButton() {
        for (var i = 0; i < buttons.length ; i++) {
            if( buttons[i].className == 'on'){
                buttons[i].className = '';
                break;
            }
        }
        buttons[index - 1].className = 'on';
    }

    function play() {
        timer = setTimeout(function () {
            next.onclick();
            play();
        }, interval);
    }
    function stop() {
        clearTimeout(timer);
    }

    next.onclick = function () {
        if (animated) {
            return;
        }
        if (index == 5) {
            index = 1;
        }
        else {
            index += 1;
        }
        carousel_p_text(index);
        animate(-710);
        showButton();
    }
    prev.onclick = function () {
        if (animated) {
            return;
        }
        if (index == 1) {
            index = 5;
        }
        else {
            index -= 1;
        }
        animate(710);
        showButton();
    }

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function () {
            if (animated) {
                return;
            }
            if(this.className == 'on') {
                return;
            }
            var myIndex = parseInt(this.getAttribute('index'));
            carousel_p_text(myIndex);
            var offset = -710 * (myIndex - index);

            animate(offset);
            index = myIndex;
            showButton();
        }
    }

    container.onmouseover = stop;
    container.onmouseout = play;

    play();

}