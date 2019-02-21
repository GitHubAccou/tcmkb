package com.tcmkb.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.tomcat.util.codec.binary.Base64;

import com.sun.mail.util.BASE64DecoderStream;

/**
 * 鍥剧墖宸ュ叿绫�
 * @author Easter
 *
 */
public class ImageUtil {

	public static void main(String[] args) {
				File f=new File("e:\\WebWorkspace\\tcmkb\\WebRoot\\images\\index.png");
				makeImage(f);
		
	}
	
	/**
	 * 鐢熸垚楠岃瘉鐮佸浘鐗�,骞惰繑鍥為獙璇佺爜鍐呭
	 * @param f
	 * @return
	 */
	public static String makeImage(File f) {
		  String str="";
		  BufferedImage bi=new BufferedImage(125, 32, BufferedImage.TYPE_INT_RGB);
		  Graphics g=bi.getGraphics();
		  g.setColor(Color.WHITE);
		  g.fillRect(0, 0, 125, 32);
		  g.setFont(new Font(Font.MONOSPACED, Font.ITALIC, 32));
		  Color [] cs=new Color[] {Color.BLUE,Color.gray,Color.GREEN,Color.ORANGE,Color.cyan};
		  String num="0123456789";
		  String lc="abcdefghijklmnopqrstuvwxyz";
		  String sample=num+""+lc+lc.toUpperCase();
		  for(int i=0;i<5;i++) {
		    int colorN=new Random().nextInt(5);
		    int charN=new Random().nextInt(62);
		    g.setColor(cs[colorN]);
		    g.drawChars(new char[] {sample.charAt(charN)}, 0, 1, i*25, 24);
		    str+=sample.charAt(charN);
		  }
		  try {
			  ImageIO.write(bi, "png", f);
			} catch (IOException e) {
			  e.printStackTrace();
			}
		  return str;
	}
	
	/**
	 * 灏嗗浘鐗囪浆鎹㈡垚DataUrl骞惰繑鍥�
	 * @param f
	 * @param delAfter 杞崲瀹屾垚鏄惁鍒犻櫎鍥剧墖
	 * @return
	 */
	public static String imageToDataUrl(File f,boolean delAfter) {
		  String result="data:image/gif;base64,";
		  Base64 base64=new Base64();
//		  Base64.Encoder be=Base64.getEncoder();
		  byte bs[]=new byte[1024*1024];
		  InputStream is=null;
	    try {
			is=new FileInputStream(f);
			int len=0;
			while((len=is.read(bs, 0, bs.length))>0) {
				byte bs1[]=Arrays.copyOfRange(bs, 0, len);
//				result+=be.encodeToString(bs1);
				result+=base64.encodeToString(bs1);
			} 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(is!=null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(delAfter) {
			f.delete();
		}
	  return result;
	}
}
