package com.kh.onthetrain.API.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/* 한국관광공사_국문 관광정보 서비스_GW - 지역기반 관광 정보의 반환값 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TouristAttraction {
    private String addr1;
    private String addr2;
    private String areacode;
    private String booktour;
    private String cat1;
    private String cat2;
    private String cat3;
    private String contentid;
    private String contenttypeid;
    private String createdtime;
    private String firstimage;
    private String firstimage2;
    private String cpyrhtDivCd;
    private String mapx;
    private String mapy;
    private String mlevel;
    private String modifiedtime;
    private String sigungucode;
    private String tel;
    private String title;
    private String zipcode;
    private String showflag;
}
