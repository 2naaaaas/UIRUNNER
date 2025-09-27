# IUR EatsDelivery

A comprehensive, production-ready Flutter application for peer-to-peer campus meal delivery at International University of Rabat.

## 🚀 Features

### Core Features
- **University Email Verification**: Only @uir.ac.ma domains allowed
- **Multi-Role Support**: Customer, Courier, Admin, and Dual-mode users
- **Real-time Order Tracking**: Live courier location and delivery status
- **Secure Payment Processing**: Stripe integration with local Moroccan gateways
- **Biometric Authentication**: Face ID/Fingerprint support
- **Multi-language Support**: Arabic (RTL), French, and English

### Customer Features
- Restaurant browsing with real-time availability
- Advanced menu filtering (dietary restrictions, price, preparation time)
- Group ordering for dorm rooms
- One-tap reordering from history
- Weather-based meal recommendations
- Real-time order tracking with ETA

### Courier Features
- Smart order matching algorithm
- Multi-order batching for efficient delivery
- Real-time earnings tracking
- Performance analytics and gamification
- Turn-by-turn navigation integration
- Photo verification for pickup/delivery

### Admin Features
- Real-time order monitoring
- Courier performance management
- Restaurant partner management
- Financial reporting and analytics
- Customer support ticket system

## 🏗️ Architecture

### Clean Architecture
```
lib/
├── core/                 # Core utilities and configurations
├── data/                 # Data layer (models, repositories, data sources)
├── domain/               # Domain layer (entities, repositories, use cases)
├── presentation/         # Presentation layer (BLoC, pages, widgets)
└── services/             # External services
```

### State Management
- **BLoC Pattern**: For predictable state management
- **Repository Pattern**: For data abstraction
- **Dependency Injection**: Using GetIt and Injectable

### Key Technologies
- **Flutter 3.13+**: Cross-platform mobile development
- **Firebase**: Backend services (Auth, Firestore, Functions, Storage)
- **Stripe**: Payment processing
- **Google Maps**: Real-time tracking and navigation
- **Hive**: Local storage and caching

## 📱 Target Metrics

- **Concurrent Users**: 2,000+ during peak hours
- **Delivery Time**: Sub-20-minute average
- **Uptime**: 99.5% with <2-second app launch
- **Customer Rating**: 4.7+ stars
- **Order Processing**: 500+ orders/hour during peak

## 🎨 Design System

### Color Palette
- **Primary**: #2E86AB (University Blue)
- **Secondary**: #A23B72 (Moroccan Rose)
- **Accent**: #F18F01 (Warm Orange)
- **Success**: #C73E1D (Deep Red-Orange)

### Typography
- **Headers**: Poppins (Arabic: IBM Plex Arabic)
- **Body**: Inter (Arabic: IBM Plex Sans Arabic)
- **Scale**: 12, 14, 16, 18, 24, 32, 40, 48px

## 🔧 Setup Instructions

### Prerequisites
- Flutter 3.13+
- Dart 3.0+
- Firebase project setup
- Google Maps API key
- Stripe account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/iur-eats-delivery.git
   cd iur-eats-delivery
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project
   - Enable Authentication, Firestore, Storage, Functions
   - Download and add configuration files
   - Update `firebase_options.dart` with your keys

4. **Configure Google Maps**
   - Get Google Maps API key
   - Update `app_config.dart` with your API key

5. **Configure Stripe**
   - Get Stripe publishable key
   - Update `app_config.dart` with your Stripe key

6. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

### Test Coverage
- **Unit Tests**: 90%+ coverage for business logic
- **Widget Tests**: All custom components
- **Integration Tests**: Complete user workflows
- **Performance Tests**: High-load scenarios

### Running Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test/
```

## 🚀 Deployment

### Production Checklist
- [ ] Firebase configuration
- [ ] Google Maps API key
- [ ] Stripe keys
- [ ] App signing certificates
- [ ] Store optimization
- [ ] Performance monitoring
- [ ] Crash reporting

### Build Commands
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📊 Performance Requirements

### Mobile Optimization
- **App Size**: <100MB
- **Memory Usage**: <200MB during peak operation
- **Battery**: Optimized location tracking (30-second intervals)
- **Network**: Graceful degradation from WiFi to 2G
- **Offline**: Core functionality available without internet

### Real-time Features
- WebSocket connections for live tracking
- Efficient location updates with distance filtering
- Push notification optimization
- Real-time database listeners

## 🔒 Security & Compliance

### Data Protection
- End-to-end encryption for sensitive data
- Secure API key management
- User session management with auto-logout
- Input validation and sanitization
- OWASP Mobile Top 10 compliance

### Privacy Compliance
- GDPR compliance with data portability
- Explicit consent collection
- Data retention policies
- User data export functionality

## 📈 Business Intelligence

### Analytics
- Customer behavior analysis
- Demand forecasting with ML
- Restaurant performance metrics
- Courier efficiency optimization
- Revenue analysis with profit margins

### Key Metrics
- Daily active users
- Order completion rate
- Average delivery time
- Customer satisfaction score
- Revenue per order

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:
- Email: support@iureats.com
- Documentation: [docs.iureats.com](https://docs.iureats.com)
- Issues: [GitHub Issues](https://github.com/your-org/iur-eats-delivery/issues)

## 🎯 Roadmap

### Phase 1 (MVP)
- [x] Authentication system
- [x] Basic restaurant browsing
- [x] Order placement
- [x] Courier interface
- [ ] Payment integration

### Phase 2 (Enhanced)
- [ ] Real-time tracking
- [ ] Push notifications
- [ ] Advanced analytics
- [ ] Group ordering

### Phase 3 (Advanced)
- [ ] AI-powered recommendations
- [ ] Predictive analytics
- [ ] Advanced courier optimization
- [ ] Multi-campus support

---

**Built with ❤️ for the International University of Rabat community**
