import 'package:hnotes/requester/api_provider.dart';
import 'package:hnotes/note_services/note_model.dart';
import 'package:hnotes/infrastructure/blockchain/blockchain_repository.dart';

class Repository {
  final apiProvider = NoteApiProvider();

  Future<NoteModel> fetchAllNotes() => apiProvider.getAllNotes();

  BlockchainRepository chainCall() => apiProvider.chainCall;

  Future<String> fetchLoveStartDate() => apiProvider.getLoveStartDate();

}
