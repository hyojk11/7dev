
# 7dev - 조달·생산·진척검수 ERP 시스템  
> 펜·연필 제조사의 생산·구매·검수 프로세스를 통합 관리하는 ERP 시스템입니다.  
> 사원/거래처/관리자 권한별 기능 분리 및 진척률 자동 평가 기능을 포함하고 있습니다.

---

## 주요 화면

###  1. 로그인 및 권한별 메인
> 사원 / 거래처 / 관리자 구분에 따라 다른 메인 페이지로 이동  
![image](https://github.com/user-attachments/assets/ec8c95ca-0e5c-4c68-a8ef-4f61303e3c58)

###  2. 생산계획 등록
> 제품 선택, 담당자 지정, 자동 코드 생성 포함  
![image](https://github.com/user-attachments/assets/5f7ea752-1f75-4dbe-8204-2442ccfbef89)
![image](https://github.com/user-attachments/assets/fbf4ea74-a75f-4ac8-843f-9669a3ef482c)

###  3. 구매발주 등록 & 상세
> 계약기반 발주 등록 및 총 금액 자동 계산  
![image](https://github.com/user-attachments/assets/4418d191-7bbb-4d7c-9906-4416148df2f0)


###  4. 진척검수 등록 & 평가
> 납기 기준 자동 진척률 계산 및 평가 등급(R0~R3) 자동화  
![image](https://github.com/user-attachments/assets/620742db-2c44-4f51-879c-b4edb5f7e330)


---

## 주요 기능 요약

| 기능 | 설명 |
|------|------|
| **권한별 메인화면** | 로그인 후 사원/거래처/관리자 역할별 전용 메인 제공 |
| **사원 관리** | 목록/상세/등록/수정/삭제 + 페이징/검색/엑셀 다운로드 |
| **생산계획 관리** | 제품 검색, 담당자 지정, 창고코드 연동, 코드 자동생성 |
| **구매발주 관리** | 계약 연동, 자재별 단가 계산, 발주서 출력 |
| **진척검수 관리** | 차수별 등록, CTE 기반 누적 진척률 계산, 평가 자동화 |
| **마이페이지** | 사원/거래처별 개인정보 수정 기능 |
| **코드 자동생성기** | 날짜 기반 시리얼 코드(PP2024052801 등) 생성기 내장 |
| **엑셀 다운로드** | POI 라이브러리로 모든 목록 엑셀 출력 기능 구현 |

---

## 기술 스택

| 구분 | 내용 |
|------|------|
| Backend | Java 8, Spring MVC, MyBatis |
| Frontend | JSP, JSTL, JavaScript |
| DB | MySQL |
| ORM | MyBatis Mapper XML |
| View | JSP + ModelAndView (`/WEB-INF/views`) |
| 기타 | Apache POI, Log4j, Log4jdbc, Git, Eclipse IDE |

---

## 디렉토리 구조 (일부)

```
├── controller
│   ├── EmployeeController.java
│   ├── ProductionPlanningController.java
│   └── ProgressMonitoringController.java
├── service
│   ├── EmployeeService.java
│   └── ProductionPlanningService.java
├── dao
│   ├── EmployeeDAO.java
│   └── ProgressMonitoringDAO.java
├── mapper
│   ├── employeeMapper.xml
│   └── progressMonitoringMapper.xml
├── dto
│   ├── EmployeeDTO.java
│   └── ProductionPlanningDTO.java
└── view
    ├── list.jsp
    ├── detail.jsp
    ├── register.jsp
```

---

## 구현 포인트 & 학습 내용

- MyBatis Mapper XML로 SQL 직접 작성하며, 복잡한 조인/CTE/ROW_NUMBER 활용 능력 강화
- MVC 구조 기반으로 Controller-Service-DAO-Mapper 흐름 명확히 구성
- 로그인 → 권한별 화면 분기 → 기능별 CRUD 전체 흐름 완성
- 진척률 계산 알고리즘 및 자동 평가 로직 구현 (실제 업무 기준 반영)
- 모든 리스트에 페이징/검색/엑셀 기능 공통 적용
- 실무에서 요구되는 조달-생산-검수 흐름을 이해하고 구현
