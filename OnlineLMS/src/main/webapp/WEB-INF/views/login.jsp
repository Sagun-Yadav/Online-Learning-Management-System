
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Login | Online LMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            background: linear-gradient(135deg, #eef2ff, #f5f3ff);
        }

        .login-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 15px;
        }

        .login-card {
            width: 100%;
            max-width: 440px;
            background: white;
            padding: 42px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(30, 41, 90, 0.12);
        }

        .login-icon {
            width: 65px;
            height: 65px;
            margin: 0 auto 20px;
            border-radius: 18px;
            background: linear-gradient(135deg, #4338ca, #7c3aed);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .login-card h1 {
            text-align: center;
            color: #172554;
            font-size: 27px;
            margin-bottom: 10px;
        }

        .login-description {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .login-card label {
            display: block;
            color: #334155;
            font-weight: 600;
            font-size: 14px;
            margin-top: 15px;
        }

        .login-card input {
            width: 100%;
            padding: 14px;
            margin-top: 8px;
            border: 1px solid #dbe1ef;
            border-radius: 9px;
            font-size: 14px;
        }

        .login-card button {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            font-size: 15px;
        }

        .register-text {
            text-align: center;
            margin-top: 25px;
            color: #64748b;
            font-size: 14px;
        }

        .register-text a {
            color: #4338ca;
            font-weight: 700;
            text-decoration: none;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        .login-footer {
            text-align: center;
            color: #94a3b8;
            font-size: 12px;
            margin-top: 25px;
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <div class="logo">Online LMS</div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/register">Register</a>
        </div>
    </nav>

    <div class="login-wrapper">

        <div class="login-card">

            <div class="login-icon">✦</div>

            <h1>Welcome Back</h1>

            <p class="login-description">
                Sign in to continue your learning journey.
            </p>

            <form action="${pageContext.request.contextPath}/login"
                  method="post">

                <label for="email">Email Address</label>

                <input type="email"
                       id="email"
                       name="email"
                       placeholder="Enter your email"
                       required>

                <label for="password">Password</label>

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Enter your password"
                       required>

                <button type="submit">Sign In</button>

            </form>

            <p class="register-text">
                New to our platform?
                <a href="${pageContext.request.contextPath}/register">
                    Create an account
                </a>
            </p>

            <p class="login-footer">
                © 2026 Online Learning Management System
            </p>

        </div>

    </div>

</body>
</html>
