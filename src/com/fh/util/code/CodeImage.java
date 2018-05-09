package com.fh.util.code;
import java.awt.image.BufferedImage;  
  
import jp.sourceforge.qrcode.data.QRCodeImage;  
  
public class CodeImage implements QRCodeImage {  
      
    private BufferedImage bufferedImage;  
  
    public CodeImage(BufferedImage image){  
        this.bufferedImage = image;  
    }  
      
    @Override  
    public int getHeight() {  
        return bufferedImage.getHeight();  
    }  
  
    @Override  
    public int getPixel(int x, int y) {  
        return bufferedImage.getRGB(x, y);  
    }  
  
    @Override  
    public int getWidth() {  
        return bufferedImage.getHeight();  
    }  
  
}  