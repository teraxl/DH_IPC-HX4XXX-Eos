!function(){define(function(require,a,b){b.exports=require("jsCore/pageTab")}),define("heatmap",function(require,a,b){var c=require("jsCore/rpc"),d=require("jsCore/pageBase"),e=require("jsCore/plugin"),f=(require("common/common"),null),g=webApp.CHANNEL_NUMBER>1?1:0,h=0,i=null,j=!1,k=!1;b.exports=d.extend({init:function(){f=this,f.render()},render:function(){f.$("#heat_gif").hide(),f.$("[btn-for=onExport]").removeClass("disabled").prop("disabled",!1),e.addEvent("HeatmapData",function(a){clearInterval(i),k=!0,f.$("#heat_gif").hide(),f.$("[btn-for=onExport]").removeClass("disabled").prop("disabled",!1),f.$("#heat_tipLong").tip("success",tl("exportSuccessHeatMap")+a),f._detachPro()})},leave:function(){j&&f._detachPro()},onExport:function(){return e?void e.SetCGISessionID(c.getSession()-0).done(function(){h=(h+1)%65536,k=!1,c.RadiometryManager.attachProc(h,g).done(function(){j=!0,e.SnatchAtHeatmapData().done(function(){f.$("#heat_tip").text(tl("pleaseWaitLastDown")),f.$("#heat_gif").show(),f.$("[btn-for=onExport]").addClass("disabled").prop("disabled",!0),setTimeout(f.toFetch,1e3)})})}):!1},toFetch:function(){c.RadiometryManager.toFetch(g).done(function(a){if("Ready"==a.params.status){if(k)return;var b=0;i=setInterval(function(){b>600?(f.$("#heat_gif").hide(),f.$("[btn-for=onExport]").removeClass("disabled").prop("disabled",!1),f._detachPro(),f.$("#heat_tipLong").tip("error",tl("failedHeatMap")),clearInterval(i)):k&&clearInterval(i),b++},100)}}).fail(function(){f._detachPro(),f.$("#heat_tipLong").tip("error",tl("busy"))})},_detachPro:function(){c.RadiometryManager.detachProc(h,g).done(function(){j=!1,f.$("#heat_gif").hide(),f.$("[btn-for=onExport]").removeClass("disabled").prop("disabled",!1)})}})})}(jQuery);