function openPopup() {

			 $("#cityBtn").on({
    click: (event) =>
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
    
            for (let i = 0; i < rows.length; i++) {
                let citycode = rows[i]["citycode"];
                let cityname = rows[i]["cityname"];
                
    
            let html =`
            <table border="">
            <tr>
                <td>코드</td>
                <td>도시명</td>
            </tr>
            <tr>
                <td>${ citycode }</td>
                <td>${ cityname }</td>
            </tr>
            </table>
            `;
            $("#citycode").append(html);
            
            }
            
            console.log(rows);
        }),
    }); 
            var width = 700;
            var height = 650;
            
            var left = (window.screen.width / 2) - (width/2);
            var top = (window.screen.height / 4);
            
            var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	
    	      var url = "station";
            window.open(url,'width=500,height=500',windowStatus);

            
          }