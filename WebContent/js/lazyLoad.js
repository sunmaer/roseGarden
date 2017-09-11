/**
 * 图片懒加载
 */

var lazyLoad = function() {
	
	// 加载图片
	function loadImg() {
		let imgs = document.querySelectorAll('img[data-src]');
		let scrollTop = document.body.clientHeight + document.body.scrollTop || document.documentElement.scrollTop;
		[].slice.call(imgs, 0).forEach(function(img, index) {
			if(img.offsetTop < scrollTop) {
				if(!img.src) {
					img.src = img.dataset.src;
				}
			}
		})
	}
	
	// 函数节流
	function throttle(fn, delay) {
		
	}
	
	window.onscroll = function() {
		loadImg()
	}
}
