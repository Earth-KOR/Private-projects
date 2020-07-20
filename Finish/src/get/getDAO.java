package get;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.BoardBean;

public class getDAO {


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
	
	public boolean get (String id , String name, int price, int count ) {
		boolean check = false ;
		try {
		con = getConnection();
		
		sql = "insert into geta values (null,?,?,?,?)";
		pstmt = con.prepareStatement(sql) ;

		pstmt.setString(1 , id);
		pstmt.setString(2 , name);
		pstmt.setInt(3 , price);
		pstmt.setInt(4 , count);
		
		int check2 = pstmt.executeUpdate();

		if(check2 == 1) {
			check = true;
		} else {
			check = false;
		}
		} catch (Exception e) {
			System.out.println("get에서 에러 발생 : " + e);
		}finally{
			
			resourceClose();
		}
		
		return check;
	}
	
public int getCount(String name) {
		
        int checkSign = 3 ;
		
		try {
		
		con = getConnection();
		
		sql = "select count(*) as 'total' from geta where id=?";
		
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1,name);
		rs = pstmt.executeQuery();
		if(rs.next()){
		checkSign = rs.getInt(1);
		}else{
			checkSign = 0;
		}
		}catch(Exception e) {
			System.out.println("getboardcount구문 오류 발생" + e);
		}finally{
			
			resourceClose();
		}
		
		
		return checkSign;
		
	}

public List<getDTO> getBoardList(int startRow,int pageSize, String id){
	
	
	List<getDTO> boardList = new ArrayList<getDTO>();
	
	try{
		
		con = getConnection();
		
		sql = "select * from geta where id=? order by idx desc limit ?,?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, pageSize);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			
			getDTO bBean = new getDTO();
					
			bBean.setIdx(rs.getInt("idx"));
			bBean.setId(rs.getString("id"));
			bBean.setName(rs.getString("name"));
			bBean.setPrice(rs.getInt("price"));
			bBean.setCount(rs.getInt("count"));
			
			boardList.add(bBean);
		
		}
	
	}catch(Exception e){
		System.out.println("getBoardList메소드 내부에서 예외 발생 : " + e);
	}finally {
		
		resourceClose();
	}
	
	return boardList; 
					 
}



public int getIdx(String name) {
	
    int checkSign = 3 ;
	
	try {
	
	con = getConnection();
	
	sql = "select count(*) as 'total' from geta where id=?";
	
	pstmt= con.prepareStatement(sql);
	pstmt.setString(1,name);
	rs = pstmt.executeQuery();
	if(rs.next()){
	checkSign = rs.getInt(1);
	}else{
		checkSign = 0;
	}
	}catch(Exception e) {
		System.out.println("getboardcount구문 오류 발생" + e);
	}finally{
		
		resourceClose();
	}
	
	
	return checkSign;
	
}

public int deleteBoard(int num){
	   int check = 0;
	      
	   try {
	      //커넥션풀로 부터 케넥션객체 얻기(DB연결)
	      con = getConnection();
	   
	      sql = "delete from geta where idx=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, num);
	         check = pstmt.executeUpdate(); 
	      if(check == 1) {
	         check = 1;
	      }else{
	            check = 0; //삭제 실패~
	                     
	      }
	   } catch (Exception e) {
	      System.out.println("deleteBoard메소드 내부에서 예외 발생 : " + e);
	   } finally {
	      
	      resourceClose();
	   }
	   return check; //사용자가 입력한 비밀번호와  DB에 저장된 글의 비밀번호가 일치하면
	              //check변수의 값 1을 리턴
	              //그반대이면 check변수의 값 0을 리턴
	}



}
