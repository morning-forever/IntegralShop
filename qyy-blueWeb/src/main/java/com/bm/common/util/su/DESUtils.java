package com.bm.common.util.su;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyGenerator;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
   
public class DESUtils {  
   
    private Key key = null;  
   
    public DESUtils() {  
   
    }  
   
    public DESUtils(String str) {  
       setKey(str); // 生成密匙  
    }  
   
    public Key getKey() {  
       return key ;  
    }  
   
    public void setKey(Key key) {  
       this.key = key;  
    }  
   
    /** 
      * 根据参数生成 KEY 
      */  
    public void setKey(String strKey) {  
       try {  
           KeyGenerator generator = KeyGenerator.getInstance ( "DES" );  
           generator.init( new SecureRandom(strKey.getBytes()));  
           this . key = generator.generateKey();  
           generator = null ;  
       } catch (Exception e) {  
           throw new RuntimeException( "Error initializing SqlMap class. Cause: " + e);  
       }  
    }  
   
    /** 
      * 加密 String 明文输入 ,String 密文输出 
      */  
    public String encryptStr(String strMing) {  
       byte [] byteMi = null ;  
       byte [] byteMing = null ;  
       String strMi = "" ;  
       BASE64Encoder base64en = new BASE64Encoder();  
       try {  
           byteMing = strMing.getBytes( "UTF8" );  
           byteMi = this .encryptByte(byteMing);  
           strMi = base64en.encode(byteMi);  
       } catch (Exception e) {  
           throw new RuntimeException(  "Error initializing SqlMap class. Cause: " + e);  
       } finally {  
           base64en = null ;  
           byteMing = null ;  
           byteMi = null ;  
       }  
       return strMi;  
    }  
   
    /** 
      * 解密 以 String 密文输入 ,String 明文输出 
      * 
      * @param strMi 
      * @return 
      */  
    public String decryptStr(String strMi) {  
       BASE64Decoder base64De = new BASE64Decoder();  
       byte [] byteMing = null ;  
       byte [] byteMi = null ;  
       String strMing = "" ; 
       try {  
           byteMi = base64De.decodeBuffer(strMi);  
           byteMing = this .decryptByte(byteMi);  
           strMing = new String(byteMing, "UTF8" );  
       } catch (Exception e) {  
           throw new RuntimeException(  
                  "Error initializing SqlMap class. Cause: " + e);  
       } finally {  
           base64De = null ;  
           byteMing = null ;  
           byteMi = null ;  
       }  
       
       return strMing;  
    }  
   
    /** 
      * 加密以 byte[] 明文输入 ,byte[] 密文输出 
      * 
      * @param byteS 
      * @return 
      */ 
    private byte [] encryptByte( byte [] byteS) {  
       byte [] byteFina = null ;  
       Cipher cipher;  
       try {  
           cipher = Cipher.getInstance ( "DES" );  
           cipher.init(Cipher. ENCRYPT_MODE , key );  
           byteFina = cipher.doFinal(byteS);  
       } catch (Exception e) {  
           throw new RuntimeException(  
                  "Error initializing SqlMap class. Cause: " + e);  
       } finally {  
           cipher = null ;  
       }  
       return byteFina;  
    }  
   
    /** 
      * 解密以 byte[] 密文输入 , 以 byte[] 明文输出 
      * 
      * @param byteD 
      * @return 
      */  
    private byte [] decryptByte( byte [] byteD) {  
       Cipher cipher;  
       byte [] byteFina = null ;  
       try {  
           cipher = Cipher.getInstance ( "DES" );  
           cipher.init(Cipher. DECRYPT_MODE , key );  
           byteFina = cipher.doFinal(byteD);  
       } catch (Exception e) {  
           throw new RuntimeException(  
                  "Error initializing SqlMap class. Cause: " + e);  
       } finally {  
           cipher = null ;  
       }  
       return byteFina;  
    }  
   
    /** 
      * 文件 file 进行加密并保存目标文件 destFile 中 
      * 
      * @param file 
      *             要加密的文件 如 c:/test/srcFile.txt 
      * @param destFile 
      *             加密后存放的文件名 如 c:/ 加密后文件 .txt 
      */  
    public void encryptFile(String file, String destFile) throws Exception {  
       Cipher cipher = null;  
       // cipher.init(Cipher.ENCRYPT_MODE, getKey());  
       InputStream is = null;
       OutputStream out = null;
       CipherInputStream cis = null;
       try{
    	   cipher = Cipher.getInstance ( "DES" );  
    	   cipher.init(Cipher. ENCRYPT_MODE , this . key );  
    	   
    	   is = new FileInputStream(file);  
           out = new FileOutputStream(destFile);  
           cis = new CipherInputStream(is, cipher);  
           byte [] buffer = new byte [1024];  
           int r;  
           while ((r = cis.read(buffer)) > 0) {  
               out.write(buffer, 0, r);  
           }  
       }catch(Exception e){
    	   throw new RuntimeException(e);
       }finally{
    	   try{
    		   if(cis!=null){
    			   cis.close();  
    		   }
    		   if(is!=null){
    			   is.close();  
    		   }
    		   if(out!=null){
    			   out.close();  
    		   }
    	   }catch(Exception e){
    		   throw new RuntimeException(e);
    	   }
       }
    }  
   
    /** 
      * 文件采用 DES 算法解密文件 
      * 
      * @param file 
      *             已加密的文件 如 c:/ 加密后文件 .txt * 
      * @param destFile 
      *             解密后存放的文件名 如 c:/ test/ 解密后文件 .txt 
      */  
    public void decryptFile(String file, String dest) throws Exception {  
       Cipher cipher = null;  
       InputStream is = null;  
       OutputStream out = null;  
       CipherOutputStream cos = null;  
       try{
    	   cipher = Cipher.getInstance ( "DES" );  
           cipher.init(Cipher. DECRYPT_MODE , this . key );  
           is = new FileInputStream(file);  
           out = new FileOutputStream(dest);  
           cos = new CipherOutputStream(out, cipher);  
    	   
    	   byte [] buffer = new byte [1024];  
           int r;  
           while ((r = is.read(buffer)) >= 0) {  
               cos.write(buffer, 0, r);  
           }  
       }catch(Exception e){
    	   throw new RuntimeException(e);
       }finally{
    	   try{
    		   if(is!=null){
    			   is.close();  
    		   }
    		   if(out!=null){
    			   out.close();  
    		   }
    		   if(cos!=null){
    			   cos.close();  
    		   }
    	   }catch(Exception e){
    		   throw new RuntimeException(e);
    	   }
       }
    }  
   
    public static void main(String[] args) throws Exception {  
       DESUtils des = new DESUtils( "mobile" );  
       // DES 加密文件  
       // des.encryptFile("G:/test.doc", "G:/ 加密 test.doc");  
       // DES 解密文件  
       // des.decryptFile("G:/ 加密 test.doc", "G:/ 解密 test.doc");  
       String str1 = "888" ;  
       // DES 加密字符串  
       String str2 = des.encryptStr(str1);  
       // DES 解密字符串  
       String deStr = des.decryptStr(str2);  
       System. out .println( " 加密前： " + str1);  
       System. out .println( " 加密后： " + str2);  
       System. out .println( " 解密后： " + deStr);  
    }  
}   