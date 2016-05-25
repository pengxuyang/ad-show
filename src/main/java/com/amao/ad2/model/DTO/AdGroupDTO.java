package com.amao.ad2.model.DTO;

import com.amao.ad2.model.AdGroup;

import java.util.Date;

public class AdGroupDTO extends AdGroup {
    String launchState;

    String compnayName;

    public String getCompnayName() {
        return compnayName;
    }

    public void setCompnayName(String compnayName) {
        this.compnayName = compnayName;
    }

    public String getLaunchState() {
        return launchState;
    }

    public void setLaunchState(String launchState) {
        this.launchState = launchState;
    }
}