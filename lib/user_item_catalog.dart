import 'package:flutter/material.dart';
import 'package:generative_ui/user_item.dart';
import 'package:genui/genui.dart';
import 'package:json_schema_builder/json_schema_builder.dart';


final userItemSchema = S.object(
  properties: {
    'component': S.string(
      enumValues: ['UserItem'],
    ),
    'name': S.string(),
    'role': S.string(),
    'email': S.string(),
    'avatarUrl': S.string(),
    'isOnline': S.boolean(),
  },
  required: [
    'name',
    'role',
    'email',
  ],
);

final userItem = CatalogItem(
  name: 'UserItem',
  dataSchema: userItemSchema,
  widgetBuilder: (itemContext) {
    final data = itemContext.data as Map<String, Object?>;

    return InkWell(
      onTap: () {
        showDialog(
            context: itemContext.buildContext,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('User Details'),
                content: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text('Name: ${data['name']}'),
                    Text('Role: ${data['role']}'),
                    Text('Email: ${data['email']}'),
                  ]
                )
              );
            });
      },
      child: UserItem(
        name: data['name'] as String,
        role: data['role'] as String,
        email: data['email'] as String,
        avatarUrl: data['avatarUrl'] as String?,
        isOnline: data['isOnline'] as bool? ?? true,
      ),
    );
  },
);