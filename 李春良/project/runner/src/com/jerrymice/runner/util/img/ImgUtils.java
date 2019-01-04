package com.jerrymice.runner.util.img;

import java.io.InputStream;

public interface ImgUtils {
	/**
	 * 
	* @Function: ImgUtils.java
	* @Description: 压缩图片
	*
	* @param: String srcPath,String targetPath,String format
	* @return：void
	*
	* @author: 金
	* @date: 2018年12月13日 上午9:41:38 
	*
	 */
	public void compressImg(InputStream srcPath,String targetPath,String format);
}
