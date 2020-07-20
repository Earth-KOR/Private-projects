package buy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class buyDAO {

	Connection con = null;
	ResultSet  rs = null;
	PreparedStatement pstmt = null;
	String sql="";
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/test";
	private static final String DBID = "root";
	private static final String DBPW = "1234";
	
	 
	public void resourceClose(){
	  try{	
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
	  }catch(Exception e){
		  System.out.println("자원해제 실패 : " + e);
	  }
	}
	

	private Connection getConnection() throws Exception{ 
		
		Class.forName(DRIVER);
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" 드라이버로드 & 디비연결 성공  : "+con);
		
		
		return con;
		
	}
	
	public String name(String name) {
		
		return name ;
	}
	
	public int price(String name) {
		
		int check = 0 ;
		
		try {
			con = getConnection();
			
			sql = "select price from goods where name=?";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				check = rs.getInt("price");		
				
			} else {
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("price에서 에러 발생 : " + e);
		}finally{
			
			resourceClose();
		}
		
		return check;
		
	}
	
public int stack(String name) {
		
		int check = 0 ;
		
		try {
			con = getConnection();
			
			sql = "select total from goods where name=?";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				check = rs.getInt("total");		
				
			} else {
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("stack에서 에러 발생 : " + e);
		}finally{
			
			resourceClose();
		}
		
		return check;
		
	}


public boolean priceUpdate (String name, int price) {

	boolean check = false ;
	try {
		
		
	
	con = getConnection();
	
	sql = "select price from goods where name=?";


	pstmt = con.prepareStatement(sql) ;

	pstmt.setString(1 , name);


	rs = pstmt.executeQuery();

	boolean check1 = rs.next();
	if(check1 == true) {
		sql = "update goods set price=?" + " where name =?" ;
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, price);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		
		check = true ;
	} else {
		check = false;
	}
	
	} catch (Exception e) {
		System.out.println("userCheck에서 에러 발생 : " + e);
	}finally{
		
		resourceClose();
	}
	
	return check;
}

public boolean StackUpdate (String name, int stack) {

	boolean check = false ;
	try {
		
		
	
	con = getConnection();
	
	sql = "select total from goods where name=?";


	pstmt = con.prepareStatement(sql) ;

	pstmt.setString(1 , name);


	rs = pstmt.executeQuery();

	boolean check1 = rs.next();
	if(check1 == true) {
		sql = "update goods set total=?" + " where name =?" ;
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, stack);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		
		check = true ;
	} else {
		check = false;
	}
	
	} catch (Exception e) {
		System.out.println("userCheck에서 에러 발생 : " + e);
	}finally{
		
		resourceClose();
	}
	
	return check;
}

public boolean count (String name , int get) {
	
	boolean check = false ;
	try {
	con = getConnection();
	

	sql = "select total from goods where name=?";
	pstmt = con.prepareStatement(sql) ;
	pstmt.setString(1 , name);
	rs = pstmt.executeQuery();
	rs.next();
	int aa = rs.getInt("total");

	if (aa-get >= 0) {
	 String sql1 = "update goods set total=total-? where name=?";
	 pstmt = con.prepareStatement(sql1);
	 pstmt.setInt(1, get);
	 pstmt.setString(2 , name);
	 pstmt.executeUpdate();
	 check = true;
	}else{
		check = false;
	}
	
	} catch (Exception e) {
		System.out.println("userCheck에서 에러 발생 : " + e);
	}finally{
		
		resourceClose();
	}
	return check ;
}

public boolean count2 (String name , int get) {
	
	boolean check = false ;
	try {
	con = getConnection();
	

	sql = "select total from goods where name=?";
	pstmt = con.prepareStatement(sql) ;
	pstmt.setString(1 , name);
	rs = pstmt.executeQuery();
	rs.next();
	int aa = rs.getInt("total");

	if (aa-get >= 0) {
	
	 check = true;
	}else{
		check = false;
	}
	
	} catch (Exception e) {
		System.out.println("userCheck에서 에러 발생 : " + e);
	}finally{
		
		resourceClose();
	}
	return check ;
}


}
