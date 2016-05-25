package com.amao.ad2.web.ctrl;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import com.amao.ad2.core.ShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author pxy
 * @since 2016-05-24
 */
@Controller
@RequestMapping(value = "overview")
public class ShowController {

    @Autowired
    private ShowService showService;

    @RequestMapping(value = "index")
    public String show(HttpServletRequest request){
        request.setAttribute("urls", showService.getHitSources());
        request.setAttribute("currentDate", new Date());
        return "main/overview";
    }
}
