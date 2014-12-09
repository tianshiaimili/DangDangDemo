package org.tarena.dang.util;

import java.util.UUID;

public class UUIDUtil {
	public static String generator(){
		UUID uuid=UUID.randomUUID();
		System.out.println("获得emailCode!");
		return uuid.toString();
		
	}
	
}
