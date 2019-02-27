package com.vicyor.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class VerifyCode {
    private int w=70; //验证码宽度
    private int h=35; //验证码高度
    private Random r=new Random();
    //字体类别
    private String[] fontNames  = {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
    //可选字符
    private String codes  = "0123456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
    //背景色
    private Color bgcolor=new Color(255,255,255);
    //验证码文本
    private String text;
    //生成随机的颜色
    private Color randomColor(){
        int red=r.nextInt(150);
        int green=r.nextInt(150);
        int blue=r.nextInt(150);
        return new Color(red,green,blue);
    }
    //生成随机的文本属性
    private Font randomFont(){
        int index=r.nextInt(fontNames.length);
        String fontName=fontNames[index];
        int style=r.nextInt(4);//0(无样式),1(粗体),2(斜体),3(粗体+斜体)
        int size=r.nextInt(5)+24;//font-size
        return new Font(fontName,style ,size );
    }
    private void drawLine(BufferedImage image){
        int num=3;//画三条线
        Graphics2D g2= (Graphics2D) image.getGraphics();
        for(int i=0;i<num;i++){
            int x1=r.nextInt(w);
            int y1=r.nextInt(h);
            int x2=r.nextInt(w);
            int y2=r.nextInt(h);
            g2.setStroke(new BasicStroke(1.5F));
            g2.setColor(Color.blue);//设置干扰线颜色
            g2.drawLine(x1,y1 ,x2 ,y2 );//画线
        }
    }
    //随机生成一个字符
    private char randomChar(){
        int index=r.nextInt(codes.length());
        return codes.charAt(index);
    }
    //创建BufferedImage,并返回
    public BufferedImage getImage(){
        BufferedImage bufferedImage=new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB );

        Graphics2D g2= (Graphics2D) bufferedImage.getGraphics();
        g2.setColor(this.bgcolor);
        g2.fillRect(0, 0, w, h);
        StringBuilder sb=new StringBuilder();
        for(int i=0;i<4;i++){
            //随机生成0-9A-Za-Z
            String s=randomChar()+"";
            sb.append(s);
            //设置字符坐标
            float x=i*1.0f*w/4;
            g2.setFont(randomFont());
            g2.setColor(randomColor());
            g2.drawString(s,x ,h-5 );//画图
        }
        this.text=sb.toString();
        return  bufferedImage;
    }
    //返回文本对象
    public String getText(){
        return text;
    }
}
