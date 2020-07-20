
	package DateRoom;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import get.getDTO;
import member.MemberDTO;


	public class DateRoomDAO {
		
		public Connection getConnection() throws Exception {

			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/test";
			String user = "root";
			String password = "1234";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);

			return con;

		}

		public void FileUpload(DateRoomDTO dd) {
			Connection con =null;
			PreparedStatement ps=null;
			try {
				
				con = getConnection();
				String sql="select max(num) from dateroom";
				ps = con.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					dd.setNum(rs.getInt("max(num)")+1);	
				sql ="insert into dateroom(num,readcount,subject,fileName1,originalName1,name,content) values(?,?,?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, dd.getNum());
				ps.setInt(2, dd.getReadcount());
				ps.setString(3, dd.getSubject());
				ps.setString(4, dd.getFileName1());
				ps.setString(5, dd.getOriginalName1());
				ps.setString(6, dd.getName());
				ps.setString(7, dd.getCotent());
				ps.executeUpdate();
				}
			} catch (Exception e) {
				System.out.println("파일업로드 오류"+e);
			}finally {
				if (ps!=null) {
					try {ps.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
					
					
				}
		}
		
		public ArrayList<DateRoomDTO> DateList() {
			ArrayList<DateRoomDTO> arr= new ArrayList<DateRoomDTO>();
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;

			try {
				 con = getConnection();
				String sql = "select *from dateroom";
				 ps = con.prepareStatement(sql);
				 rs = ps.executeQuery();
				
				while (rs.next()) {
					DateRoomDTO ddto =new DateRoomDTO();
					ddto.setNum(rs.getInt(1));
					ddto.setReadcount(rs.getInt(2));;
					ddto.setSubject(rs.getString(3));
					ddto.setFileName1(rs.getString(4));
					ddto.setOriginalName1(rs.getString(5));
					ddto.setName(rs.getString(6));
					ddto.setCotent(rs.getString(7));
					arr.add(ddto);
				}

			} catch (Exception e) {
	System.out.println("DateList 메서드 오류"+e);
			}finally {
				if (rs!=null) {
					try {rs.close();} catch (SQLException e) {}		
				}			
				if (ps!=null) {
					try {ps.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
									
						}
			
			return arr;
		}
		
		public ArrayList<DateRoomDTO> FileDown(int num) {
			ArrayList<DateRoomDTO> arr= new ArrayList<DateRoomDTO>();
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;

			try {
				 con = getConnection();
				 String sql="update dateroom set readcount=readcount+1 where num=?";
				 ps = con.prepareStatement(sql);
				 ps.setInt(1, num);
				 ps.executeUpdate();
				 sql = "select *from dateroom where num=?";
				 ps = con.prepareStatement(sql);
			
				 ps.setInt(1, num);
				 
				 rs = ps.executeQuery();
				
				while (rs.next()) {
					DateRoomDTO ddto =new DateRoomDTO();
					ddto.setNum(rs.getInt(2));
					ddto.setReadcount(rs.getInt(3));;
					ddto.setSubject(rs.getString(4));
					ddto.setFileName1(rs.getString(5));
					ddto.setOriginalName1(rs.getString(6));
					ddto.setName(rs.getString(7));
					ddto.setCotent(rs.getString(8));
					ddto.setIdx(rs.getInt(1));
					arr.add(ddto);
				}

			} catch (Exception e) {
	System.out.println("DateList 메서드 오류"+e);
			}finally {
				if (rs!=null) {
					try {rs.close();} catch (SQLException e) {}		
				}			
				if (ps!=null) {
					try {ps.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
									
						}
			
			return arr;
		}
		
		public int getCount() {
			
	        int checkSign = 3 ;
	        Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			String sql ="";
			
			try {
			
			con = getConnection();
			
			sql = "select count(*) as 'total' from dateroom";
			
			ps= con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next()){
			checkSign = rs.getInt(1);
			}else{
				checkSign = 0;
			}
			}catch(Exception e) {
				System.out.println("getboardcount구문 오류 발생" + e);
			}finally{
				
				if (rs!=null) {
					try {rs.close();} catch (SQLException e) {}		
				}			
				if (ps!=null) {
					try {ps.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
			}
			
			
			return checkSign;
			
		}
		
		public List<DateRoomDTO> getBoardList(int startRow,int pageSize){
			
			
			List<DateRoomDTO> boardList = new ArrayList<DateRoomDTO>();
			 
		        Connection con =null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql ="";
			try{
				
				con = getConnection();
				
				sql = "select num,name,subject,content,readcount from dateroom order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);		
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					DateRoomDTO bBean = new DateRoomDTO();
							
					bBean.setNum(rs.getInt("num"));
					bBean.setName(rs.getString("name"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setCotent(rs.getString("content"));
					bBean.setReadcount(rs.getInt("readcount"));
					
					boardList.add(bBean);
				
				}
			
			}catch(Exception e){
				System.out.println("getBoardList1메소드 내부에서 예외 발생 : " + e);
			}finally {
				
				if (rs!=null) {
					try {rs.close();} catch (SQLException e) {}		
				}			
				if (pstmt!=null) {
					try {pstmt.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
			}
			
			return boardList; 
							 
		}



		
		
	}

	

