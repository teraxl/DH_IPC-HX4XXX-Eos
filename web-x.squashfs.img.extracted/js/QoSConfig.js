!function(){define(function(require,a,b){b.exports=require("jsCore/pageTab")}),define("qos",function(require,a,b){var c=require("jsCore/rpc"),d=require("common/common"),e=require("jsCore/pageBase"),f=null,g={},h={};b.exports=e.extend({init:function(){f=this,-1!==webApp.DeviceType.indexOf("SD")&&f.$("#QoS_wireless").hide(),f.$("#QoS_input_realTime, #Qos_input_doManage").numberfield({min:0,max:63,allowDecimal:!1,allowNegative:!1}),f.render()},render:function(){c.ConfigManager.getConfig(["Qos","WMM"]).done(function(a){g=a[0].params.table,h=a[1].params.table,f._renderElements()})},_renderElements:function(){f.$("#QoS_input_realTime").val(g.LiveVideo),f.$("#Qos_input_doManage").val(g.Commands),webApp.Is3G||webApp.WIFI?(f.$("#QoS_wireless").show(),f.$("#QoS_input_wireless").prop("checked",h.Enable)):f.$("#QoS_wireless").hide()},onDefault:function(){c.ConfigManager.getDefault(["Qos","WMM"]).done(function(a){g=a[0].params.table,h=a[1].params.table,f._renderElements(),f.tip("success","Defaultsuccess")}).fail(function(){f.tip("error","Defaultfailure")})},onRefresh:function(){c.ConfigManager.getConfig(["Qos","WMM"]).done(function(a){g=a[0].params.table,h=a[1].params.table,f._renderElements(),f.tip("success","Operateingsuccess")}).fail(function(){f.tip("error","Operateingfailure")})},onConfirm:function(){g.LiveVideo=f.$("#QoS_input_realTime").numberfield("value"),g.Commands=f.$("#Qos_input_doManage").numberfield("value"),(webApp.Is3G||webApp.WIFI)&&(h.Enable=f.$("#QoS_input_wireless").is(":checked")),c.ConfigManager.setConfig(["Qos","WMM"],[g,h]).done(function(a){d.chkMutilCallRet(a)?f.tip("success","w_save Succeed"):f.tip("error","Saving failure")})}})})}(jQuery);