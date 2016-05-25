package com.amao.ad2.web.ctrl;

import com.amao.ad2.db.AdExposureMapper;
import com.amao.ad2.db.AdGroupMapper;
import com.amao.ad2.model.AdExposure;
import com.amao.ad2.model.AdExposureExample;
import com.amao.ad2.model.DTO.AdGroupDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by pxy on 2016/5/25.
 */
@Controller
@RequestMapping(value = "launch")
public class LaunchController {

    @Resource
    private AdGroupMapper adGroupMapper;
    @Resource
    private AdExposureMapper exposureMapper;

    @RequestMapping(value = "index")
    public String index(){
        return "adExposure/list";
    }


    @RequestMapping(value = "ajax")
    @ResponseBody
    public List<AdGroupDTO> getAd(){
        List<AdGroupDTO> adGroups = adGroupMapper.getAll();
        for(AdGroupDTO adGroupDTO : adGroups){
            AdExposureExample adExposureExample = new AdExposureExample();
            AdExposureExample.Criteria criteria = adExposureExample.createCriteria();
            criteria.andAdIdEqualTo(adGroupDTO.getId());
            criteria.andIsValidityEqualTo("1");
            if(exposureMapper.countByExample(adExposureExample) >= 1){
                adGroupDTO.setLaunchState("T");
            }else{
                adGroupDTO.setLaunchState("F");
            }
        }
        return adGroups;
    }


    @RequestMapping(value = "getAdE")
    @ResponseBody
    public List<AdExposure> getAdE(Integer adId){

            AdExposureExample adExposureExample = new AdExposureExample();
            AdExposureExample.Criteria criteria = adExposureExample.createCriteria();
            criteria.andAdIdEqualTo(adId);
            criteria.andIsValidityEqualTo("1");
            List<AdExposure> adGroups = exposureMapper.selectByExample(adExposureExample);

        return adGroups;
    }


    @RequestMapping(value = "addAdE")
    @ResponseBody
    public String addAdE(AdExposure adExposure){
        exposureMapper.insertSelective(adExposure);
        return "succ";
    }


    @RequestMapping(value = "delAdE")
    @ResponseBody
    public String delAdE(Integer id){
        AdExposure adExposure = new AdExposure();
        adExposure.setAdId(id);
        adExposure.setIsValidity("0");
        exposureMapper.updateByPrimaryKey(adExposure);
        return "succ";
    }

    @RequestMapping(value = "toexposurelist")
    public String toAdExposure(){
        return "adexposure/adexposurelist";
    }


}
