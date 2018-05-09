package com.fh.util.code;
/**  
 * 下载地址：http://swetake.com/qrcode/java/qr_java.html  
 * 总结：用QrCode无法解析Zxing生成的二维码,反过来则可以  
 */  
import java.awt.Color;  
import java.awt.Graphics2D;  
import java.awt.Image;  
import java.awt.image.BufferedImage;  
import java.io.File;  
import java.io.IOException;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
  
import javax.imageio.ImageIO;  
  
import jp.sourceforge.qrcode.QRCodeDecoder;  
import jp.sourceforge.qrcode.exception.DecodingFailedException;  
 
import com.swetake.util.Qrcode;  
  
public class QrCode {  
    /**   
     * 生成二维码(QRCode)图片   
     * @param qrcode  
     */    
    public static String  createQRCode(Entity_Qrcode qrcode) {    
        try {    
            Qrcode qrcodeHandler = new Qrcode();    
            /* 设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小 */   
            qrcodeHandler.setQrcodeErrorCorrect(qrcode.getQrcodeErrorCorrect());  
            /* N代表数字,A代表字符a-Z,B代表其他字符 */  
            qrcodeHandler.setQrcodeEncodeMode(qrcode.getQrcodeEncodeModel());   
            /* 设置设置二维码版本，取值范围1-40，值越大尺寸越大，可存储的信息越大 */    
            qrcodeHandler.setQrcodeVersion(qrcode.getVersion());    
    
            byte[] contentBytes = qrcode.getContent().getBytes("UTF-8");  
            /*二维码的宽与高*/  
            int width = qrcode.getWidth();  
            int height = qrcode.getHeight();  
            BufferedImage bufImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);    
            Graphics2D gs = bufImg.createGraphics();    
    
            gs.setBackground(Color.WHITE);    
            gs.clearRect(0, 0, width, height);    
    
            /* 设置图像颜色 */  
            gs.setColor(Color.BLACK);    
    
            /* 设置偏移量 不设置可能导致解析出错 */    
            int pixoff = 3;    
            /* 输出内容 > 二维码 */    
            if (contentBytes.length > 0 && contentBytes.length <width) {    
                boolean[][] codeOut = qrcodeHandler.calQrcode(contentBytes);    
                for (int i = 0; i < codeOut.length; i++) {    
                    for (int j = 0; j < codeOut.length; j++) {    
                        if (codeOut[j][i]) {    
                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);    
                        }    
                    }    
                }    
            } else {    
                System.err.println("QRCode content bytes length = "    
                        + contentBytes.length + " not in [ 0,200]. ");    
            }  
            /* 判断是否需要添加logo图片 */  
            if(qrcode.isFlag()){  
                int width_4 = width / 4;  
                int width_8 = width_4 / 2;  
                int height_4 = height / 4;  
                int height_8 = height_4 / 2;  
                Image img = ImageIO.read(new File(qrcode.getLogoPath()));  
                gs.drawImage(img, width_4 + width_8, height_4 + height_8,width_4,height_4, null);  
                gs.dispose();    
                bufImg.flush();  
            }  
    
            /* 生成二维码QRCode图片 */   
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
            String fileName = sdf.format(new Date()) + "." + qrcode.getFormat();  
            String url = qrcode.getQrcodePath() + fileName;  
            File imgFile = new File(url);  
            if(!imgFile.exists()){  
                imgFile.mkdirs();  
            }  
            ImageIO.write(bufImg, qrcode.getFormat(), imgFile);  
            System.out.println("生成二维码图片成功!");  
            return  url;
        } catch (Exception e){    
            e.printStackTrace();    
        }  
        return "";
    }  
    /**  
     * 解析二维码  
     */  
    public static String decode(String imagePath){  
        // QRCode 二维码图片的文件  
        File imageFile = new File(imagePath);  
        BufferedImage bufImg = null;  
        String content = null;  
        try {  
            bufImg = ImageIO.read(imageFile);  
            QRCodeDecoder decoder = new QRCodeDecoder();  
            content = new String(decoder.decode(new CodeImage(bufImg)), "utf-8");  
        } catch (IOException e) {  
            System.out.println("Error: " + e.getMessage());  
            e.printStackTrace();  
        } catch (DecodingFailedException dfe) {  
            System.out.println("Error: " + dfe.getMessage());  
            dfe.printStackTrace();  
        }  
        return content;  
    }  
    
    /**
     * 
     * @param urlContent  url 分享地址
     * @param logopath    中间图片地址
     * @param targetDirectory	 生成目录地址
     * @return
     */
    public static String makeCode(String urlContent,String logopath,String targetDirectory){
    	 Entity_Qrcode qrcode = new Entity_Qrcode();  
         qrcode.setContent(urlContent);  
         qrcode.setQrcodePath(targetDirectory);   
         qrcode.setLogoPath(logopath);  
         qrcode.setFormat("png");  
         qrcode.setFlag(true);  
         qrcode.setQrcodeErrorCorrect('M');  
         qrcode.setWidth(300);  
         qrcode.setHeight(300);  
         qrcode.setVersion(20);  
         qrcode.setQrcodeEncodeModel('B');  
         String filestr=  QrCode.createQRCode(qrcode);
       return filestr;
    }
     
    public static void main(String[] args) {  
        Entity_Qrcode qrcode = new Entity_Qrcode();  
        qrcode.setContent("http://www.baidu.com这是一个百度地址是发生的发生斯蒂芬随碟附送的斯蒂芬斯蒂芬是");  
        qrcode.setQrcodePath("f:/");  
        qrcode.setLogoPath("f:/qq.gif");  
        qrcode.setFormat("png");  
        qrcode.setFlag(true);  
        qrcode.setQrcodeErrorCorrect('M');  
        qrcode.setWidth(300);  
        qrcode.setHeight(300);  
        qrcode.setVersion(20);  
        qrcode.setQrcodeEncodeModel('B');  
      String filestr=  QrCode.createQRCode(qrcode);
      System.out.println(filestr);
       
      //  String content = QrCode.decode("f:/74039.png");  
     //   System.out.println(content);  
    }  
}  