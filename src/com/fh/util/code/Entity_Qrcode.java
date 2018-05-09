package com.fh.util.code;
import java.io.Serializable;  
  
public class Entity_Qrcode implements Serializable{  
  
    private static final long serialVersionUID = 1L;  
  
    /**  
     * 内容  
     */  
    private String content;  
    /**  
     * 二维码图片地址  
     */  
    private String qrcodePath;  
    /**  
     * logo图片地址  
     */  
    private String logoPath;  
    /**  
     * 二维码图片的宽度  
     */  
    private int width;  
    /**  
     * 二维码图片的高度  
     */  
    private int height;  
    /**  
     * 是否添加logo图片  
     */  
    private boolean isFlag;  
    /**  
     * 生成图片的格式  
     */  
    private String format;  
    /**  
     * 纠错级别  
     */  
    private char qrcodeErrorCorrect;  
    /**  
     * 编码模式  
     */  
    private char qrcodeEncodeModel;  
    /**  
     * 设置二维码版本  
     */  
    private int version;  
      
    /** getter and setter */  
      
    public String getContent() {  
        return content;  
    }  
    public void setContent(String content) {  
        this.content = content;  
    }  
    public String getQrcodePath() {  
        return qrcodePath;  
    }  
    public void setQrcodePath(String qrcodePath) {  
        this.qrcodePath = qrcodePath;  
    }  
    public String getLogoPath() {  
        return logoPath;  
    }  
    public void setLogoPath(String logoPath) {  
        this.logoPath = logoPath;  
    }  
    public int getWidth() {  
        return width;  
    }  
    public void setWidth(int width) {  
        this.width = width;  
    }  
    public int getHeight() {  
        return height;  
    }  
    public void setHeight(int height) {  
        this.height = height;  
    }  
    public boolean isFlag() {  
        return isFlag;  
    }  
    public void setFlag(boolean isFlag) {  
        this.isFlag = isFlag;  
    }  
    public String getFormat() {  
        return format;  
    }  
    public void setFormat(String format) {  
        this.format = format;  
    }  
    public char getQrcodeErrorCorrect() {  
        return qrcodeErrorCorrect;  
    }  
    public void setQrcodeErrorCorrect(char qrcodeErrorCorrect) {  
        this.qrcodeErrorCorrect = qrcodeErrorCorrect;  
    }  
    public char getQrcodeEncodeModel() {  
        return qrcodeEncodeModel;  
    }  
    public void setQrcodeEncodeModel(char qrcodeEncodeModel) {  
        this.qrcodeEncodeModel = qrcodeEncodeModel;  
    }  
    public int getVersion() {  
        return version;  
    }  
    public void setVersion(int version) {  
        this.version = version;  
    }  
      
}  