<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form modelAttribute="account" action="/admin/register" method='POST'>
        <table>
            <tr>
                <td>UserName:</td>
                <td><input type='text' name='username'></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='password' /></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input type='password' name='passwordConfirm' /></td>
            </tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
<%--         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
    </form>

</body>
</html>