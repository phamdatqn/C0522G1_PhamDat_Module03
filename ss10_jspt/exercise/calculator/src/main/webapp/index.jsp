<%--
  Created by IntelliJ IDEA.
  User: phamd
  Date: 24/08/2022
  Time: 3:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/Calculator" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input name="inputFirst"></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td><select name="calculation">
                    <option value="+">Addition (+)</option>
                    <option value="-">Subtraction (-)</option>
                    <option value="*">Multiplication (*)</option>
                    <option value="/">Division (/)</option>
                </select></td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input name="secondNumber"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Calculate</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
