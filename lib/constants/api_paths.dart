class ApiRouteConfig {
  // DEV:
  // static const String baseUrl = 'http://localhost:3000/api';
  static const String baseUrl = 'https://sensor.gertu.mn:5000/api';

  // PROD:
  // static const String baseUrl = 'https://api.gertu.mn:3000/api';

  static const String storages = '/storages'; // POST
  static const String storagesList = '/storages/list'; // GET
  static const String updateStorage = '/storages/update'; // PUT
}
