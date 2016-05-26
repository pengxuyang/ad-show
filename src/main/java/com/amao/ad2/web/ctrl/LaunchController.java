package com.amao.ad2.web.ctrl;

import com.amao.ad2.db.AdExposureMapper;
import com.amao.ad2.db.AdGroupMapper;
import com.amao.ad2.model.AdExposure;
import com.amao.ad2.model.AdExposureExample;
import com.amao.ad2.model.AdGroup;
import com.amao.ad2.model.DTO.AdGroupDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.java2d.pipe.SpanShapeRenderer;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(AdExposure adExposure : adGroups){
            if(adExposure.getCreateTime() != null){
                adExposure.setRemark(simpleDateFormat.format(adExposure.getCreateTime()));

            }
            }
        return adGroups;
    }

    @RequestMapping(value = "toadd")
    public String toadd(){
        return "/adExposure/list3";
    }


    @RequestMapping(value = "modAdgNum")
    @ResponseBody
    public String saveAdg(AdGroup adGroup){
        adGroupMapper.updateByPrimaryKeySelective(adGroup);
        return "succ";
    }

    @RequestMapping(value = "addAdE")
    @ResponseBody
    public String addAdE(AdExposure adExposure,String createTimeStr){
        SimpleDateFormat simpleDateFormat  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = simpleDateFormat.parse(createTimeStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        adExposure.setCreateTime(date);
        exposureMapper.insertSelective(adExposure);
        return "succ";
    }


    @RequestMapping(value = "delAdE")
    @ResponseBody
    public String delAdE(Integer id){
        AdExposure adExposure = new AdExposure();
        adExposure.setId(id);
        adExposure.setIsValidity("0");
        exposureMapper.updateByPrimaryKeySelective(adExposure);
        return "succ";
    }

    @RequestMapping(value = "toexposurelist")
    public String toAdExposure(){
        return "adexposure/adexposurelist";
    }


}
