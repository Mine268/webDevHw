<%@ language="vbscript" %>
<!doctype html>
<html>
    <head>
        <title>成绩展示</title>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk2321" />
    </head>

    <body style="position: absolute; top: 1cm; left: 1cm;">
        <h1>以下是一些同学的成绩展示 - <a href="./index.html">返回</a></h1>
        <%
        set conn=Server.CreateObject("ADODB.Connection") 
        dataaccess = server.mappath("./data/score.mdb")
        conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dataaccess

        set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "Select s_name,s_class,s_score,s_text from score order by s_score", conn
        %>

        <table border="1" width="100%">
            <tr>
                <th>姓名</th>
                <th>考场</th>
                <th>客观题分数</th>
                <th>作文</th>
            </tr>

            <%do until rs.EOF%>
            <tr>
                <%for each x in rs.Fields%>
                <td>
                    <%response.write(x.value)%>
                </td>
                <%next
                rs.MoveNext%>
            </tr>
            <%loop%>
            <%rs.close
            conn.close%>
        </table>
    </body>
</html>