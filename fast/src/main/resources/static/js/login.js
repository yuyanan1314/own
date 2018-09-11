layui.define(['jquery', 'form', 'layer', 'element'], function(exports) {
	var $ = layui.jquery,
		form = layui.form,
		layer = layui.layer,
		element = layui.element;
	
	var abcd = function() {
		alert(abcd);
	}
	
	/**
	 *@todo 模拟登录
	 * 判断初次登录时，跳转到登录页
	 */
	var login = localStorage.getItem('login');
	$('.loginout').click(function() {
		login = 0;
		localStorage.setItem('login', login);
	});
	$('.loginin').click(function() {
		login = 1;
		localStorage.setItem('login', login);
	});
	
	exports('login', {});
});