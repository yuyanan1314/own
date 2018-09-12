/** kitadmin-v2.1.0 MIT License By http://kit.zhengjinfan.cn Author Van Zheng */
;"use strict";
var mods = ["element", "sidebar", "mockjs", "select", "tabs", "menu", "route",
  "utils", "component", "kit", "app"];
layui.define(mods, function (e) {
  layui.element;
  var t = layui.utils, a = layui.jquery, n = (layui.lodash, layui.route),
      i = layui.tabs, l = layui.layer, o = layui.menu, m = layui.component,
      s = layui.kit, p = function () {
        this.config = {elem: "#app", loadType: "SPA"}, this.version = "1.0.0"
      };
      
  p.prototype.ready = function (e) {
    var i = this.config,
        o = (0, t.localStorage.getItem)("KITADMIN_SETTING_LOADTYPE");
    null !== o && void 0 !== o.loadType && (i.loadType = o.loadType), s.set(
        {type: i.loadType}).init(), u.routeInit(i), u.menuInit(i), "TABS"
    === i.loadType && u.tabsInit(), "" === location.hash && t.setUrlState("主页",
        "#/"),  m.on("nav(header_right)", function (e) {
      var t = e.elem.attr("kit-target");
      "setting" === t && layui.sidebar.render({
        elem: e.elem,
        title: "设置",
        shade: !0,
        dynamicRender: !0,
        url: "/s/views/setting.html"
      }), "help" === t && l.alert("如有疑问,请联系管理员！")
    }), layui.mockjs.inject(APIs), "SPA" === i.loadType
    && n.render(), "function" == typeof e && e()
  };
  var u = {
    routeInit: function (e) {
      var t = this, a = {
        r: [{
          path: "/user/index",
          component: "/s/views/user/index.html",
          name: "用户列表",
          children: [{
            path: "/user/create",
            component: "/s/views/user/create.html",
            name: "新增用户"
          }, {
            path: "/user/edit",
            component: "/s/views/user/edit.html",
            name: "编辑用户"
          }]
        }],
        routes: [{
          path: "/layui/fly",
          component: "https://fly.layui.com/",
          name: "Fly",
          iframe: !0
        }, {
          path: "/layui",
          component: "http://www.layui.com/",
          name: "Layui",
          iframe: !0
        }, {
          path: "/baidu",
          component: "https://www.baidu.com/",
          name: "百度一下",
          iframe: !0
        }, {
          path: "/user/index",
          component: "/s/views/user/index.html",
          name: "用户列表"
        }, {
          path: "/user/create",
          component: "/s/views/user/create.html",
          name: "新增用户"
        },
          {path: "/user/edit", component: "/s/views/user/edit.html", name: "编辑用户"},
          {
            path: "/cascader",
            component: "/s/views/cascader/index.html",
            name: "Cascader"
          }, {path: "/s/", component: "views/app.html", name: "主页"},
          {path: "/user/my", component: "views/profile.html", name: "用户中心"}, {
            path: "/inputnumber",
            component: "views/inputnumber.html",
            name: "InputNumber"
          }, {
            path: "/layui/grid",
            component: "/s/views/layui/grid.html",
            name: "Grid"
          }, {
            path: "/layui/button",
            component: "/s/views/layui/button.html",
            name: "按钮"
          },
          {path: "/layui/form", component: "/s/views/layui/form.html", name: "表单"},
          {
            path: "/layui/nav",
            component: "/s/views/layui/nav.html",
            name: "导航/面包屑"
          },
          {path: "/layui/tab", component: "/s/views/layui/tab.html", name: "选项卡"},
          {
            path: "/layui/progress",
            component: "/s/views/layui/progress.html",
            name: "progress"
          }, {
            path: "/layui/panel",
            component: "/s/views/layui/panel.html",
            name: "panel"
          }, {
            path: "/layui/badge",
            component: "/s/views/layui/badge.html",
            name: "badge"
          }, {
            path: "/layui/timeline",
            component: "/s/views/layui/timeline.html",
            name: "timeline"
          }, {
            path: "/layui/table-element",
            component: "/s/views/layui/table-element.html",
            name: "table-element"
          }, {
            path: "/layui/anim",
            component: "/s/views/layui/anim.html",
            name: "anim"
          }, {
            path: "/layui/layer",
            component: "/s/views/layui/layer.html",
            name: "layer"
          }, {
            path: "/layui/laydate",
            component: "/s/views/layui/laydate.html",
            name: "laydate"
          }, {
            path: "/layui/table",
            component: "/s/views/layui/table.html",
            name: "table"
          }, {
            path: "/layui/laypage",
            component: "/s/views/layui/laypage.html",
            name: "laypage"
          }, {
            path: "/layui/upload",
            component: "/s/views/layui/upload.html",
            name: "upload"
          }, {
            path: "/layui/carousel",
            component: "/s/views/layui/carousel.html",
            name: "carousel"
          }, {
            path: "/layui/laytpl",
            component: "/s/views/layui/laytpl.html",
            name: "laytpl"
          }, {
            path: "/layui/flow",
            component: "/s/views/layui/flow.html",
            name: "flow"
          }, {
            path: "/layui/util",
            component: "/s/views/layui/util.html",
            name: "util"
          }, {
            path: "/layui/code",
            component: "/s/views/layui/code.html",
            name: "code"
          }, {
            path: "/user/table",
            component: "/s/views/table/teble.html",
            name: "Table"
          }, {
            path: "/user/table2",
            component: "/s/views/table/teble2.html",
            name: "数据表格2"
          }, {
            path: "/user/table3",
            component: "/s/views/table/teble3.html",
            name: "数据表格3"
          }, {
            path: "/user/form",
            component: "/s/views/form/index.html",
            name: "Form"
          }, {
            path: "/docs/mockjs",
            component: "/s/docs/mockjs.html",
            name: "拦截器(Mockjs)"
          },
          {path: "/docs/menu", component: "docs/menu.html", name: "左侧菜单(Menu)"},
          {
            path: "/docs/route",
            component: "/s/docs/route.html",
            name: "路由配置(Route)"
          },
          {path: "/docs/tabs", component: "docs/tabs.html", name: "选项卡(Tabs)"},
          {
            path: "/docs/utils",
            component: "/s/docs/utils.html",
            name: "工具包(Utils)"
          }, {
            path: "/views/select",
            component: "/s/views/select/index.html",
            name: "Select"
          }, {
            path: "/exception/403",
            component: "/s/views/exception/403.html",
            name: "403"
          }, {
            path: "/exception/404",
            component: "/s/views/exception/404.html",
            name: "404"
          }, {
            path: "/exception/500",
            component: "/s/views/exception/500.html",
            name: "500"
          }]
      };
      return "TABS" === e.loadType && (a.onChanged = function () {
        i.existsByPath(location.hash) ? i.switchByPath(location.hash)
            : t.addTab(location.hash, (new Date).getTime())
      }), n.setRoutes(a), this
    }, addTab: function (e, t) {
      var a = n.getRoute(e);
      a && i.add({
        id: t,
        title: a.name,
        path: e,
        component: a.component,
        rendered: !1,
        icon: "&#xe62e;"
      })
    }, menuInit: function (e) {
      var t = this;
      return o.set({
        dynamicRender: !1,
        isJump: "SPA" === e.loadType,
        onClicked: function (a) {
          if ("TABS" === e.loadType && !a.hasChild) {
            var n = a.data, i = n.href, l = n.layid;
            t.addTab(i, l)
          }
        },
        elem: "#menu-box",
        remote: {url: "/api/getmenus", method: "post"},
        cached: !1
      }).render(), t
    }, tabsInit: function () {
      i.set({
        onChanged: function (e) {
        }
      }).render(function (e) {
        e.isIndex && n.render("#/")
      })
    }
  };
  (new p).ready(function () {
    console.log("Init successed.")
  }), e("admin", {})
});
// # sourceMappingURL=admin.js.map
