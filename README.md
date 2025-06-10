# Fight Game Project

격투 게임을 위한 마이크로서비스 아키텍처 기반 프로젝트입니다. 채팅봇 서비스와 REST API 서버로 구성되어 있습니다.

## 아키텍처

이 프로젝트는 두 개의 주요 서비스로 구성됩니다:

- **Chatbot Service**: 게임 캐릭터 채팅봇 (gRPC 서비스)
- **Game Server**: 격투 게임 REST API 서버 (ASP.NET Core)

### 서비스 구조

```
┌─────────────────┐     gRPC     ┌─────────────────┐
│   Game Server   │ ◄─────────► │ Chatbot Service │
│   (ASP.NET)     │   :50051     │   (Python/Node) │
│   Port: 8080    │              │                 │
└─────────────────┘              └─────────────────┘
```

## 시작하기

### 사전 요구사항

- Docker 및 Docker Compose 설치
- .env 파일 설정 (아래 참조)

### 환경 변수 설정

`services/FightGameCharBot/.env` 파일을 생성하고 다음 변수들을 설정하세요:

```env
# 예시 - 실제 값으로 교체 필요
API_KEY=your_api_key_here
DATABASE_URL=your_database_url
LOG_LEVEL=info
```

### 실행 방법

1. **프로젝트 클론 및 이동**
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **환경 변수 파일 설정**
   ```bash
   # 채팅봇 서비스 환경 변수 설정
   cp services/FightGameCharBot/.env.example services/FightGameCharBot/.env
   # .env 파일을 편집하여 실제 값으로 수정
   ```

3. **서비스 빌드 및 시작**
   ```bash
   docker-compose up --build
   ```

4. **백그라운드에서 실행**
   ```bash
   docker-compose up -d --build
   ```

### 서비스 확인

- **Game Server**: http://localhost:8080
- **Chatbot Service**: gRPC 포트 50051 (내부 통신용)

## 서비스 세부 정보

### Game Server (REST API)

- **기술 스택**: ASP.NET Core
- **포트**: 8080
- **환경**: Production
- **시간대**: Asia/Seoul
- **로그**: `./logs` 디렉토리에 저장

#### 주요 특징
- RESTful API 제공
- gRPC를 통한 채팅봇 서비스 연동
- 프로덕션 환경 최적화
- 자동 재시작 (unless-stopped)

### Chatbot Service

- **포트**: 50051 (gRPC)
- **연동**: Game Server와 gRPC 통신
- **환경 설정**: `.env` 파일 기반

## 개발 가이드

### 로그 확인

```bash
# 모든 서비스 로그 확인
docker-compose logs

# 특정 서비스 로그 확인
docker-compose logs game-server
docker-compose logs chatbot-service

# 실시간 로그 스트리밍
docker-compose logs -f
```

### 서비스 관리

```bash
# 서비스 중지
docker-compose down

# 특정 서비스만 재시작
docker-compose restart game-server

# 서비스 상태 확인
docker-compose ps
```

### 개발 모드

개발 중에는 다음과 같이 실행할 수 있습니다:

```bash
# 개발 모드로 특정 서비스만 실행
docker-compose up game-server

# 빌드 없이 실행 (이미지가 존재하는 경우)
docker-compose up --no-build
```

## API 문서

Game Server의 API 문서는 서비스 실행 후 다음 경로에서 확인할 수 있습니다:
- Swagger UI: http://localhost:8080/swagger (설정된 경우)

## 네트워크 구성

- **네트워크 이름**: server-network
- **드라이버**: bridge
- **내부 통신**: 서비스 간 컨테이너 이름으로 통신 가능

## 트러블슈팅

### 일반적인 문제 해결

1. **포트 충돌**
   ```bash
   # 8080 포트 사용 중인 프로세스 확인
   lsof -i :8080
   ```

2. **환경 변수 오류**
    - `.env` 파일 존재 여부 확인
    - 환경 변수 값 검증

3. **컨테이너 빌드 실패**
   ```bash
   # 이미지 재빌드
   docker-compose build --no-cache
   ```

4. **로그 확인**
   ```bash
   # 상세 로그 확인
   docker-compose logs --details
   ```
