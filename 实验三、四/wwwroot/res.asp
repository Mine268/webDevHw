<%@ language="vbscript" %>
<!doctype html>
<html>
    <head>
        <title>结果</title>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk2321" />
        <%
            name = Request.Form("uname")
            numb = Request.Form("stdnum")
            firm = Request.Form("firm")
            a1 = Request.Form("a1")
            a2 = Request.Form("a2")
            a3 = Request.Form("a3")
            a4 = Request.Form("a4")
            s1 = 0
            s2 = 0
            s3 = 0
            if a1 = "B" then
                s1 = 10
            end if
            if a2 = "A" then
                s2 = 10
            end if
            if a3 = "A, D" then
                s3 = 10
            end if

            set conn=Server.CreateObject("ADODB.Connection") 
            dataaccess = server.mappath("./data/score.mdb")
            conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dataaccess

            sql = "INSERT INTO score (s_name,s_class,s_score,s_text)"
            sql = sql & " VALUES "
            sql = sql & "('" & name & "',"
            sql = sql & "'" & firm & "',"
            sql = sql & "'" & s1+s2+s3 & "',"
            sql = sql & "'" & a4 & "')"

            on error resume next
            conn.Execute sql,recaffected
            if err <> 0 then
                flag = 1
            else
                flag = 0
            end if
            conn.close
        %>
    </head>

    <body>
        <div style="position: absolute; left: 1cm; right: 1cm">
            <h1>您已完成本次测试</h1>
            <p>以下时这次测试的结果：</p>

            <table>
                <tr>
                    <td>姓名：</td>
                    <td><% Response.Write(name) %></td>
                </tr>
                <tr>
                    <td>学号：</td>
                    <td><% Response.Write(numb) %></td>
                </tr>
                <tr>
                    <td>考场号：</td>
                    <td><% Response.Write(firm) %></td>
                </tr>
                <tr>
                    <td>第一题得分：</td>
                    <td><% Response.Write(s1) %></td>
                </tr>
                <tr>
                    <td>第二题得分：</td>
                    <td><% Response.Write(s2) %></td>
                </tr>
                <tr>
                    <td>第三题得分：</td>
                    <td><% Response.Write(s3) %></td>
                </tr>
                <tr>
                    <td>客观题得分：</td>
                    <td><% Response.Write(s1+s2+s3) %></td>
                </tr>
                <tr>
                    <td>第四题得分：</td>
                    <td>待审阅</td>
                </tr>
            </table>

            <p>最终成绩将于近日发送至学号对应的邮箱中，请注意查收。</p>
            <%
            if flag = 0 then
                Response.Write("数据写入成功！")
            else
                Response.Write("无法写入数据。")
            end if
            %>
        </div>
    </body>
</html>