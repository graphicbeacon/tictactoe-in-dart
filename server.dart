import 'dart:io';
import 'package:http_server/http_server.dart';

void main() {
  final HTTP_ROOT_PATH = Platform.script.resolve('build/web').toFilePath();
  final host = InternetAddress.LOOPBACK_IP_V4;
  final port = 4678;
  VirtualDirectory virDir;
  
  // https://www.dartlang.org/dart-by-example/
  print(HTTP_ROOT_PATH);
  
  void directoryHandler(dir, request) {
    var indexUri = new Uri.file(dir.path).resolve('tictactoe.html');
    virDir.serveFile(new File(indexUri.toFilePath()), request);
  }
  
  virDir = new VirtualDirectory(HTTP_ROOT_PATH)
    ..allowDirectoryListing = true
    ..directoryHandler = directoryHandler;
  
  
  // Set up static server
  HttpServer.bind(host, port).then((HttpServer server) {
    
    print('Server listening at $host:$port');
    server.listen((HttpRequest request) {
        virDir.serveRequest(request);
    });
    
  });
  
}