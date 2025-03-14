import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context
        .read<NotificationsBloc>()
        .getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalles Push')),
      body:
          (message != null)
              ? _DetailsView(pushMessage: message)
              : const Center(child: Text('La notificación no existe')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage pushMessage;

  const _DetailsView({required this.pushMessage});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if (pushMessage.imageUrl != null)
            Image.network(pushMessage.imageUrl!),
          const SizedBox(height: 30),
          Text(pushMessage.title, style: textStyles.titleMedium),
          Text(pushMessage.body),
          const Divider(),
          Text(pushMessage.data.toString()),
        ],
      ),
    );
  }
}
