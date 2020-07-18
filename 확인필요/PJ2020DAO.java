package csdit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class PJ2020DAO {
	private static PJ2020DAO instance = new PJ2020DAO();
	
	public static PJ2020DAO getInstance() {
		return instance;
	}
	//커넥션 풀 내용.
	private Connection getConnection() throws Exception{
		Connection con = null;
		
		try {	
		//1. Context 객체 얻기
		Context initCtx = new InitialContext();

		//2. "java:comp/env" 에 해당하는 객체를 찾아서 envCtx에 삽입
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		//3. "jdbc/animal"에 해당하는 개체를 찾아서 ds에 삽입
		DataSource ds = (DataSource) envCtx.lookup("jdbc/animal");
		
		//4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
		con = ds.getConnection();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	//가입유저중복 체크
		public Boolean U_ID_Check(String U_ID){

				Connection con=null;
				Statement stmt = null;
				ResultSet rs = null;
				String ID = null;//값을 저장할 변수
				Boolean Check = false;
				
				try {
					con = getConnection();
					stmt = con.createStatement();
												
					String sql= "select U_ID from WRITER where U_ID=?";//입력한 id가 있는 지 검색
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, U_ID);
					
					rs = pstmt.executeQuery();					
					
					while(rs.next()) {//값을 저장.
						ID = rs.getString("U_ID"); 	
					}
					
					if(ID == null)//값이 엇다면 null이고 null이면 체크를 true로 만듬
						Check = true;
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try { 
						if(rs!=null) rs.close();
						if(stmt!=null)stmt.close();
						if(con!=null) con.close();
					}catch(Exception e){e.printStackTrace();}
				}	
				return Check;//리턴
		}
		//관리자 유저 확인 관리자라면 true
		public Boolean MASTER_Check(String U_ID){

				Connection con=null;
				Statement stmt = null;
				ResultSet rs = null;
				String CLASS = null;//값을 저장할 변수
				Boolean Check = false;
				
				try {
					con = getConnection();
					stmt = con.createStatement();
												
					String sql= "select W_C from WRITER_CLASS where U_ID=?";//입력한 id가 있는 지 검색
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, U_ID);
					
					rs = pstmt.executeQuery();					
					
					while(rs.next()) {//값을 저장.
						CLASS = rs.getString("W_C"); 	
					}
					
					if(CLASS != null)//값이 없다면 null이고 있다면 마스터이므로 체크를 true로 만듬
						Check = true;
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try { 
						if(rs!=null) rs.close();
						if(stmt!=null)stmt.close();
						if(con!=null) con.close();
					}catch(Exception e){e.printStackTrace();}
				}	
				return Check;//리턴
		}
	//입력/변경/삭제 함수.
	public void WRITERChange(WRITERDTO dto, String flag) {
		Connection con = null; PreparedStatement pstmt = null;
		String sql=null; ResultSet rs = null;
		try { 
			con = getConnection();
			if(flag.equals("i")) {
				sql = "INSERT INTO WRITER VALUES(?,?,?)";		
				//3.sql문 준비
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getName());
			}else if(flag.equals("u")) {
				sql = "update WRITER set U_NAME=?, U_PW=? where U_ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getId());
			}else if(flag.equals("d")) {
				sql = "delete from WRITER where U_ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
			}
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	//자유게시판
	//입력/변경/삭제 함수.
		public void F_BOARD_Change(BOARD_FDTO dto, String flag) {
			Connection con = null; PreparedStatement pstmt = null;
			String sql=null; ResultSet rs = null;
			try { 
				con = getConnection();
				if(flag.equals("i")) {
					sql = "INSERT INTO BOARD_F VALUES(SEQ_F_NUM.NEXTVAL, ?, ?, ?, ?)";		
					//3.sql문 준비
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getF_TITLE());
					pstmt.setString(2, dto.getF_DATE());
					pstmt.setString(3, dto.getF_CONTENT());
					pstmt.setString(4, dto.getU_ID());
				}else if(flag.equals("u")) {
					sql = "update BOARD_F set F_TITLE=?, F_DATE=? ,F_CONTENT=? where F_NUM=?";//수정시 날짜 변경 허용?
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getF_TITLE());
					pstmt.setString(2, dto.getF_DATE());
					pstmt.setString(3, dto.getF_CONTENT());
					pstmt.setInt(4, dto.getF_NUM());
				}else if(flag.equals("d")) {
					sql = "delete from BOARD_F where F_NUM=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getF_NUM());
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		//list 자유게시판
				@SuppressWarnings("resource")
				public ArrayList<BOARD_FDTO> list_F(){
					//db검색정보 저장위해 arraylist생성
					ArrayList<BOARD_FDTO> dtos = new ArrayList<BOARD_FDTO>();
						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						
						try {
							con = getConnection();
							stmt = con.createStatement();
							int total = 0;
							String sqlCount = "SELECT COUNT(*) FROM BOARD_F";
							rs = stmt.executeQuery(sqlCount);
							if(rs.next()){
								total = rs.getInt(1);
							}
														
							String sql= "select * from BOARD_F ORDER BY F_NUM DESC";
							rs = stmt.executeQuery(sql);					
							
							while(rs.next()) {
								int num = rs.getInt("F_NUM");
								String title = rs.getString("F_TITLE");
								String date = rs.getString("F_DATE");
								String content = rs.getString("F_CONTENT");
								String writer = rs.getString("U_ID");
								BOARD_FDTO dto = new BOARD_FDTO(num, title, date, content, writer);
								dto.setF_Total(total);
								dtos.add(dto);
							}
							
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dtos;
				}//list 포토게시판
				@SuppressWarnings("resource")
				public ArrayList<BOARD_PDTO> list_P(){
					//db검색정보 저장위해 arraylist생성
					ArrayList<BOARD_PDTO> dtos = new ArrayList<BOARD_PDTO>();
						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						
						try {
							con = getConnection();
							stmt = con.createStatement();
							int total = 0;
							String sqlCount = "SELECT COUNT(*) FROM BOARD_P";
							rs = stmt.executeQuery(sqlCount);
							if(rs.next()){
								total = rs.getInt(1);
							}
							
														
							String sql= "select * from BOARD_P ORDER BY P_NUM DESC";
							rs = stmt.executeQuery(sql);					
							
							while(rs.next()) {
								int num = rs.getInt("P_NUM");
								String title = rs.getString("P_TITLE");
								String date = rs.getString("P_DATE");
								String file = rs.getString("P_FILE");
								String writer = rs.getString("U_ID");//가져오는 데이터베이스는 U_ID
								BOARD_PDTO dto = new BOARD_PDTO(num, title, date, file, writer);
								dto.setP_Total(total);
								dtos.add(dto);
							}	
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dtos;
				}
				//자유게시판 값 하나 가져오기
				public BOARD_FDTO BOARD_F(int F_NUM){

						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						BOARD_FDTO dto = new BOARD_FDTO();
					
						
						try {
							con = getConnection();
							stmt = con.createStatement();
														
							String sql= "select * from BOARD_F where F_NUM=?";//받은 자유게시판 아이디로 검색
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, F_NUM);
							
							rs = pstmt.executeQuery();					
							
							while(rs.next()) {//값을 dto에 넣는다.
								dto.setF_NUM(rs.getInt("F_NUM")); 
								dto.setF_TITLE(rs.getString("F_TITLE"));
								dto.setF_DATE(rs.getString("F_DATE"));
								dto.setF_CONTENT(rs.getString("F_CONTENT"));
								dto.setU_ID(rs.getString("U_ID"));	
							}
							
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dto;//리턴
				}
				//포토게시판 값 하나 가져오기
				public BOARD_PDTO BOARD_P(int P_NUM){

						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						BOARD_PDTO dto = new BOARD_PDTO();
					
						
						try {
							con = getConnection();
							stmt = con.createStatement();
														
							String sql= "select * from BOARD_P where P_NUM=?";//받은 자유게시판 아이디로 검색
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, P_NUM);
							
							rs = pstmt.executeQuery();					
							
							while(rs.next()) {//값을 dto에 넣는다.
								dto.setP_NUM(rs.getInt("P_NUM")); 
								dto.setP_TITLE(rs.getString("P_TITLE"));
								dto.setP_DATE(rs.getString("P_DATE"));
								dto.setP_FILE(rs.getString("P_FILE"));
								dto.setP_ID(rs.getString("U_ID"));	
							}
							
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dto;//리턴
				}
		
		
				//listUser
				public ArrayList<WRITERDTO> listUser(){
					
					//db검색정보 저장위해 arraylist생성
					ArrayList<WRITERDTO> dtos = new ArrayList<WRITERDTO>();
						Connection con=null;
						Statement stmt = null;
						ResultSet rs = null;
						
						try {
							con = getConnection();
							String sql= "select * from WRITER ORDER BY U_ID";
							stmt = con.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()) {
								String id = rs.getString("U_ID");
								String pwd = rs.getString("U_PW");
								String name = rs.getString("U_NAME");
								WRITERDTO dto = new WRITERDTO(id, pwd, name);
								dtos.add(dto);
							}
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							try { 
								if(rs!=null) rs.close();
								if(stmt!=null)stmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}	
						return dtos;
				}
				//로그인(2)
				public int checkUser(String id, String pwd) {
					int check = 0;
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						con = getConnection();
						String sql = "SELECT U_ID, U_PW FROM WRITER WHERE U_ID=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							String dbpwd = rs.getString("U_PW");
							if(dbpwd.equals(pwd)) {
								check=1;
							}else {	//id는 있으나 pwd가 틀리다.
								check=0;
							}
						}else {
							check=-1;
						}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try { 
							if(rs!=null) rs.close();
							if(pstmt !=null) pstmt.close();
							if(con != null)con.close();
						}catch(Exception e) {
							e.printStackTrace();
						}
					}
					return check;
				}
				
				//포토게시판 관련 함수 작성중
		public void P_BOARD_Change(BOARD_PDTO dto, String flag) {
			Connection con = null; PreparedStatement pstmt = null;
			String sql=null; ResultSet rs = null;
			try { 
				con = getConnection();
				if(flag.equals("i")) {
					sql = "INSERT INTO BOARD_P VALUES(SEQ_P_NUM.NEXTVAL,?,?,?,?)";		
					//3.sql문 준비
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getP_TITLE());
					pstmt.setString(2, dto.getP_DATE());
					pstmt.setString(3, dto.getP_FILE());
					pstmt.setString(4, dto.getP_ID());
				}else if(flag.equals("u")) {
					sql = "update BOARD_P set P_TITLE=?, P_FILE=? where P_NUM=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getP_TITLE());
					pstmt.setString(2, dto.getP_FILE());
					pstmt.setInt(3, dto.getP_NUM());
					pstmt.executeUpdate();
				}else if(flag.equals("d")) {
					sql = "delete from BOARD_P where P_NUM=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getP_NUM());
					pstmt.executeUpdate();
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		//QNA게시판
		//입력/변경/삭제 함수.
			public void Q_BOARD_Change(BOARD_QDTO dto, String flag) {
				Connection con = null; PreparedStatement pstmt = null;
				String sql=null; ResultSet rs = null;
				try { 
					con = getConnection();
					if(flag.equals("i")) {
						sql = "INSERT INTO BOARD_Q VALUES(SEQ_Q_NUM.NEXTVAL, ?, ?, ?, ?)";		
						//3.sql문 준비
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getQ_TITLE());
						pstmt.setString(2, dto.getQ_DATE());
						pstmt.setString(3, dto.getQ_CONTENT());
						pstmt.setString(4, dto.getU_ID());
					}else if(flag.equals("u")) {
						sql = "update BOARD_Q set Q_TITLE=?, Q_DATE=? ,Q_CONTENT=? where Q_NUM=?";//수정시 날짜 변경 허용?
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getQ_TITLE());
						pstmt.setString(2, dto.getQ_DATE());
						pstmt.setString(3, dto.getQ_CONTENT());
						pstmt.setInt(4, dto.getQ_NUM());
					}else if(flag.equals("d")) {
						sql = "delete from BOARD_Q where Q_NUM=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getQ_NUM());
					}
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
			//QNA게시판 값 하나 가져오기
			public BOARD_QDTO BOARD_Q(int Q_NUM){

					Connection con=null;
					Statement stmt = null;
					ResultSet rs = null;
					BOARD_QDTO dto = new BOARD_QDTO();
				
					
					try {
						con = getConnection();
						stmt = con.createStatement();
													
						String sql= "select * from BOARD_Q where Q_NUM=?";//받은 자유게시판 아이디로 검색
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, Q_NUM);
						
						rs = pstmt.executeQuery();					
						
						while(rs.next()) {//값을 dto에 넣는다.
							dto.setQ_NUM(rs.getInt("Q_NUM")); 
							dto.setQ_TITLE(rs.getString("Q_TITLE"));
							dto.setQ_DATE(rs.getString("Q_DATE"));
							dto.setQ_CONTENT(rs.getString("Q_CONTENT"));
							dto.setU_ID(rs.getString("Q_ID"));	
						}
						
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try { 
							if(rs!=null) rs.close();
							if(stmt!=null)stmt.close();
							if(con!=null) con.close();
						}catch(Exception e){e.printStackTrace();}
					}	
					return dto;//리턴
			}
			//list QNA게시판

			public ArrayList<BOARD_QDTO> list_Q(){
				//db검색정보 저장위해 arraylist생성
				ArrayList<BOARD_QDTO> dtos = new ArrayList<BOARD_QDTO>();
					Connection con=null;
					Statement stmt = null;
					ResultSet rs = null;
					
					try {
						con = getConnection();
						stmt = con.createStatement();
						int total = 0;
						String sqlCount = "SELECT COUNT(*) FROM BOARD_Q";
						rs = stmt.executeQuery(sqlCount);
						if(rs.next()){
							total = rs.getInt(1);
						}
													
						String sql= "select * from BOARD_Q ORDER BY Q_NUM DESC";
						rs = stmt.executeQuery(sql);					
						
						while(rs.next()) {
							int num = rs.getInt("Q_NUM");
							String title = rs.getString("Q_TITLE");
							String date = rs.getString("Q_DATE");
							String content = rs.getString("Q_CONTENT");
							String writer = rs.getString("Q_ID");
							BOARD_QDTO dto = new BOARD_QDTO(num, title, date, content, writer);
							dto.setQ_Total(total);
							dtos.add(dto);
						}
						
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try { 
							if(rs!=null) rs.close();
							if(stmt!=null)stmt.close();
							if(con!=null) con.close();
						}catch(Exception e){e.printStackTrace();}
					}	
					return dtos;
			}
			//전체 레코드 갯수 가져오기.
			public int getCount() {
				int count = 0;
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT COUNT(F_NUM) COUNT FROM BOARD_F";
				
				try {
					PJ2020DAO dao = PJ2020DAO.getInstance();
					con = dao.getConnection();
					
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next())
					{
						count = rs.getInt("count");
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try { if(rs!=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(con!=null) con.close();
					}catch(Exception e) {e.printStackTrace();}
				}
				return count;
			}
			//메게변수로 주어진 페이지에서 한화면에 출력한 갯수많큼 dto반환
			public ArrayList<BOARD_FDTO> getListUser(int page, int numOfRecords){
				
				ArrayList<BOARD_FDTO> dtos = new ArrayList<BOARD_FDTO>();
				Connection con=null; PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM (SELECT ROWNUM NUM, L.* FROM (SELECT * FROM BOARD_F ORDER BY F_NUM) L) WHERE NUM BETWEEN ? AND ? ";
				//1-10/11-20/21-30/
				try {
					PJ2020DAO dao = PJ2020DAO.getInstance();
					con = dao.getConnection();
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, 1+(page-1)*numOfRecords);
					pstmt.setInt(2, page*numOfRecords);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						int num = rs.getInt("F_NUM");
						String title = rs.getString("F_TITLE");
						String date = rs.getString("F_DATE");
						String content = rs.getString("F_CONTENT");
						String user = rs.getString("U_ID");
						//레코드하나 DTO저장
						BOARD_FDTO dto = new BOARD_FDTO(num, title, date, content, user);
						dtos.add(dto);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try { if(rs!=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(con!=null) con.close();
					}catch(Exception e) {e.printStackTrace();}
				} 
				return dtos;//호출한 jsp파일로 DTO가 저장된 list반환
				
			}
			
		
	
}
















