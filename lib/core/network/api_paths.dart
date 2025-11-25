class ApiRouteConfig {
  // Backend чинь: http://localhost:3000/api
  // Эмулятор дээрээс бол: 10.0.2.2 (Android) / localhost (Web)
  static const String baseUrl = 'http://127.0.0.1:3000/api';

  static const String storages = '/storages'; // POST
  static const String storagesList = '/storages/list'; // GET
  static const String updateStorage = '/storages/update'; // PUT
}
