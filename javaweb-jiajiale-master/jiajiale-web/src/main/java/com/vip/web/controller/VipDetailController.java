package com.vip.web.controller;

        import com.vip.ao.VipAo;
        import com.vip.dto.AccountContext;
        import com.vip.dto.JSONResponse;
        import com.vip.service.VipDetailService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.validation.annotation.Validated;
        import org.springframework.web.bind.annotation.PostMapping;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RestController;

        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpSession;

@Validated
@RestController
@RequestMapping("/vip")
public class VipDetailController  {
    @Autowired
    VipDetailService service;
    @PostMapping("/add.do")
    public JSONResponse add(@Validated VipAo ao, HttpSession session)throws  Exception{
//        AccountContext ac= (AccountContext) session.getAttribute(AccountContext.class.getName());
//        if(ac!=null){
//          ao.setCreateUserId(ac.getId());
//        }
        service.add(ao);
        return JSONResponse.ok();
    }
}
