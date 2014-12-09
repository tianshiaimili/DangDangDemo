package org.tarena.dang.util;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

public class CheckCodeAction implements SessionAware{
		private String code;
		private boolean result;
		private Map<String,Object> session;
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public boolean isResult() {
			return result;
		}
		
		
		public String execute(){
			String code1 = (String) session.get("checkcode");
			if(code1.equalsIgnoreCase(this.code)){
				result = true;
			}else{
				result = false;
			}
			
			return "check";
		}
		public void setSession(Map<String, Object> session) {
				this.session=session;
		}
}
