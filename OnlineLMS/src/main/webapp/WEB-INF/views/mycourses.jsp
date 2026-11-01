
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Learning | Online LMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .welcome-banner {
            background: linear-gradient(120deg, #172554, #4338ca, #7c3aed);
            color: white;
            padding: 35px;
            border-radius: 16px;
            margin-bottom: 35px;
        }

        .welcome-banner h1 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .welcome-banner p {
            color: #e0e7ff;
            line-height: 1.7;
        }

        .section-heading {
            color: #172554;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .course-count {
            color: #64748b;
            margin-bottom: 25px;
        }

        .course-card {
            position: relative;
            overflow: hidden;
        }

        .course-label {
            display: inline-block;
            background: #ede9fe;
            color: #5b21b6;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .empty-state {
            background: white;
            padding: 55px 25px;
            text-align: center;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
        }

        .empty-state .icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .empty-state h3 {
            color: #172554;
            margin-bottom: 12px;
        }

        .empty-state p {
            color: #64748b;
            margin-bottom: 22px;
        }
    </style>
</head>

<body>

    <nav class="navbar">

        <div class="logo">Online LMS</div>

        <div class="nav-links">

            <span style="color:#c4b5fd; font-weight:600;">
                Welcome,
                <c:out value="${sessionScope.studentName}"/>!
            </span>

            <a href="${pageContext.request.contextPath}/courses">
                Courses
            </a>

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

        <section class="welcome-banner">

            <h1>Your Learning Space</h1>

            <p>
                Every course you enrol in brings you one step
                closer to your learning goals. Keep growing!
            </p>

        </section>

        <h2 class="section-heading">
            My Enrolled Courses
        </h2>

        <p class="course-count">
            Here are the courses you have joined.
        </p>

        <c:if test="${param.enrolled == '1'}">
            <p class="success-message">
                Congratulations! You have successfully enrolled.
            </p>
        </c:if>

        <c:choose>

            <c:when test="${not empty courses}">

                <div class="course-list">

                    <c:forEach var="course" items="${courses}">

                        <div class="course-card">

                            <span class="course-label">
                                ENROLLED
                            </span>

                            <h3>
                                <c:out value="${course.courseName}"/>
                            </h3>

                            <p>
                                <c:out value="${course.description}"/>
                            </p>

                            <p>
                                <strong>Instructor:</strong>
                                <c:out value="${course.instructor}"/>
                            </p>

                            <p>
                                <strong>Course ID:</strong>
                                <c:out value="${course.courseId}"/>
                            </p>

                        </div>

                    </c:forEach>

                </div>

            </c:when>

            <c:otherwise>

                <div class="empty-state">

                    <div class="icon">📚</div>

                    <h3>No Courses Yet</h3>

                    <p>
                        You haven't enrolled in any courses.
                        Explore our catalogue to get started.
                    </p>

                    <a class="btn"
                       href="${pageContext.request.contextPath}/courses">
                        Explore Courses
                    </a>

                </div>

            </c:otherwise>

        </c:choose>

    </main>

    <footer class="footer">
        © 2026 Online Learning Management System.
        All Rights Reserved.
    </footer>

</body>
</html>
