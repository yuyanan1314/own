/**
 * 定义公共模块
 */
layui.define([ 'jquery', 'layer' ], function(exports) {
	var $ = layui.jquery,  layer = layui.layer;

	var obj = {
		/** * post请求 */
		post : function(url, param, success) {
				$.post(url, param, function(result){
					rollback(result, success);
				}, 'json');
		},
		/** * get请求 */
		get : function(url, param, rollback) {
			if (url && param && rollback) {
				$.get(url, param, rollback, 'json');
			}
		}
	};
	
	var rollback = function(result, success){
		if (!result || !result.code || !result.msg) {
			layer.msg("返回值不正确");
		}
		if (result.code == '0') {
			if (success) {
				success(result);
			}
		} else {
			rollback_fail(result);
		}
	}

	/**
	 * 默认失败处理
	 */
	var rollback_fail = function(result) {
    if (result.code == '101') {
      var storage = window.sessionStorage;
      storage.clear();
			location.href = '/login'
    }else{
      layer.msg("错误[" + result.code + "]:" + result.msg);
    }
	}

	exports('app', obj);
});