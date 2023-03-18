<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 3/18/2023
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>CALCULATOR</title>
</head>
<body>
<h1>Calculator</h1>
<form method="post" action="/calculator">
  <fieldset>
    <legend>Calculator</legend>
    <table>
      <tr>
        <td>First operand: </td>
        <td><input name="first-operand" type="text" placeholder="0.0"/></td>
      </tr>
      <tr>
        <td>Operator: </td>
        <td>
          <select name="operator">
            <option>---choose---</option>
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Second operand: </td>
        <td><input name="second-operand" type="text" placeholder="0.0"/></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Result"/></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
