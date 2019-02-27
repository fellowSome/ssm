package com.vicyor.controller;

import com.vicyor.util.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
@Controller
@RequestMapping("/tool")
public class ToolController {
    @RequestMapping("/verifycode")
    public void generateVerifyCode(HttpServletRequest request, HttpServletResponse response) {
        VerifyCode code=new VerifyCode();
        BufferedImage image = code.getImage();
        String text = code.getText();
        //设置session 参数
        request.getSession().setAttribute("text",text );

        ByteArrayOutputStream baos=new ByteArrayOutputStream();
        try {
            ImageIO.write(image,"JPEG" ,baos );
            //将验证码图片的数据通过response返回
            response.getOutputStream().write(baos.toByteArray());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
