import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapService {
  static String getMapApiKey() {
    return dotenv.env['MAP_API_KEY'] ?? '';
  }
  
  static String getMapTileUrl() {
    final service = dotenv.env['MAP_SERVICE'] ?? 'openstreetmap';
    if (service == 'openstreetmap') {
      return 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
    }
    return 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  }
  
  static String getAttribution() {
    return '© OpenStreetMap contributors';
  }
}
