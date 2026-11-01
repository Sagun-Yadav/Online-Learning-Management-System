
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Online LMS | Learn. Grow. Succeed.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            background: #f5f7ff;
        }

        .hero {
            min-height: 510px;
            padding: 90px 8%;
            display: flex;
            align-items: center;
            background: linear-gradient(120deg, #172554, #3730a3, #6d28d9);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            max-width: 720px;
            position: relative;
            z-index: 1;
        }

        .hero-tag {
            display: inline-block;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.25);
            padding: 9px 16px;
            border-radius: 30px;
            font-size: 13px;
            margin-bottom: 25px;
        }

        .hero h1 {
            font-size: clamp(38px, 5vw, 58px);
            line-height: 1.15;
            margin-bottom: 22px;
        }

        .hero h1 span {
            color: #c4b5fd;
        }

        .hero p {
            font-size: 17px;
            line-height: 1.8;
            color: #e0e7ff;
            max-width: 600px;
            margin-bottom: 32px;
        }

        .hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .hero-buttons a {
            display: inline-block;
            padding: 14px 25px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 700;
            transition: 0.3s;
        }

        .primary-btn {
            background: white;
            color: #312e81;
        }

        .secondary-btn {
            border: 1px solid rgba(255,255,255,0.6);
            color: white;
        }

        .hero-buttons a:hover {
            transform: translateY(-3px);
        }

        .features {
            padding: 65px 8%;
            text-align: center;
        }

        .features h2 {
            font-size: 31px;
            color: #172554;
            margin-bottom: 12px;
        }

        .features-intro {
            color: #64748b;
            margin-bottom: 35px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 22px;
            max-width: 1100px;
            margin: auto;
        }

        .feature-card {
            background: white;
            padding: 30px 22px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(15,23,42,0.05);
            border: 1px solid #e2e8f0;
        }

        .feature-icon {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .feature-card h3 {
            color: #312e81;
            margin-bottom: 12px;
        }

        .feature-card p {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
        }

        .cta {
            margin: 20px 8% 65px;
            padding: 45px 25px;
            text-align: center;
            border-radius: 18px;
            background: linear-gradient(120deg, #4338ca, #7c3aed);
            color: white;
        }

        .cta h2 {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .cta p {
            color: #ede9fe;
            margin-bottom: 22px;
        }

        .cta a {
            display: inline-block;
            background: white;
            color: #4338ca;
            padding: 13px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
        }

        @media (max-width: 600px) {
            .hero {
                padding: 65px 7%;
                min-height: 450px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .features {
                padding: 45px 6%;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">

        <div class="logo">Online LMS</div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/">Home</a>

            <a href="${pageContext.request.contextPath}/login">
                Student Login
            </a>

            <a href="${pageContext.request.contextPath}/register">
                Register
            </a>
        </div>

    </nav>

    <section class="hero">

        <div class="hero-content">

            <span class="hero-tag">
                YOUR LEARNING JOURNEY STARTS HERE
            </span>

            <h1>
                Learn Today.<br>
                <span>Lead Tomorrow.</span>
            </h1>

            <p>
                Discover new skills, explore quality courses,
                learn from experienced instructors and build
                the knowledge you need to achieve your goals.
            </p>

            <div class="hero-buttons">

                <a class="primary-btn"
                   href="${pageContext.request.contextPath}/register">
                    Get Started
                </a>

                <a class="secondary-btn"
                   href="${pageContext.request.contextPath}/login">
                    Student Login
                </a>

            </div>

        </div>

    </section>

    <section class="features">

        <h2>Everything You Need to Learn</h2>

        <p class="features-intro">
            A simple and convenient platform for your learning journey.
        </p>

        <div class="feature-grid">

            <div class="feature-card">
                <div class="feature-icon">📚</div>
                <h3>Explore Courses</h3>
                <p>
                    Discover courses across different subjects
                    and areas of interest.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🎓</div>
                <h3>Learn at Your Pace</h3>
                <p>
                    Enrol in courses and manage your learning
                    in one convenient place.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🚀</div>
                <h3>Grow Your Skills</h3>
                <p>
                    Build knowledge and develop skills
                    that support your future goals.
                </p>
            </div>

        </div>

    </section>

    <section class="cta">

        <h2>Ready to Begin?</h2>

        <p>
            Take the first step towards a better learning experience.
        </p>

        <a href="${pageContext.request.contextPath}/register">
            Create Your Account
        </a>

    </section>

    <footer class="footer">
        © 2026 Online Learning Management System. All Rights Reserved.
    </footer>

</body>
</html>
