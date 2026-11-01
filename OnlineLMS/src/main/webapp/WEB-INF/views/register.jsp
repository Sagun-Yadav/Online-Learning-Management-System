
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Registration | Online LMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            background: linear-gradient(135deg, #eef2ff, #f5f3ff);
        }

        .register-wrapper {
            min-height: 85vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 35px 15px;
        }

        .register-card {
            width: 100%;
            max-width: 480px;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(30,41,90,0.12);
        }

        .register-icon {
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

        .register-card h1 {
            text-align: center;
            color: #172554;
            font-size: 27px;
            margin-bottom: 10px;
        }

        .register-description {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .register-card label {
            display: block;
            color: #334155;
            font-weight: 600;
            font-size: 14px;
            margin-top: 15px;
        }

        .register-card input {
            width: 100%;
            padding: 14px;
            margin-top: 8px;
            border: 1px solid #dbe1ef;
            border-radius: 9px;
            font-size: 14px;
        }

        .register-card button {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            font-size: 15px;
        }

        .login-text {
            text-align: center;
            margin-top: 25px;
            color: #64748b;
            font-size: 14px;
        }

        .login-text a {
            color: #4338ca;
            font-weight: 700;
            text-decoration: none;
        }

        .register-footer {
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
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </nav>

    <div class="register-wrapper">

        <div class="register-card">

            <div class="register-icon">✦</div>

            <h1>Create Your Account</h1>

            <p class="register-description">
                Join our learning community and start building your future.
            </p>

            <form action="${pageContext.request.contextPath}/register"
                  method="post">

                <label for="name">Full Name</label>

                <input type="text"
                       id="name"
                       name="name"
                       placeholder="Enter your full name"
                       required>

                <label for="email">Email Address</label>

                <input type="email"
                       id="email"
                       name="email"
                       placeholder="Enter your email address"
                       required>

                <label for="password">Password</label>

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Create a password"
                       required>

                <button type="submit">
                    Create Account
                </button>

            </form>

            <p class="login-text">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login">
                    Sign In
                </a>
            </p>

            <p class="register-footer">
                © 2026 Online Learning Management System
            </p>

        </div>

    </div>

</body>
</html>
