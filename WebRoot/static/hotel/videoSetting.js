/**
 * 
 */

$(function() {
    if($("#videoSetting").length>0){

        var app = new Vue({
            el:"#videoSetting",
            data:{
                selectRow:-1,
                supplier:0,
                desc:"",
                page:1,
                backPage:false,
                nextPage:true,
                videoList:[],
                playList:[]

            },
            created:function(){
                this.addRow(-1,"",null);
                this.oldPlayList();
            },
            computed:{

            },
            methods:{
                addRow:function(index,page,formula){

                    if(formula=='jia'){
                        if(this.nextPage==true){
                            this.page=this.page+1;
                            page++;
                        }else{
                            return;
                        }
                    }else if(formula=='jian'){
                        if(this.backPage==true) {
                            if (page > 1) {
                                this.page = this.page - 1;
                                page--;
                            }
                        }else{
                            return;
                        }
                    }

                    var $this = this;
                 
               	 $.ajax({
        	         url:$.ctx+"getVideoList", 
        	         dataType:"json",
        		        success:function(data){
        		        	 
                              if(!!data&&data.length>0){

                            	  $this.videoList=[];
                                      var playUrl=""; 
                                      
                                          for(var i=0;i<data.length;i++){ 
                                        	//   self.playList
                                              $this.videoList.push({  
                                                      title:data[i].TITLE, 
                                                      playtime:data[i].PLAYTIME,
                                                      screenshot:$.ctx+data[i].SCREENSHOT, 
                                                      VIDEOPATH:data[i].FILEPATH                                            
                                                  }
                                              );
                                    }
                                  
                                }
        		        }
               	  }); 
                    	 
                },
                clearOldPlayList:function(){
                    this.playList.splice(0,this.playList.length);
                },
                oldPlayList:function(){
                    var self=this; 
                    $.ajax({
                        url:$.ctx+"getPlayListData",  
                        type:"GET",
                        dataType:"json"
                    }).done(function(data){
                    	 if(!!data&&data.length>0){ 
                                var playUrl=""; 
                                
                                for(var i=0;i<data.length;i++){ 
                                    self.playList.push({
                                    		title:data[i].TITLE, 
                                            playtime:data[i].PLAYERTIME,
                                            screenshot:data[i].VIDEOIMG, 
                                            VIDEOPATH:data[i].VIDEOPATH  
                                          });
                                }
                            
                        } 
                    }); 
                },
                addPlayList:function(item,index){
                    if(this.playList.length<5){
                        this.playList.push(item);
                        this.videoList.splice(index, 1);
                    }else{
                    	
                    	bootbox.alert("最多选择五个视频");
                    }
                },
                removePlayList:function(item,index){
                    this.playList.splice(index, 1);
                    this.videoList.push(item);
                },
                upIndex:function(index){
                    var tmp=this.playList[index-1];
                    var tmp2=this.playList[index];
                    this.playList.splice(index-1, 1, tmp2);
                    this.playList.splice(index, 1, tmp);
                },
                savePlayVideo:function(){
                	 
                    $.ajax({
                        url:$.ctx+"/playlist/saveList",  
                        method:"post",  
                        data:{
                        	"params":JSON.stringify(this.playList)
                        }
                    }).done(function(data){
                    	 
                        if(data=="success"){ 
                        	bootbox.alert("保存成功！");
                        	app.addRow(1,1,1);
                        }
                    });
                },
                downIndex:function(index){
                    var tmp=this.playList[index+1];
                    var tmp2=this.playList[index];
                    this.playList.splice(index+1, 1, tmp2);
                    this.playList.splice(index, 1, tmp);
                }
            }
        });
    }
});