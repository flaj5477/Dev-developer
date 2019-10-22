package com.dd.devdeveloper.wiki.textFile;

import java.io.IOException;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		textToFile ttf = new textToFile();
		try {
			ttf.textSave("파일생성 테스트중", "안드로이드", "<br>\"%^#^#$#%^&*하하2");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		// 1. Create a file object with whole path. 
//		File absolutePath = new File("c://Example//File//existFile.txt"); 
//		System.out.println(absolutePath.exists()); 
//		// 2.1 Create a directory object 
//		// 2.2 Create another file object with 2.1 object included directory's information 
//		File dir = new File("c://Example//File//"); 
//		File pathWithDir = new File(dir, "existFile.txt"); 
//		System.out.println(pathWithDir.exists()); 
//		// 3. This is the same concept with 2, but directory's information with a string value. 
//		File pathWithStrDir = new File("c://Example//File//", "existFile.txt"); 
//		System.out.println(pathWithStrDir.exists());

	}

}
