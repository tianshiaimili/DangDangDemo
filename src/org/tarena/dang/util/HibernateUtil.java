package org.tarena.dang.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import com.mysql.jdbc.Connection;

/**
 * Configures and provides access to Hibernate sessions, tied to the
 * current thread of execution.  Follows the Thread Local Session
 * pattern, see {@link http://hibernate.org/42.html }.
 */
public class HibernateUtil {

    /** 
     * Location of hibernate.cfg.xml file.
     * Location should be on the classpath as Hibernate uses  
     * #resourceAsStream style lookup for its configuration file. 
     * The default classpath location of the hibernate config file is 
     * in the default package. Use #setConfigFile() to update 
     * the location of the configuration file for the current session.   
     */
//    private static String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
	private static String CONFIG_FILE_LOCATION = "org/tarena/dang/strust/file/hibernate.cfg.xml";
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
    private  static Configuration configuration = new Configuration();
    private static org.hibernate.SessionFactory sessionFactory;
    private static String configFile = CONFIG_FILE_LOCATION;
    private static Logger mLogger = Logger.getLogger(HibernateUtil.class);

	static {
    	try {
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
			System.out.println("-------------------------------------------------");
//			testConnection();
//			configuration.get
		} catch (Exception e) {
			System.err
					.println("%%%% Error Creating SessionFactory %%%%");
			e.printStackTrace();
			mLogger.error("**********error == "+ e.getMessage());
		}
    }
    private HibernateUtil() {
    }
	
	/**
     * Returns the ThreadLocal Session instance.  Lazy initialize
     * the <code>SessionFactory</code> if needed.
     *
     *  @return Session
     *  @throws HibernateException
     */
    public static Session getSession() throws HibernateException {
        Session session = (Session) threadLocal.get();
        mLogger.error("session = "+session);
		if (session == null || !session.isOpen()) {
			if (sessionFactory == null) {
				rebuildSessionFactory();
			}
			session = (sessionFactory != null) ? sessionFactory.openSession()
					: null;
			threadLocal.set(session);
		}

        return session;
    }

	/**
     *  Rebuild hibernate session factory
     *
     */
	public static void rebuildSessionFactory() {
		try {
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
		} catch (Exception e) {
			System.err
					.println("%%%% Error Creating SessionFactory %%%%");
			e.printStackTrace();
		}
	}

	/**
     *  Close the single hibernate session instance.
     *
     *  @throws HibernateException
     */
    public static void closeSession() throws HibernateException {
        Session session = (Session) threadLocal.get();
        threadLocal.set(null);

        if (session != null) {
            session.close();
        }
    }

	/**
     *  return session factory
     *
     */
	public static org.hibernate.SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
     *  return session factory
     *
     *	session factory will be rebuilded in the next call
     */
	public static void setConfigFile(String configFile) {
		HibernateUtil.configFile = configFile;
		sessionFactory = null;
	}

	/**
     *  return hibernate configuration
     *
     */
	public static Configuration getConfiguration() {
		return configuration;
	}

	
	///test connection on sae
	public static void testConnection(){
		   
		   //连接MySql数据库，用户名和密码都是root   
//		     String url = "jdbc:mysql://localhost:3306/dangdang" ;    
			String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_militest1" ;
		     
		     String username = "23l2nkyxyn" ;   
		     String password = "2xi2lzz12zyi05hzw2lm5j21jzklzl5x5kljlw21" ;   
		     Logger mLogger = Logger.getLogger(HibernateUtil.class);
		   try{   
			    //加载MySql的驱动类   
			    Class.forName("com.mysql.jdbc.Driver") ;
			    Connection con =    
			             (Connection) DriverManager.getConnection(url , username , password ) ;  
			    System.out.println("**********************===  "+con);
			    mLogger.error("**********************=== "+con);
			    mLogger.info("**********************=== "+con);
			    }catch(Exception e){   
			    System.out.println("找不到驱动程序类 ，加载驱动失败！");   
			    e.printStackTrace() ;   
			    mLogger.error("**********************=== "+e.getMessage());
			    }   
		
	}
	
	
}