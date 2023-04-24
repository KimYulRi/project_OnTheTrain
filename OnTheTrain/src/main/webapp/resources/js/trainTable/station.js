$("#stationBtn").on({
  click: (event) =>
    $.ajax({
      method: "GET",
      url: "https://cors-anywhere.herokuapp.com/http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList",
      data: {
        serviceKey:
          "gmS8oJCD4iJ/Qtk/BRoulaCXaZsf3t7Cp/lgUGBdLlB7MeMJ7NGSbyM64g837jMxFpopfo6k2VpAhod/vcvyJQ==",
        _type: "json",
        pageNo: "1",
        numOfRows: "20",
        cityCode: 21,
        async: false,
      },
    }).done(function (data) {
      $("#stationcode").empty();
      const json = JSON.stringify(data);
      // document.write(json);
      console.log(data);
      let rows = data["response"]["body"]["items"]["item"];

      for (let i = 0; i < rows.length; i++) {
        let nodeid = rows[i]["nodeid"];
        let nodename = rows[i]["nodename"];

        let html = `
    <table border="">
    <tr>
        <td>아이디</td>
        <td>역명</td>
    </tr>
    <tr>
        <td>${nodeid}</td>
        <td>${nodename}</td>
    </tr>
    </table>
    `;
        $("#stationcode").append(html);
      }
      console.log(rows);
    }),
});

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