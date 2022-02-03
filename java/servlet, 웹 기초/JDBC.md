# JDBC
> JDBC란?
- 자바에서 데이터베이스를 사용하기 위한 절차에 대한 규약입니다.

> 이클립스에서 JDBC 등록하기(MySql)
1. jar파일 다운로드 (https://dev.mysql.com/downloads/connector/j/)
2. JDBC를 연결할 프로젝트 Properties내부의 Java Build Path 이동
3. Libraries -> Add Library... -> User Library -> User Libraries
4. 이름 작성 -> Add External JARs -> jar 파일 선택
(mysql-connector-java-(버전)-bin.jar)

> JDBC 사용하기
- Connection 객체를 자동완성으로 import 할 때는 com.mysql.connection이 아닌 Java 표준인 java.sql.Connection 클래스를 import 해야 한다.
~~~java
// 동적 변수가 없는 SELECT문 실행
Connection conn = null; // DB 연결을 위한 Connection 객체
Statement stmt = null;  // 쿼리 실행을 위한 Statement 객체
ResultSet rs = null;    // DB 실행 결과 저장을 위한 ResultSet 객체

try{
    // 1. 드라이버 로딩
    Class.forName("com.mysql.jdbc.Driver");

    // 2. 연결하기
    String url = "jdbc:mysql://localhost/연결DB명";
    conn = DriverManager.getConnection(url, 아이디, 패스워드);

    // 3. 쿼리 작성
    String sql = "SELECT COL1, COL2, COL3 FROM TABLE";

    // 4. 쿼리 수행을 위한 Statement 객체 생성
    stmt = conn.createStatement();

    // 5. 쿼리 실행
    rs = stmt.executeQuery(sql);

    // 6. 실행 결과
    while(rs.next()){
        int col1 = rs.getInt(1);
        String col2 = rs.getString(2);
        String col3 = rs.getString(3);

        System.out.println(col1 + " / " + col2 + " / " + col3);
    }
} catch (ClassNotFoundException e) {
    System.out.println("드라이버 로딩 실패")
} catch (SQlException e) {
    System.out.println("에러" + e)
} finally {
    try {
        // Connection 객체 연결 해제
        if(conn != null && !conn.isClosed()) {
            conn.close();
        }
        if(stmt != null && !stmt.isClosed()) {
            stmt.close();
        }
        if(rs != null && !rs.isClosed()) {
            rs.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
~~~
- 쿼리에 동적으로 할당되는 값이 없는 경우 createStatement()메서드를 호출하여 쿼리 실행을 위한 Statement 객체 생성
~~~java
// 동적 변수가 있는 쿼리(SELECT/INSERT/UPDATE/DELETE) 실행
// @param (param1, param2, param3, param4)
Connection conn = null;
PreparedStatement pstmt = null;

try {
    // 1. 드라이버 로딩
    Class.forName("com.mysql.jdbc.Driver");

    // 2. 연결하기
    String url = "jdbc:mysql://localhost/연결DB명";
    conn = DriverManager.getConnection(url, 아이디, 패스워드);

    // 3. 쿼리 작성 
    String sql = "INSERT INTO TABLE VALUES(?, ?, ?, ?)";

    // 4. 동적 쿼리 수행을 위한 PreparedStatement 객체 생성
    pstmt = conn.preparedStatement(sql);

    // 5. 데이터 바인딩
    pstmt.setInt(1, param1);
    pstmt.setString(2, param2);
    pstmt.setString(3, param3);
    pstmt.setString(4, param4);

    // 6 쿼리 실행 및 결과 처리
    // executeUpdate()는 쿼리의 실행으로 변경된 row의 개수를 리턴
    int count = pstmt.executeUpdate();
    if(count == 0){
        System.out.println("쿼리 실행 실패");
    }
} catch (ClassNotFoundException e) {
    System.out.println("드라이버 로딩 실패")
} catch (SQlException e) {
    System.out.println("에러" + e)
} finally {
    try {
        // Connection 객체 연결 해제
        if(conn != null && !conn.isClosed()) {
            conn.close();
        }
        if(pstmt != null && !pstmt.isClosed()) {
            pstmt.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
~~~

|상황|사용 객체|
|:--|:-:|
|정적 쿼리 실행|Statement|
|동적 쿼리 실행|PreparedStatement|

|상황|사용 메서드|리턴 객체|
|:--|:-:|:-:|
|쿼리 실행 결과 유(SELECT)|executeQuery()|ResultSet|
|쿼리 실행 결과 무(INSERT, UPDATE, DELETE)|executeUpdate()|int|