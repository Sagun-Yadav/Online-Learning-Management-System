
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Course Catalogue | Online LMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            background: #f3f5fb;
        }

        .catalogue-header {
            background: linear-gradient(120deg, #172554, #4338ca, #7c3aed);
            color: white;
            padding: 38px;
            border-radius: 16px;
            margin-bottom: 30px;
        }

        .catalogue-header h1 {
            font-size: 32px;
            margin-bottom: 12px;
        }

        .catalogue-header p {
            color: #e0e7ff;
            line-height: 1.7;
        }

        .course-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
            margin-top: 25px;
        }

        .course-card {
            background: white;
            padding: 28px;
            border-radius: 15px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 5px 20px rgba(15,23,42,0.05);
            transition: 0.25s;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(67,56,202,0.12);
        }

        .course-card h3 {
            color: #4338ca;
            font-size: 21px;
            margin: 15px 0;
        }

        .course-card p {
            color: #64748b;
            line-height: 1.7;
            margin-bottom: 12px;
        }

        .course-label {
            display: inline-block;
            background: #ede9fe;
            color: #5b21b6;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .course-card form {
            margin-top: 20px;
        }

        .course-card button {
            width: 100%;
        }

        .duplicate-message {
            background: #fee2e2;
            color: #b91c1c;
            padding: 15px;
            border-radius: 9px;
            text-align: center;
            font-weight: 600;
            margin: 20px 0;
        }

        .empty-message {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 12px;
            color: #64748b;
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

    <!-- Main Content -->
    <main class="container">

        <section class="catalogue-header">

            <h1>Explore Our Courses</h1>

            <p>
                Discover new skills, learn from experienced
                instructors and continue your learning journey.
            </p>

        </section>

        <!-- Duplicate Enrolment Message -->
        <c:if test="${param.duplicate == '1'}">

            <p class="duplicate-message">
                You are already enrolled in this course.
            </p>

        </c:if>

        <!-- Course Cards -->
        <div class="course-list">

            <c:forEach var="course" items="${courses}">

                <div class="course-card">

                    <span class="course-label">
                        AVAILABLE COURSE
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

                    <form action="${pageContext.request.contextPath}/enroll"
                          method="post">

                        <input type="hidden"
                               name="courseId"
                               value="${course.courseId}">

                        <button type="submit">
                            Enroll Now
                        </button>

                    </form>

                </div>

            </c:forEach>

        </div>

        <c:if test="${empty courses}">

            <p class="empty-message">
                No courses are currently available.
            </p>

        </c:if>

    </main>

    <!-- Footer -->
    <footer class="footer">
        © 2026 Online Learning Management System. All Rights Reserved.
    </footer>

</body>
</html>
