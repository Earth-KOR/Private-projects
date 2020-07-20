package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MemberDAO { 
	
	
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
	
	
	public int userCheck (String ida, String pwda) {
		
		int check = 0 ;
		
		try {
			con = getConnection();
			
			sql = "select * from member where id=?";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, ida);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				sql = "select * from member where pwd=? and id=?";
						
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, pwda);
				pstmt.setString(2, ida);
				rs = pstmt.executeQuery();		
				
				if(rs.next()) {
					check =1 ;
				} else {
					
					check = 0;
				}
			} else {
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("userCheck에서 에러 발생 : " + e);
		}finally{
			
			resourceClose();
		}
		
		return check;
		
	}
	
	public int Signup(String id, String passwd, String address, int point) {
		
		int checkSign = 3 ;
		
		try {
		
		con = getConnection();
		
		sql = "insert into member values(?,?,?,?)";
		
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, address);
		pstmt.setInt(4, point);
		checkSign = pstmt.executeUpdate();
		if(checkSign == 1) {
			checkSign = 1;
		}else {
			checkSign = 0;
		}
		
		}catch(Exception e) {
			System.out.println("SQL구문 오류 발생" + e);
		}finally{
			
			resourceClose();
		}
		
		
		return checkSign;
	}
	
	public int Update(String pwd , String id) {

		int checkSign = 3 ;
		
		try {
		
		con = getConnection();
		
		sql = "update member set pwd=? where id=?";
		
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, id);
		checkSign = pstmt.executeUpdate();
		if(checkSign == 1) {
			checkSign = 1;
		}else {
			checkSign = 0;
		}
		
		}catch(Exception e) {
			System.out.println("SQL구문 오류 발생" + e);
		}finally{
			
			resourceClose();
		}
		
		
		return checkSign;

		
	}
	
public int idCheck(String id){
		
		int check = 0;
		
		try {
			
			con = getConnection();
			
			sql = "select * from member where id=?";
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, id);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1; 
			}else{check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외 발생 : " + e);
		} finally {
		
			resourceClose();
		}
	 
		return check; 
	
	}

public int priceCheck(String id){//사용자가 입력한 아이디, 비밀번호 전달 받음
    
    int Point =0;
    
    try {
       
       con = getConnection();
       
       sql = "select point from member where id=?";
    
       pstmt  = con.prepareStatement(sql);
       
       pstmt.setString(1, id);
    
       rs = pstmt.executeQuery();
    
       if(rs.next()){
          Point = rs.getInt("point");
       }else{
          Point = -1;
       }
    } catch (Exception e) {
       System.out.println("priceCheck메소드 내부에서 예외 발생 : " + e);
    } finally {

       resourceClose();
    }
    return Point;
}

public int priceCharge(String id, int price ){//사용자가 입력한 아이디, 비밀번호 전달 받음
	   
	   
	   int check = 3;
	   try {
	      
	      con = getConnection();
	      
	      sql = "select point from member where id=?";
	   
	      pstmt  = con.prepareStatement(sql);
	      
	      pstmt.setString(1, id);
	   
	      rs = pstmt.executeQuery();
	   
	      if(rs.next()){
	         sql = "update member set point = point+? where id = ? ";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, price);
	         pstmt.setString(2, id);
	         check = pstmt.executeUpdate();
	      }else{
	         check=-1;
	      }
	   } catch (Exception e) {
	      System.out.println("priceCheck메소드 내부에서 예외 발생 : " + e);
	   } finally {

	      resourceClose();
	   }
	   return check;
	}

public int price(String id ,int price){//사용자가 입력한 아이디, 비밀번호 전달 받음
	   
	 
	   int check = -3;
	   try {
	      
	      con = getConnection();
	      
	      sql = "select point from member where id=?";
	   
	      pstmt  = con.prepareStatement(sql);
	      
	      pstmt.setString(1, id);
	   
	      rs = pstmt.executeQuery();
	   
	      if(rs.next()){
	         sql = "update member set point = point-? where id = ? ";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, price);
	         pstmt.setString(2, id);
	         check = pstmt.executeUpdate();
	      }else{
	         check=-1;
	      }
	   } catch (Exception e) {
	      System.out.println("price메소드 내부에서 예외 발생 : " + e);
	   } finally {

	      resourceClose();
	   }
	   return check;
	}

public String address(String id){//사용자가 입력한 아이디, 비밀번호 전달 받음
    
    String Point ="";
    
    try {
       
       con = getConnection();
       
       sql = "select address from member where id=?";
    
       pstmt  = con.prepareStatement(sql);
       
       pstmt.setString(1, id);
    
       rs = pstmt.executeQuery();
    
       if(rs.next()){
          Point = rs.getString("address");
       }else{
          Point = "";
       }
    } catch (Exception e) {
       System.out.println("priceCheck메소드 내부에서 예외 발생 : " + e);
    } finally {

       resourceClose();
    }
    return Point;
}


public int Update2(String id, String address ) {

	int checkSign = 3 ;
	
	try {
	
	con = getConnection();
	
	sql = "update member set address=? where id=?";
	
	pstmt= con.prepareStatement(sql);
	pstmt.setString(1, address);
	pstmt.setString(2, id);
	checkSign = pstmt.executeUpdate();
	if(checkSign == 1) {
		checkSign = 1;
	}else {
		checkSign = 0;
	}
	
	}catch(Exception e) {
		System.out.println("SQL구문 오류 발생" + e);
	}finally{
		
		resourceClose();
	}
	
	
	return checkSign;

	
}
}
