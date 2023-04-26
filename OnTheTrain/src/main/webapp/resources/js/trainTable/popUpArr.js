	function openPopup1() {
	
	            var width = 700;
	            var height = 650;
	            
	            var left = (window.screen.width / 2) - (width/2);
	            var top = (window.screen.height / 4);
	            
	            var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
	    	    var url = "station";
	            var popup = window.open(url,'width=500,height=500',windowStatus);
	            
	            
	            $.ajax({
			        method: "GET",
			        url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList",
			        data: {
			            serviceKey:
			                "gmS8oJCD4iJ/Qtk/BRoulaCXaZsf3t7Cp/lgUGBdLlB7MeMJ7NGSbyM64g837jMxFpopfo6k2VpAhod/vcvyJQ==",
			            _type: "json",
			            
			            async:false
	            },
	        }).done(function (data) {
	            $("#train").empty();
	            const json = JSON.stringify(data);
	          // document.write(json);
	            console.log(data);
	            let rows = data["response"]["body"]["items"]["item"];
	    
	    		let html = '';
	    		
	            for (let i = 0; i < rows.length; i++) {
	                let citycode = rows[i]["citycode"];
	                let cityname = rows[i]["cityname"];
	    		
	            html += `<button style="cursor: pointer;" class="city-btn" value='${citycode}' data-cityname='${cityname}'>${cityname}</button>`;
	            
	            }
	            html = `
						  <fieldset>
						    <legend>지역</legend>
						    <div class='button-group'>
						      ${html}
						    </div>
						  </fieldset>`;
					$("#citycode",popup.document).empty().append(html);
	            console.log(rows);
	        
	        
	        
	        
	        
	        
	  		
	  		$(popup.document).on('click',".city-btn", function() {
	            let selectedCitycode = $(this).val();
	             let selectedCityname = $(this).data('cityname');
	  			
	  		$.ajax({
			    method: "GET",
			    url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList",
			    data: {
			        serviceKey:
			            "gmS8oJCD4iJ/Qtk/BRoulaCXaZsf3t7Cp/lgUGBdLlB7MeMJ7NGSbyM64g837jMxFpopfo6k2VpAhod/vcvyJQ==",
			        _type: "json",
			        pageNo: "1",
			        numOfRows: "20",
			        cityCode: selectedCitycode,
			        async:false
			    },
			    }).done(function (data) {
			    		const json = JSON.stringify(data);
				          console.log(data);
				          let rows = data["response"]["body"]["items"]["item"];
				          
				         let html = '';
				          
				          for (let i = 0; i < rows.length; i++) {
				          
			              let nodeid = rows[i]["nodeid"];
			              let nodename = rows[i]["nodename"];
			              html += `<button style="cursor: pointer;"  class="station-btn" value='${nodeid}'>${nodename}</button>`;
	  		}
	          		$("#stationcode",popup.document).empty().append(` 
	    <fieldset>
	      <legend>역</legend>
	      <div class='button-group'>
	        ${html}
	      </div>
	    </fieldset>
	  `);
				
	            console.log(rows);
	     $(popup.document).on('click',".station-btn", function() {
			    let selectedStationcode = $(this).val();
			    let selectedStationname = $(this).text(); // 수정된 부분
			    $("#arrPlaceId").val(selectedStationcode);
			    $(".arrPlaceText").val(selectedStationname);
			});
						
				 			});
				            
				          });
				   });
		 };
	          

	          
	          