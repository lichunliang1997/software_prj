package com.jerrymice.runner.util.img;

import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Repository;

@Repository(value="imgUtilsId")
public class ImgUtilsImpl implements ImgUtils {

	@Override
	public void compressImg(InputStream srcPath, String targetPath,String format) {
		// TODO Auto-generated method stub
		File targetImgFile=new File(targetPath);
		//生成图片转换对象
		AffineTransform transform=new AffineTransform();
		//通过缓存读入对象
		BufferedImage bufferedImage=null;
		try {
			bufferedImage=ImageIO.read(srcPath);
		}catch(IOException e) {
			e.printStackTrace();
		}
		int imgWidth=bufferedImage.getWidth();
		int imgHeight=bufferedImage.getHeight();
		int changeWidth=500;
		int changeHeight=500;
		double scaleWidth=0;
		double scaleHeight=0;
		//计算比例
		scaleWidth=(double)changeWidth/(double)imgWidth;
		scaleHeight=(double)changeHeight/(double)imgHeight;
		//生成转换比例
		transform.setToScale(scaleWidth, scaleHeight);
		//生成转换操作对象
		AffineTransformOp transformOp=new AffineTransformOp(transform,null);
		//生成压缩图片缓存对象
		BufferedImage tempImg=new BufferedImage(changeWidth,changeHeight,BufferedImage.TYPE_3BYTE_BGR);
		transformOp.filter(bufferedImage, tempImg);
		try {
			//输出缩小图片
			ImageIO.write(tempImg, format.substring(6), targetImgFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
