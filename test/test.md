---
date: 20200101
title: test
desc: test
---

# servlet
> 톰캣과 web.xml
- 톰캣은 Servlet Container, Servlet Engine으로써 Servlet을 실행하여 동작합니다.
- web.xml 파일은 클라이언트가 어떤 URL을 요청했을 때 어떤 Servlet 파일을 실행시킬 것인지를 매핑해 놓은 파일

> Servlet 기본 구조
- 톰캣에서 만들어 놓은 HttpServlet 클래스를 상속
- HTTP 요청 메서드인 Get 방식과 Post 방식을 처리하기 위해 doGet()과 doPost()를 오버라이딩
    - 매개 변수로는 HttpServletRequest, HttpServletResponse 클래스를 정의합니다.

> URL과 Servlet 매핑 - web.xml
- URL 매핑을 하는 방법에는 web.xml에 직접 작성하거나 어노테이션(@WebServlet("/mapping"))을 작성하는 방식이 있습니다.
    - 어노테이션과 web.xml파일의 매핑이 중복되면 톰캣 실행이 되지 않습니다.
~~~xml
<!-- web.xml 매핑 작성 방법 -->
<servlet>
    <servlet-name>servletMapping</servlet-name>
    <servlet-class>className</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>servletMapping</servlet-name>
    <url-pattern>/mapping</url-pattern>
</servlet-mapping>
~~~
- servlet-name
    - web.xml에서 매핑을 구분하기 위한 이름
- servlet-class
    - Servlet 클래스 이름
- url-pattern
    - Servlet에 대응하는 URL

> (HttpServletRequest)Request / (HttpServletResponse)Response
- 두 객체는 톰캣에서 미리 작성해둔 클래스이며, HTTP 요청과 응답에 대한 정보들을 모두 갖고 있습니다.
- request
    - 클라이언트가 요청할 때 함께 전송한 데이터들을 포함
    - URL 파라미터, form 데이터 등
- response
    - 서버에서 클라이언트로 응답 할 때 필요한 데이터들을 포함
    - 응답 결과 상태 코드, 요청 HTML 문서 등

> Servlet 객체로 응답하기
~~~java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html; charset=UTF-8");

    PrintWriter out = response.getWriter();
    out.println("<h1>TEST</h1>");
}
~~~
- response.setContentType()
    - HTTP 응답 헤더를 작성하는 코드 입니다.
    - 헤더이므로 HTTP body보다 위에 작성합니다.
- response.getWriter()
    - 브라우저 body내부에 출력할 메시지 입니다.
- Servlet으로 응답 페이지를 보여주는 것은 비효율적입니다.
그래서 HTML문서에서 Java코드를 넣을 수 있는 JSP가 필요한 것입니다.
    - 모든 요청은 Servlet으로 받고 클라이언트에게 보여 줄 페이지는 JSP로 작성합니다.
