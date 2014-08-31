/**
 * 
 */

	function deletePage(div){
		console.log(div);
		var target = $(div).parent("div").parent("div").parent("div").parent("div").remove();
		console.log(target);
	}
	
	function moveUp(div){
		
		var index = parseInt($(div).parent("div").parent("div").parent("div").parent("div").attr('index'));
		var max = parseInt($(div).parent("div").parent("div").parent("div").parent("div").attr('max'));
		
		console.log('index');
		console.log(index);
		console.log('max');
		console.log(max);
		
		if(index != 0){
			
			console.log('.page[index="'+ (index-1).toString() + '"]')
			
			var page1 = $('.page[index="'+ index.toString() + '"]');
			var page2 = $('.page[index="'+ (index-1).toString() + '"]');			
			console.log('page1');
			console.log(page1);
			console.log('page2');
			console.log(page2);			
			page1.after(page2);
			
			resetIndex();
		}
		else{
			alert('첫번째 페이지입니다.');	
		}
	}
	
	function moveDown(div){
		
		var index = parseInt($(div).parent("div").parent("div").parent("div").parent("div").attr('index'));
		var max = parseInt($(div).parent("div").parent("div").parent("div").parent("div").attr('max'));
		
		console.log('index');
		console.log(index);
		console.log('max');
		console.log(max);
		
		if(index != max-1){
			
			console.log('.page[index="'+ (index-1).toString() + '"]')
			
			var page1 = $('.page[index="'+ index.toString() + '"]');
			var page2 = $('.page[index="'+ (index+1).toString() + '"]');			
			console.log('page1');
			console.log(page1);
			console.log('page2');
			console.log(page2);			
			page1.before(page2);
			
			resetIndex();
		}
		else{
			alert('마지막 페이지입니다.');
		}
	}
	
	function resetIndex(){
		var page_list = $('.page');
		var page_list = $('.page');
		for(i=0; i<page_list.length; i++){
			$(page_list[i]).attr('index', i);
			$(page_list[i]).attr('max', page_list.length);
		}
	}
	
	function addPage(){
		var page = $(".page_repo")
					.clone()
					.removeClass("page_repo")
					.addClass("page")
					.hide()
					.appendTo('#page_list')
					.show(1000);
		fileUploadBind(page.children("div").children("div"));		
		resetIndex();
	}
	
	function postData(){
		
		//Json 형태의 데이터로 추출..		
		var post_data = {};
		post_data.page_list = [];
		var page_list = $('#page_list').children("div");
		
		page_cnt = page_list.length;
		
		var uploaded_files = $('#page_list .uploaded_files');
		var text_areas = $('#page_list textarea');
		
		for(i=0; i<page_cnt; i++){
			var page = {};			
			var img = $(uploaded_files[i]).children('img');
			console.log(img);
			if(img.length == 0){
				page.img_url = '';
			}
			else{
				console.log(img.attr('src'));
				page.img_url = img.attr('src');
				// 이미지 존재
			}
			//console.log(text_areas[i]);
			console.log($(text_areas[i]).val());
			
			var page = {}
			page.contents = $(text_areas[i]).val();
			page.img_url = img.attr('src');
			post_data.page_list.push(page);
			console.log($('#input_title').text());
			post_data.title = $('#input_title').val();
		}
		
		console.log(JSON.stringify(post_data));
		$('#page_letter_input').val(JSON.stringify(post_data));		
		$('#form_letter').submit();
		
//		$.ajax({			
//			type: 'post',				
//			url: './post',
//			contentType: "application/x-www-form-urlencoded; charset=UTF-8",				
//			dataType: "json",
//			beforeSend: function(){
//			     $("#loading").show();
//			},
//			complete: function(){
//			     $("#loading").hide();
//			},
//			data: {page_list : JSON.stringify(post_data)},				
//			success: function(data){
//				makeLetter(data);
//            },
//            error: function(XMLHttpRequest, textStatus, errorThrown) {	            	  
//              alert("Status: " + textStatus); alert("Error: " + errorThrown); 
//            }
//		});
		
	}
	
	function fileUploadBind(page){		
		//console.log(page);		 
		var fileuploaddiv = page.children('.panel-heading').children('span').children('#fileupload');
		var uploaded_files = page.children('.panel-body').children('div').children('#uploaded_files');
		console.log(uploaded_files);
		
		fileuploaddiv.fileupload({
		    dataType: 'json',
		    send: function (e, data) {
		    	var image = page.children('.panel-body').children('.div').children('img'); // 이미지 버튼
		    	image.remove();
		        $('#loading').show();
		        $('#mask').show();
		    },
		    done: function (e, data) {
		    	//console.log($(this).parent("#uploaded-files"));		    			    	
		    	$('#uploaded-files').hide();
		        $.each(data.result.files, function (index, file) {		        	
		        	$('img').hide();		            
		            var img = "<img src='./image/$id'/>";		            
		            img = img.replace('$id', file.id);		            
		            uploaded_files.append(img);		            
		            $('img').show();
		        });
		        $('#loading').hide();
		        $('#mask').hide();
		    },
		    /* ... */
		    progressall: function (e, data) {
		        /* var progress = parseInt(data.loaded / data.total * 100, 10);		        
		        $('#progress').css(
		            'width',
		            progress + '%'
		        ); */
		    }
		});
	}
	
	function makeLetter(data){
		console.log(data);		
		$('#make').hide();
		
		$('.letter_page').hide();
		$('.letter_page').append("<img src='" + data.page_list[0].img_url + "' style='width:100%'/>");
		
		$('.letter_contents').append(data.page_list[0].contents);
		$('.letter_page').show(500);
	}
	
	$(function(){
		$('#btn_page_add').bind('click', function(){addPage();});		
		$('#btn_post').bind('click', function(){postData();});
		$('#btn_page_add').click();
	});