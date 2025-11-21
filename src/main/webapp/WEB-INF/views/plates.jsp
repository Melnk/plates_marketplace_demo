<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Автомобильные номера | Premium Plates</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-dark: #1a365d;
            --primary-main: #2d3748;
            --accent-gold: #d69e2e;
            --accent-light: #ecc94b;
            --neutral-light: #f7fafc;
        }

        .bg-premium-dark {
            background-color: var(--primary-dark) !important;
        }

        .text-gold {
            color: var(--accent-gold) !important;
        }

        .btn-gold {
            background-color: var(--accent-gold);
            border-color: var(--accent-gold);
            color: white;
        }

        .btn-gold:hover {
            background-color: var(--accent-light);
            border-color: var(--accent-light);
            color: white;
        }

        .number-card {
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            transition: all 0.3s ease;
            background: white;
        }

        .number-card:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transform: translateY(-3px);
        }

        .number-plate {
            background: linear-gradient(135deg, #1a365d 0%, #2d3748 100%);
            border: 2px solid #d69e2e;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .plate-region {
            background: #d69e2e;
            color: #1a365d;
            padding: 4px 12px;
            border-radius: 6px;
            font-size: 0.9em;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 8px;
        }

        .plate-number {
            font-size: 1.4em;
            letter-spacing: 2px;
            color: white;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .status-published {
            color: #38a169;
            background: #f0fff4;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }

        .status-reserved {
            color: #d69e2e;
            background: #fffaf0;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }

        .status-sold {
            color: #e53e3e;
            background: #fff5f5;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }

        .price-tag {
            background: linear-gradient(135deg, #d69e2e, #ecc94b);
            color: white;
            padding: 8px 16px;
            border-radius: 25px;
            font-weight: bold;
            font-size: 1.1em;
            box-shadow: 0 4px 12px rgba(214, 158, 46, 0.3);
        }

        .plate-rarity {
            font-size: 0.8em;
            color: #718096;
            margin-top: 8px;
        }

        .action-buttons {
            margin-top: 15px;
        }
    </style>
</head>
<body>
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-premium-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand text-gold fw-bold fs-3" href="/">
            <i class="bi bi-123 me-2"></i>Premium Plates
        </a>
        <div class="navbar-nav ms-auto">
            <a href="/plates/add" class="btn btn-gold btn-sm">
                <i class="bi bi-plus-circle me-1"></i>Добавить номер
            </a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <!-- Hero Section -->
    <div class="row mb-5">
        <div class="col-12 text-center">
            <h1 class="display-5 fw-bold mb-3">Эксклюзивные автомобильные номера</h1>
            <p class="lead text-muted">Уникальные комбинации для вашего статуса</p>
            <div class="d-flex justify-content-center gap-3 mt-4">
                <a href="/plates/add-test" class="btn btn-gold btn-lg">
                    <i class="bi bi-lightning-charge me-2"></i>Добавить тестовые номера
                </a>
                <a href="/plates/add" class="btn btn-outline-primary btn-lg">
                    <i class="bi bi-plus-circle me-2"></i>Создать новый
                </a>
            </div>
        </div>
    </div>

    <!-- Statistics -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="row text-center">
                        <div class="col-md-4">
                            <h3 class="text-gold mb-1">
                                <c:out value="${plates.size()}" />
                            </h3>
                            <p class="text-muted mb-0">Всего номеров</p>
                        </div>
                        <div class="col-md-4">
                            <h3 class="text-success mb-1">
                                <c:set var="publishedCount" value="0" />
                                <c:forEach var="p" items="${plates}">
                                    <c:if test="${p.status == 'PUBLISHED'}">
                                        <c:set var="publishedCount" value="${publishedCount + 1}" />
                                    </c:if>
                                </c:forEach>
                                <c:out value="${publishedCount}" />
                            </h3>
                            <p class="text-muted mb-0">Опубликовано</p>
                        </div>
                        <div class="col-md-4">
                            <h3 class="text-primary mb-1">
                                <c:set var="regionsSet" value="" />
                                <c:forEach var="p" items="${plates}">
                                    <c:if test="${!fn:contains(regionsSet, p.region)}">
                                        <c:set var="regionsSet" value="${regionsSet}${p.region}," />
                                    </c:if>
                                </c:forEach>
                                <c:set var="regionsArray" value="${fn:split(regionsSet, ',')}" />
                                <c:out value="${fn:length(regionsArray) - 1}" />
                            </h3>
                            <p class="text-muted mb-0">Регионов</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Numbers Grid -->
    <div class="row g-4">
        <c:forEach var="p" items="${plates}">
            <div class="col-xl-4 col-lg-6 col-md-6">
                <div class="number-card p-4 h-100 d-flex flex-column">
                    <!-- Number Plate -->
                    <div class="number-plate mb-4">
                        <div class="plate-region">
                            <c:out value="${p.region}" />
                        </div>
                        <div class="plate-number">
                            <c:out value="${p.number}" />
                        </div>
                    </div>

                    <!-- Status & Info -->
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <small class="text-muted">Статус:</small>
                            <c:choose>
                                <c:when test="${p.status == 'PUBLISHED'}">
                                        <span class="status-published">
                                            <i class="bi bi-check-circle me-1"></i>Опубликован
                                        </span>
                                </c:when>
                                <c:when test="${p.status == 'RESERVED'}">
                                        <span class="status-reserved">
                                            <i class="bi bi-clock me-1"></i>Резерв
                                        </span>
                                </c:when>
                                <c:when test="${p.status == 'SOLD'}">
                                        <span class="status-sold">
                                            <i class="bi bi-x-circle me-1"></i>Продан
                                        </span>
                                </c:when>
                                <c:otherwise>
                                        <span class="status-published">
                                            <i class="bi bi-question-circle me-1"></i>
                                            <c:out value="${p.status}" />
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="text-end">
                            <div class="price-tag">
                                <c:choose>
                                    <c:when test="${fn:contains(p.number, '777')}">
                                        500 000 ₽
                                    </c:when>
                                    <c:when test="${fn:contains(p.number, '123') || fn:contains(p.number, '456')}">
                                        250 000 ₽
                                    </c:when>
                                    <c:otherwise>
                                        150 000 ₽
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="plate-rarity">
                                <c:choose>
                                    <c:when test="${fn:contains(p.number, '777')}">
                                        <i class="bi bi-gem me-1"></i>Эксклюзив
                                    </c:when>
                                    <c:when test="${fn:contains(p.number, '123') || fn:contains(p.number, '456')}">
                                        <i class="bi bi-star me-1"></i>Премиум
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-star-half me-1"></i>Стандарт
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons mt-auto">
                        <div class="d-grid gap-2">
                            <a href="/plates/${p.id}" class="btn btn-outline-primary btn-sm">
                                <i class="bi bi-eye me-1"></i>Подробнее
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Empty State -->
    <c:if test="${empty plates}">
        <div class="text-center py-5">
            <div class="mb-4">
                <i class="bi bi-123 display-1 text-muted"></i>
            </div>
            <h4 class="text-muted mb-3">Номера временно отсутствуют</h4>
            <p class="text-muted mb-4">Начните с добавления тестовых номеров или создайте новый</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="/plates/add-test" class="btn btn-gold btn-lg">
                    <i class="bi bi-lightning-charge me-2"></i>Добавить тестовые номера
                </a>
                <a href="/plates/add" class="btn btn-outline-primary btn-lg">
                    <i class="bi bi-plus-circle me-2"></i>Создать новый
                </a>
            </div>
        </div>
    </c:if>
</div>

<!-- Footer -->
<footer class="bg-premium-dark text-white py-4 mt-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="mb-0">&copy; 2024 Premium Plates. Все права защищены.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="mb-0">
                    <i class="bi bi-envelope me-2"></i>info@premiumplates.ru
                    <i class="bi bi-telephone ms-3 me-2"></i>+7 (495) 123-45-67
                </p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
