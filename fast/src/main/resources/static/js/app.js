/**
 * 定义公共模块
 */
layui.define([ 'jquery', 'layer', 'login' ], function(exports) {
	var $ = layui.jquery, login = layui.login, layer = layui.layer;

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
      layer.msg("错误信息[" + result.code + "]:" + result.msg);
	}

	exports('app', obj);
});