package com.konan.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {
	
	//image -> encoding to base64
	public String convert(File f) {
		String result = null;
		//f가 null값이면 에러
		try {
			// file to byte array
			byte[] byteArr = FileUtils.readFileToByteArray(f);
			result = Base64.getEncoder().encodeToString(byteArr);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
