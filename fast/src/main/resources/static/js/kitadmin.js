if (layui === undefined) {
  console.error('请先引用layui.js文件.');
} else {

  var modules = {
    admin: 'js/lay/kit_modules/admin',
    axios: 'js/lay/kit_modules/axios',
    lodash: 'js/lay/kit_modules/lodash',
    menu: 'js/lay/kit_modules/menu',
    mockjs: 'js/lay/kit_modules/mockjs',
    mockjsbase: 'js/lay/kit_modules/mockjsbase',
    route: 'js/lay/kit_modules/route',
    tabs: 'js/lay/kit_modules/tabs',
    utils: 'js/lay/kit_modules/utils',
    component:'js/lay/kit_modules/component',
    nprogress:'js/lay/kit_modules/nprogress',
    kit:'js/lay/kit_modules/kit',
    sidebar:'js/lay/kit_modules/sidebar',
    select:'js/lay/kit_modules/select',
    echarts:'js/lay/kit_modules/echarts'
  };

  layui.injectModules(modules);
}