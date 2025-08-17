# 마스크 재고 확인 앱 (Mask Flutter)

마스크 재고 상태를 실시간으로 확인할 수 있는 Flutter 애플리케이션입니다.

## 📱 주요 기능

- **실시간 마스크 재고 확인**: 주변 약국의 마스크 재고 상태를 실시간으로 조회
- **위치 기반 검색**: 사용자의 현재 위치를 기반으로 주변 5km 이내 약국 검색
- **거리순 정렬**: 가까운 약국부터 순서대로 표시
- **재고 상태 시각화**: 색상 코드를 통한 직관적인 재고 상태 표시
  - 🟢 충분 (100개 이상)
  - 🟡 보통 (30~100개)
  - 🔴 부족 (2~30개) 
  - ⚫ 소진임박 (1개 이하)

## 🛠 기술 스택

### Framework & Language
- **Flutter** 2.18.2+
- **Dart**

### 주요 패키지
- `provider: ^6.0.5` - 상태 관리
- `http: ^0.13.5` - API 통신
- `geolocator: ^9.0.2` - 위치 정보 획득
- `latlong2: ^0.8.1` - 거리 계산

## 📂 프로젝트 구조

```
lib/
├── main.dart                    # 앱 진입점
├── model/
│   └── Store.dart              # 약국 데이터 모델
├── repository/
│   ├── location_repository.dart # 위치 정보 처리
│   └── store_repository.dart    # API 통신 및 데이터 처리
├── ui/
│   ├── screen/
│   │   └── main_page.dart      # 메인 화면
│   └── widget/
│       └── remain_stat_list_tile.dart # 약국 리스트 아이템 위젯
└── view_model/
    └── store_model.dart        # 비즈니스 로직 및 상태 관리
```

## 🏗 아키텍처

이 앱은 **MVVM (Model-View-ViewModel)** 패턴을 사용하여 구현되었습니다:

- **Model**: 약국 정보를 담는 Store 클래스
- **View**: UI 화면 및 위젯들 (main_page.dart, remain_stat_list_tile.dart)
- **ViewModel**: StoreModel 클래스로 비즈니스 로직과 상태 관리
- **Repository**: 데이터 소스 접근 계층 (API 통신, 위치 정보)

### 상태 관리
Provider 패키지를 사용하여 앱 전체의 상태를 효율적으로 관리합니다.

## 🚀 시작하기

### 필수 요구사항
- Flutter SDK 2.18.2 이상
- Dart SDK 2.18.2 이상

### 설치 및 실행

1. 저장소 클론
```bash
git clone https://github.com/yourusername/mask_flutter.git
cd mask_flutter
```

2. 의존성 패키지 설치
```bash
flutter pub get
```

3. 앱 실행
```bash
flutter run
```

## 📍 위치 권한

이 앱은 사용자의 현재 위치를 기반으로 주변 약국을 검색하기 위해 위치 권한이 필요합니다.

### Android
`android/app/src/main/AndroidManifest.xml`에 다음 권한이 필요합니다:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### iOS
`ios/Runner/Info.plist`에 다음 설정이 필요합니다:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>주변 약국의 마스크 재고를 확인하기 위해 위치 정보가 필요합니다.</string>
```

## 🔄 데이터 소스

현재는 샘플 JSON 데이터를 사용하고 있습니다. 실제 서비스 배포시에는 실시간 API로 교체가 필요합니다.

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 있습니다.

## 🤝 기여하기

버그 리포트, 기능 제안, Pull Request 모두 환영합니다!

## 📞 문의

프로젝트에 대한 문의사항이 있으시면 이슈를 등록해 주세요.