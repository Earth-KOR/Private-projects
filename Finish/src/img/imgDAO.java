package img;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DateRoom.DateRoomDTO;
import board.BoardBean;

public class imgDAO {

   //전역변수 선언
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
      
      
      public int getImgCount(){
         //board테이블에 저장되어 있는 조회한 글개수를 저장할 변수
         int count = 0;
         
         try {
            //커넥션풀로 부터 케넥션 얻기(DB와의 연결)
            con = getConnection();
            //SQL문 : 전체 글개수 조회
            sql = "select count(*) from img";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();//전체 글개수 조회후 반환
            //전체 글 개수가 조회 된다면
            if(rs.next()){
               count = rs.getInt(1);// 조회한 글개수를 저장
            }
         } catch (Exception e) {
            System.out.println("getImgCount()메소드 내부에서 예외발생 : " + e);
         } finally {
            //자원해제
            resourceClose();
         }   
         return count; //조회한 글 개수를 리턴
      }
      
      //글목록 검색해서 가져오는 메소드
      public List<imgDTO> getimgList(String type){
         
         //board테이블로 부터 검색한 글정보들을 
         //각각 한줄단위로  BoardBean객체에 저장후~
         //BoardBean객체들을 각각 ArrayList배열에 추가로 저장하기 위한 용도
         List<imgDTO> boardList = new ArrayList<imgDTO>();
         
         try{
            //DB연결
            con = getConnection();
            //SQL문 만들기
            sql = "select * from img where type=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, type);
        
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
               //검색한 글목록중.. 한줄단위의 데이터를 저장할 용도로 객체 생성
               imgDTO bBean = new imgDTO();
               // rs => BoardBean객체의 각변수에 저장
               bBean.setType(rs.getString("type"));
               bBean.setImg(rs.getString("img"));
               bBean.setName2(rs.getString("name"));
               bBean.setSalary(rs.getString("salary"));
               bBean.setPosition(rs.getString("position"));
               
               
               
               boardList.add(bBean);
            
            }//while반복문 끝
         
         }catch(Exception e){
            System.out.println("getBoardList메소드 내부에서 예외 발생 : " + e);
         }finally {
            //자원해제
            resourceClose();
         }
         
         return boardList; //검색한 글정보들(BoardBean객체들)을 저장하고 있는 배열공간인?
                       //ArrayList를  notice.jsp페이지로 반환(리턴)
      }//getBoardList메소드 끝
      
      public void FileUploada(imgDTO dd) {
			Connection con =null;
			PreparedStatement ps=null;
			try {
				
				con = getConnection();
				sql ="insert into img values(?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, dd.getType());
				ps.setString(2, dd.getImg());
				ps.setString(3, dd.getName2() );
				ps.setString(4, dd.getSalary() );
				ps.setString(5, dd.getPosition() );
			
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("이미지파일업로드 오류"+e);
			}finally {
				if (pstmt!=null) {
					try {pstmt.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
					
					
				}
		}
   
            
      public int deleteBoard(String img){
  		int check = 3;
  			
  		try {
  			//커넥션풀로 부터 케넥션객체 얻기(DB연결)
  			con = getConnection();
  			
  		
  					sql = "delete from img where img=?";
  					pstmt = con.prepareStatement(sql);
  					pstmt.setString(1, img);
  					check= pstmt.executeUpdate(); //delete실행
  					if(check == 1) {
  						check=1;
  					}else {
  						check=0;
  					}
  		
  		} catch (Exception e) {
  			System.out.println("deletephoto메소드 내부에서 예외 발생 : " + e);
  		} finally {
  			//자원해제
  			resourceClose();
  		}
  		return check;
  		 //사용자가 입력한 비밀번호와  DB에 저장된 글의 비밀번호가 일치하면
  					  //check변수의 값 1을 리턴
  					  //그반대이면 check변수의 값 0을 리턴
  	}
      
      
}