import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/Domain/Repository/gyro_pool_repository_interface.dart';
import 'package:dart_api/telegram_bot.dart';

class PostDataToTelegram {
  final TelegramBot bot;
  final GyroPoolRepositoryInterface repository;

  PostDataToTelegram({required this.bot, required this.repository});

  void run() {
    var ethereum = repository.getLastTvlCaptured(ChainName.ethereum);
    var arbitrum = repository.getLastTvlCaptured(ChainName.arbitrum);
    var optimism = repository.getLastTvlCaptured(ChainName.optimism);
    var polygon = repository.getLastTvlCaptured(ChainName.polygon);
    var polygonZKEVM = repository.getLastTvlCaptured(ChainName.polygonZKEVM);
    var base = repository.getLastTvlCaptured(ChainName.base);
    var gnosis = repository.getLastTvlCaptured(ChainName.gnosis);
    var avalanche = repository.getLastTvlCaptured(ChainName.avalanche);

    var total = ethereum +
        arbitrum +
        optimism +
        polygon +
        polygonZKEVM +
        base +
        gnosis +
        avalanche;

    var msg = 'total tvl : $total';
    msg += '\n ethereum : $ethereum';
    msg += '\n arbitrum : $arbitrum';
    msg += '\n optimism : $optimism';
    msg += '\n polygon : $polygon';
    msg += '\n polygonZKEVM : $polygonZKEVM';
    msg += '\n base : $base';
    msg += '\n gnosis : $gnosis';
    msg += '\n avalanche : $avalanche';
    bot.sendMessage(msg);
  }
}
