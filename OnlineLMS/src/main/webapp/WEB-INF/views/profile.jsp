<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Online LMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .profile-banner {
            background: linear-gradient(120deg, #172554, #4338ca, #7c3aed);
            padding: 35px;
            border-radius: 18px;
            color: white;
            margin-bottom: 30px;
        }

        .profile-banner h1 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .profile-banner p {
            color: #e0e7ff;
        }

        .profile-card {
            background: white;
            max-width: 750px;
            margin: auto;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(15,23,42,0.06);
            border: 1px solid #e2e8f0;
        }

        .profile-avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4338ca, #7c3aed);
            color: white;
            font-size: 35px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
        }

        .profile-name {
            text-align: center;
            color: #172554;
            font-size: 25px;
            margin-bottom: 8px;
        }

        .profile-email {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 18px;
        }

        .detail-box {
            background: #f8faff;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
        }

        .detail-box span {
            display: block;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 9px;
        }

        .detail-box strong {
            color: #172554;
            font-size: 17px;
            word-break: break-word;
        }

        .edit-section {
            border-top: 1px solid #e2e8f0;
            margin-top: 35px;
            padding-top: 28px;
        }

        .edit-section h3 {
            color: #172554;
            margin-bottom: 20px;
        }

        .edit-section label {
            display: block;
            color: #334155;
            font-weight: 600;
            font-size: 14px;
            margin-top: 15px;
        }

        .edit-section button {
            width: 100%;
            margin-top: 15px;
        }

        .profile-message {
            text-align: center;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .profile-success {
            background: #dcfce7;
            color: #166534;
        }

        .profile-error {
            background: #fee2e2;
            color: #b91c1c;
        }
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar">
        <div class="logo">Online LMS</div>

        <div class="nav-links">
            <span style="color:#c4b5fd; font-weight:600;">
                Welcome,
                <c:out value="${sessionScope.studentName}"/>!
            </span>

            <a href="${pageContext.request.contextPath}/courses">Courses</a>

            <a href="${pageContext.request.contextPath}/my-courses">
                My Learning
            </a>

            <a href="${pageContext.request.contextPath}/profile">
                Profile
            </a>

            <a href="${pageContext.request.contextPath}/logout">
                Logout
            </a>
        </div>
    </nav>

    <main class="container">

        <!-- Profile Banner -->
        <section class="profile-banner">
            <h1>My Student Profile</h1>
            <p>
                View and update your learning account information.
            </p>
        </section>

        <section class="profile-card">

            <!-- Profile Information -->
            <div class="profile-avatar">
                <c:out value="${sessionScope.studentName.substring(0,1).toUpperCase()}"/>
            </div>

            <h2 class="profile-name">
                <c:out value="${sessionScope.studentName}"/>
            </h2>

            <p class="profile-email">
                <c:out value="${sessionScope.studentEmail}"/>
            </p>

            <!-- Existing Profile Messages -->
            <c:if test="${param.updated == '1'}">
                <div class="profile-message profile-success">
                    Your profile has been updated successfully!
                </div>
            </c:if>

            <c:if test="${param.emailExists == '1'}">
                <div class="profile-message profile-error">
                    This email address is already registered.
                </div>
            </c:if>

            <c:if test="${param.error == '1'}">
                <div class="profile-message profile-error">
                    Please enter both your name and email.
                </div>
            </c:if>

            <!-- Password Messages -->
            <c:if test="${param.passwordChanged == '1'}">
                <div class="profile-message profile-success">
                    Password changed successfully!
                </div>
            </c:if>

            <c:if test="${param.wrongPassword == '1'}">
                <div class="profile-message profile-error">
                    Your current password is incorrect.
                </div>
            </c:if>

            <c:if test="${param.passwordMismatch == '1'}">
                <div class="profile-message profile-error">
                    New password and confirmation do not match.
                </div>
            </c:if>

            <c:if test="${param.passwordShort == '1'}">
                <div class="profile-message profile-error">
                    Password must contain at least 8 characters.
                </div>
            </c:if>

            <c:if test="${param.passwordEmpty == '1'}">
                <div class="profile-message profile-error">
                    Please fill in all password fields.
                </div>
            </c:if>

            <c:if test="${param.passwordError == '1'}">
                <div class="profile-message profile-error">
                    Something went wrong. Please try again.
                </div>
            </c:if>

            <!-- Profile Details -->
            <div class="profile-details">

                <div class="detail-box">
                    <span>Student ID</span>
                    <strong>
                        <c:out value="${sessionScope.studentId}"/>
                    </strong>
                </div>

                <div class="detail-box">
                    <span>Enrolled Courses</span>
                    <strong>
                        <c:out value="${totalCourses}"/>
                    </strong>
                </div>

                <div class="detail-box">
                    <span>Account Status</span>
                    <strong style="color:#15803d;">Active</strong>
                </div>

                <div class="detail-box">
                    <span>Account Type</span>
                    <strong>Student</strong>
                </div>

            </div>

            <!-- Edit Profile -->
            <div class="edit-section">

                <h3>Edit Your Information</h3>

                <form action="${pageContext.request.contextPath}/update-profile"
                      method="post">

                    <label for="name">Full Name</label>

                    <input type="text"
                           id="name"
                           name="name"
                           value="<c:out value='${sessionScope.studentName}'/>"
                           required>

                    <label for="email">Email Address</label>

                    <input type="email"
                           id="email"
                           name="email"
                           value="<c:out value='${sessionScope.studentEmail}'/>"
                           required>

                    <button type="submit">
                        Save Changes
                    </button>

                </form>

            </div>

            <!-- Change Password -->
            <div class="edit-section">

                <h3>Change Password</h3>

                <p>
                    Keep your account secure by updating your password.
                </p>

                <form action="${pageContext.request.contextPath}/change-password"
                      method="post">

                    <label for="currentPassword">
                        Current Password
                    </label>

                    <input type="password"
                           id="currentPassword"
                           name="currentPassword"
                           placeholder="Enter current password"
                           required>

                    <label for="newPassword">
                        New Password
                    </label>

                    <input type="password"
                           id="newPassword"
                           name="newPassword"
                           placeholder="Minimum 8 characters"
                           minlength="8"
                           required>

                    <label for="confirmPassword">
                        Confirm New Password
                    </label>

                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           placeholder="Confirm new password"
                           minlength="8"
                           required>

                    <button type="submit">
                        Change Password
                    </button>

                </form>

            </div>

            <!-- Back to My Learning -->
            <div style="text-align:center; margin-top:25px;">

                <a class="btn"
                   href="${pageContext.request.contextPath}/my-courses">
                    Back to My Learning
                </a>

            </div>

        </section>

    </main>

    <footer class="footer">
        © 2026 Online Learning Management System. All Rights Reserved.
    </footer>

</body>
</html>
