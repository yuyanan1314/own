layui.define(['jquery', 'form', 'layer', 'element', 'app'], function (exports) {
  var $ = layui.jquery,
      form = layui.form,
      layer = layui.layer,
      element = layui.element,
      app = layui.app;

  $('#forgot').on('click', function() {
    layer.msg('请联系管理员.');
  });

	//监听提交
	form.on('submit(login_hash)', function(data) {
		app.post("/o/login", data.field, function(result) {
			layer.msg("登录成功");
			location.href = "/";
		});
		return false;
	});

  /**
   *@todo 模拟登录
   * 判断初次登录时，跳转到登录页
   
  var login = localStorage.getItem('login');
  $('.loginout').click(function () {
    login = 0;
    localStorage.setItem('login', login);
  });
  $('.loginin').click(function () {
    login = 1;
    localStorage.setItem('login', login);
  });
*/
  exports('login', {});
});