/**
 * 定义公共模块
 */
layui.define([ 'jquery', 'layer' ], function(exports) {
	var $ = layui.jquery,  layer = layui.layer;

	var app = {
		/** * post请求 */
		post : function(url, param, success) {
				$.post(url, param, function(result){
          app.result.handler(result, success);
					//rollback(result, success);
				}, 'json');
		},
		/** * get请求 */
		get : function(url, param, rollback) {
			if (url && param && rollback) {
				$.get(url, param, rollback, 'json');
			}
		},
    /**
		 * 返回值处理
     */
		result : {
			handler : function(result, success){
        if (!result) {
          layer.msg("系统错误:http返回格式不正确,请联系管理员");
          return;
        }
        if (result.code == 0) {
          if (success) {
            success(result);
          }
        } else {
          this.fail(result);
        }
      },
      /**
			 * 返回值不等于0时
       * @param result
       */
			fail : function(result) {
        if (result.code == 101) {
          var storage = window.sessionStorage;
          storage.clear();
          location.href = '/login'
        }else{
          layer.msg("错误[" + result.code + "]:" + result.msg);
        }
      }
		}
	};

	exports('app', app);
});