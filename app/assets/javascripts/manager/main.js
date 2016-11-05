/*ajax地址*/

// $("#J_ajax_container").load("../views/1.htm")
$(document).ready(function(){
    // alert(1)
    $("#user").click(function(){
        $("#J_ajax_container").load("views/user.htm");
    });
    $("#role").click(function(){
        $("#J_ajax_container").load("views/role.htm");
    });
    $("#rolesq").click(function(){
        $("#J_ajax_container").load("views/rolesq.htm");
    });
    $("#ipgw").click(function(){
        $("#J_ajax_container").load("views/ipgw.htm");
    });
    $("#ipmd").click(function(){
        $("#J_ajax_container").load("views/ipmd.htm");
    });
    $("#ipurl").click(function(){
        $("#J_ajax_container").load("views/ipurl.htm");
    });
    $("#ipsearch").click(function(){
        $("#J_ajax_container").load("views/ipsearch.htm");
    });
    $("#zdchart").click(function(){
        $("#J_ajax_container").load("views/zdchart.htm");
    });
    $("#xychart").click(function(){
        $("#J_ajax_container").load("views/xychart.htm");
    });
    $("#yychart").click(function(){
        $("#J_ajax_container").load("views/yychart.htm");
    });
    $("#yxchart").click(function(){
        $("#J_ajax_container").load("views/yxchart.htm");
    });
    $("#zdpm").click(function(){
        $("#J_ajax_container").load("views/zdpm.htm");
    });
    $("#yypm").click(function(){
        $("#J_ajax_container").load("views/yypm.htm");
    });
    $("#nlManage").click(function(){
        $("#J_ajax_container").load("views/nlManage.htm");
    });
    $("#yyManage").click(function(){
        $("#J_ajax_container").load("views/yyManage.htm");
    });
    $("#sqManage").click(function(){
        $("#J_ajax_container").load("views/sqManage.htm");
    });
    $("#hmdManage").click(function(){
        $("#J_ajax_container").load("views/hmdManage.htm");
    });
    $("#jkManage").click(function(){
        $("#J_ajax_container").load("views/jkManage.htm");
    });
    $("#systemMonitor").click(function(){
        $("#J_ajax_container").load("views/systemMonitor.htm");
    });
    $("#hardwareMonitor").click(function(){
        $("#J_ajax_container").load("views/hardwareMonitor.htm");
    });
    $("#serviceMonitor").click(function(){
        $("#J_ajax_container").load("views/serviceMonitor.htm");
    });
    $("#systemAlarm").click(function(){
        $("#J_ajax_container").load("views/systemAlarm.htm");
    });
    $("#inspection").click(function(){
        $("#J_ajax_container").load("views/inspection.htm");
    });
    $("#dataMonitor").click(function(){
        $("#J_ajax_container").load("views/dataMonitor.htm");
    });

});

function chkTxt(linkboxId,showId){
    $("#"+linkboxId).children("li").click(function(){
        var txt=$(this).text();
        $("#"+showId).text(txt);
    })
}
function show(boxId){
    $("#"+boxId).show();
}
function hide(boxId){
    $("#"+boxId).hide();
}
function fadeIn(boxId){
    $("#"+boxId).fadeIn();
}
function fadeOut(boxId){
    $("#"+boxId).fadeOut();
}
function showOrNot(boxId){
    if ($("#"+boxId).is(":hidden")) {
        $("#"+boxId).show();
    }else{
        $("#"+boxId).hide();
    };

}
function switchOn(chkId){
    $("#"+chkId).attr("checked", !$(this).attr("checked")).next().find(".swi_check>.checked").css("left","2px");

}
/*正在巡检动画*/
function scaleX(num){
    $("#chkDoing"+num).animate({width:"80px"},500);
}

function addWarn(boxId){
    $("#"+boxId).addClass("warn");
}
/*滚动条滚动到指定位置*/
function scrollToP(boxId){
    $("html,body").animate({scrollTop:$("#"+boxId).offset().top},1000)
}

