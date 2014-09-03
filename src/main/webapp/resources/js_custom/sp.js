/**
 * 
 */
	// 페이지 삭제
	function deletePage(div){
		console.log(div);
		var target = $(div).parent("div").parent("div").parent("div").parent("div").remove();
		console.log(target);
	}
	
	// 페이지 로드
	function loadPage(btn){
		var json = $(btn).attr("json");		
		var items = JSON.parse(json);
		
		$('.page').remove();
		
		var page_list = items.page_list;
		var title = items.title;
		
		console.log('page_list');
		console.log(page_list);
		
		// 페이지 추가
		console.log('page_list.length');
		console.log(page_list.length);
		for(i=0; i<page_list.length; i++){
			console.log('page_list[i]');
			console.log(page_list[i]);
			addPage();
			console.log(i);
		}
		
		$('#input_title').val(title);
		
		// 페이지 추가
		var pages = $('.page'); // 페이지들
		var textareas = $('textarea'); // 텍스트 area;		
		for(var i=0; i<pages.length; i++){
			console.log($(pages[i]));
			var uploaded_files = $(pages[i]).find('#uploaded_files');			
			if(page_list[i].img_url != undefined){
				var img = "<img src='./$id'/>";		            
	            img = img.replace('$id', page_list[i].img_url);		            
	            uploaded_files.append(img);
			}
			
			var contents = page_list[i].contents;
			contents = contents.replace('|', '\n');
			$(pages[i]).find("textarea").val(contents);
		}
		
		resetIndex();		
		$('#pre_pages').hide(1000);
	}
	
	
	// 페이지 올리기
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
	
	// 페이지 내리기
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
	
	// 페이지 인덱스 재세팅
	function resetIndex(){
		var page_list = $('.page');
		var page_list = $('.page');
		for(i=0; i<page_list.length; i++){
			$(page_list[i]).attr('index', i);
			$(page_list[i]).attr('max', page_list.length);
		}
	}
	
	// 페이지 추가
	function addPage(){
		var page = $(".page_repo")
					.clone()
					.removeClass("page_repo")
					.addClass("page")
					.hide()
					.appendTo('#page_list')
					.show(1000);
		fileUploadBind(page.children("div").children("div"));		
		resetIndex(); // 인덱스 재세팅
	}
	
	// 저장 & 보기
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
		}
		post_data.title = $('#input_title').val();
		
		console.log(JSON.stringify(post_data));
		$('#page_letter_input').val(JSON.stringify(post_data));
		
		// Input Validation
		if($('#input_title').val() == "" || $('#input_title').val() == null){
			alert('페이지 제목을 입력해주세요.');
		}
		else if(post_data.page_list.length == 0){
			alert('페이지가 없네요. 내용을 만드셔야....');
		}
		else{
			$('#form_letter').submit();
		}
		
				
	}
	
	// 파일 업로드 바인드
	function fileUploadBind(page){		
		//console.log(page);		 
		var fileuploaddiv = page.children('.panel-heading').children('span').children('#fileupload');
		var uploaded_files = page.children('.panel-body').children('div').children('#uploaded_files');
		//console.log(uploaded_files);
		
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