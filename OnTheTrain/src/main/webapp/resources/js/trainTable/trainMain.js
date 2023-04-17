$("#traintable_btn").on({
click: (event) =>
    $.ajax({
    method: "GET",
    url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo",
    data: {
        serviceKey:
            "gmS8oJCD4iJ/Qtk/BRoulaCXaZsf3t7Cp/lgUGBdLlB7MeMJ7NGSbyM64g837jMxFpopfo6k2VpAhod/vcvyJQ==",
        pageNo: "1",
        numOfRows: "10",
        _type: "json",
        depPlaceId: $("#depPlaceId").val(),
        // depPlaceId: "NAT010000",
        arrPlaceId: $("#arrPlaceId").val(),
        // arrPlaceId: "NAT010415",
        depPlandTime: $("#depPlandTime").val(),
        // depPlandTime: "20230403",
        trainGradeCode: "00",
        async:false
        },
    }).done(function (data) {
        $("#train").empty();
        const json = JSON.stringify(data);
      // document.write(json);
        console.log(data);
        let rows = data["response"]["body"]["items"]["item"];

        for (let i = 0; i < rows.length; i++) {
            let tr = document.createElement("tr");
            let charge = rows[i]["adultcharge"];
            let arrplace = rows[i]["arrplacename"];
            let arrtime = rows[i]["arrplandtime"];
            let train = rows[i]["traingradename"];
            let depname = rows[i]["depplacename"];
            let deptime = rows[i]["depplandtime"];
            let no = rows[i]["trainno"];
            let time = arrtime - deptime;

            let chiChargeN = charge*(5-10/100) ;
            let oldChargeN = charge*(7-10/100) ;

        let html = `<table border="1px" align="center" id="myTable">
        <thead>
        <tr>
            <th width="50px">구분</th>
            <th width="100px">열차 번호</th>
            <th width="80px">출발역</th>
            <th width="80px">도착역</th>
            <th>특실</th>
            <th>일반실</th>
            <th width="50px">운임요금</th>
            <th width="50px">소요시간</th>
            <th width="50px">출발시간</th>
            <th width="50px">도착시간</th>
        </tr>
        </thead>
        <tbody>
          <tr>
          <td>${train}</td>
          <td>${no}</td>
          <td>${depname}</td>
          <td>${arrplace}</td>
          <td>
            <input type="submit" value="좌석선택" style="cursor: pointer;">
            <br>
            <input type="submit" value="예약하기" style="cursor: pointer;">
          </td>
          <td>
            <input type="submit" value="좌석선택" style="cursor: pointer;">
            <br>
            <input type="submit" value="예약하기" style="cursor: pointer;">
          </td>
          <td>
          ${charge}
          </td>
          <td>${time}</td>
          <td>${arrtime}</td>
          <td>${deptime}</td>
          </tr>
        </tbody>
      </table>`;
        
    
    
      let btn =`<table border="1" align="center">
      <tr>
            <td rowspan="2" width="100px">열차번호</td>
            <td colspan="3">특실</td>
            <td colspan="3">일반실</td>
            <!-- <td></td>
            <td></td>
            <td></td>
            <td></td> -->
        </tr>
        <tr>
            <td>어른</td>
            <td>어린이</td>
            <td>경로</td>
            <td>어른</td>
            <td>어린이</td>
            <td>경로</td>
            <!-- <td></td> -->
        </tr>
        <tr>
            <td>${no}</td>
            <td></td>
            <td></td>
            <td></td>
            <td>${charge}</td>
            <td>${chiChargeN}</td>
            <td>${oldChargeN}</td>
        </tr>
        <tr>
            <td>합계</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
      </table>`;
        
        $('#charge_btn').click(function(){
          $('#chargetable').append(btn);
        })
        
        $("#train").append(html);
      }
      console.log(rows);
    }),
});