/*异常项计算*/
function addCell(n){
    var warnEle = $("#categoryList"+n).find("li").find(".check-warning-num");
    var warnNum=0;
    warnEle.each(function(){
        warnNum=warnNum+parseInt($(this).text());
    })
    var cellNum=$("#categoryList"+n).find("li").length;
    var infoHtml="异常"+"<span class='c-orange'>"+warnNum+"项</span>"

    // var totalInfo=totalNum+"个异常项";
    if(warnNum>0){
        $("#info"+n).html(infoHtml);
        // $("#totalInfo").html(totalInfo);

    }
}
function total(){
    var totalNum=0;
    $(".check-warning-num").each(function(){
        totalNum=totalNum+parseInt($(this).text());
        var totalInfo=totalNum+"个异常项";
        $("#totalInfo").html(totalInfo);
    })

}
/*年月周天切换*/
function changeEle(){
    var optionVal=$("#changeCyc").val();
    if(optionVal=="year"){
        $("#monthSel").show();
        $("#monthLabel").show();
        $("#daySel").show();
        $("#dayLabel").show();
        $("#weekdaySel").hide();
    }
    if(optionVal=="month"){
        $("#monthSel").hide();
        $("#monthLabel").hide();
        $("#daySel").show();
        $("#dayLabel").show();
        $("#weekdaySel").hide();
    }
    if(optionVal=="week"){
        $("#monthSel").hide();
        $("#monthLabel").hide();
        $("#daySel").hide();
        $("#dayLabel").hide();
        $("#weekdaySel").show();
    }if(optionVal=="day"){
        $("#monthSel").hide();
        $("#monthLabel").hide();
        $("#daySel").hide();
        $("#dayLabel").hide();
        $("#weekdaySel").hide();
    }
}
/*start*/
$(function(){
    /*设置巡检项*/
    $("input[type='checkbox']").prop("checked",true);
    $(".dap-ais-category-list").each(function(index){
        var lnum=index+1;
        $("#checkbox"+lnum).parents(".dap-ais-category-ico-box").on("click",function(){
            var checkbox=$(this).find("input[type='checkbox']");
            var oldChk=checkbox.prop("checked");
            checkbox.prop("checked",!oldChk);
            $("#categoryList"+lnum).find("li").find("input[type='checkbox']").prop("checked",!oldChk);
            if(!checkbox.prop("checked")){
                $("#checkbox"+lnum).parent().prev(".dap-ais-category-ico").addClass("icoGray");
                $("#categoryList"+lnum).find("li").find(".icon-box").addClass("imgGray");
            }else{
                $("#checkbox"+lnum).parent().prev(".dap-ais-category-ico").removeClass("icoGray");
                $("#categoryList"+lnum).find("li").find(".icon-box").removeClass("imgGray");
            }
        })
        $("#categoryList"+lnum).find("li").each(function(index){
            $(this).find(".icon-box").on("click",function(){
                var checkbox=$(this).find("input[type='checkbox']");
                var oldChk=checkbox.prop("checked");
                checkbox.prop("checked",!oldChk);
                if(!checkbox.prop("checked")){
                    $(this).addClass("imgGray");
                }else{
                    $(this).removeClass("imgGray");
                }
                var chkEle=$("#categoryList"+lnum).find("input[type='checkbox']:checked");
                if(chkEle.length==0){
                    $("#checkbox"+lnum).prop("checked",false);
                    $("#checkbox"+lnum).parent().prev(".dap-ais-category-ico").addClass("icoGray");
                }
                else{
                    $("#checkbox"+lnum).prop("checked",true);
                    $("#checkbox"+lnum).parent().prev(".dap-ais-category-ico").removeClass("icoGray");
                }
            });
        })
    })


    $('#myTab a').click(function (e) {
        e.preventDefault();
        // $("#totalNum").text(totalNum);
        $(this).tab('show')
    })

    /*是否检查*/
    $(".dap-ais-categorybox").on('click',function(){
        if($(this).hasClass("dap-ais-nochoose")){
            $(this).removeClass("dap-ais-nochoose");}
        else{
            $(this).addClass("dap-ais-nochoose");}
    })

    /*开始巡检*/
    $(".check-doing").each(function(index){
        setTimeout(scaleX(index+1),500);
    })


})





