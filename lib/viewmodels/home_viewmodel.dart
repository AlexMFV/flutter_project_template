import 'package:talk2me/core/messages/message_key.dart';
import 'package:talk2me/viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  bool loading = false;

  HomeViewModel(super.navigation, super.logger);

  Future<void> processError() async {
    try {
      logger.info('Loading home data');

      // fake failure
      throw Exception('No internet');
    } catch (e, st) {
      logger.error('Failed to load home data', error: e, stackTrace: st);

      fail(MessageKey.sampleError);
    }
  }

  void processInfo() async {
    info(MessageKey.sampleInfo);
  }

  void processSuccess() async {
    success(MessageKey.sampleSuccess);
  }

  void processWarning() async {
    warn(MessageKey.sampleWarning);
  }
}
