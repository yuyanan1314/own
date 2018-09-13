if (layui === undefined) {
  console.error('请先引用layui.js文件.');
} else {

  var modules = {
    login: 'fast_modules/login',
    app: 'fast_modules/app',
    admin: 'fast_modules/admin',
    axios: 'fast_modules/axios',
    lodash: 'fast_modules/lodash',
    menu: 'fast_modules/menu',
    mockjs: 'fast_modules/mockjs',
    mockjsbase: 'fast_modules/mockjsbase',
    route: 'fast_modules/route',
    tabs: 'fast_modules/tabs',
    utils: 'fast_modules/utils',
    component:'fast_modules/component',
    nprogress:'fast_modules/nprogress',
    kit:'fast_modules/kit',
    sidebar:'fast_modules/sidebar',
    select:'fast_modules/select',
    echarts:'fast_modules/echarts'
  };

  layui.injectModules(modules);
}