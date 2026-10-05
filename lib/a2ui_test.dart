import 'package:a2ui_core/a2ui_core.dart';

final userListMessages = [
  A2uiMessage.fromJson({
    'version': 'v0.9',
    'createSurface': {
      'surfaceId': 'main',
      'catalogId':
      'https://a2ui.org/specification/v0_9/catalogs/basic/catalog.json',
      'sendDataModel': false,
    },
  }),

  A2uiMessage.fromJson({
    'version': 'v0.9',
    'updateComponents': {
      'surfaceId': 'main',
      'components': [
        {
          'id': 'root',
          'component': 'Column',
          'children': [
            'header',
            'search',
            'userList',
          ],
        },

        // Header
        {
          'id': 'header',
          'component': 'Row',
          'children': [
            'headerTitle',
            'memberCount',
          ],
        },
        {
          'id': 'headerTitle',
          'component': 'Text',
          'text': 'Team Members',
          'variant': 'h3',
        },
        {
          'id': 'memberCount',
          'component': 'Text',
          'text': '12 members',
        },

        // Search
        {
          'id': 'search',
          'component': 'TextField',
          'label': 'Search team members...',
        },

        // User list
        {
          'id': 'userList',
          'component': 'List',
          'children': [
            'user1',
            'user2',
            'user3',
            'user4',
            'user5',
          ],
        },

        // User 1
        {
          'id': 'user1',
          'component': 'UserItem',
          'name': 'Sajib Hasan',
          'role': 'Flutter Developer',
          'email': 'sajib@example.com',
          'isOnline': true,
        },

        // User 2
        {
          'id': 'user2',
          'component': 'UserItem',
          'name': 'Alex Morgan',
          'role': 'Senior Backend Engineer',
          'email': 'alex@example.com',
          'isOnline': true,
        },

        // User 3
        {
          'id': 'user3',
          'component': 'UserItem',
          'name': 'Emma Wilson',
          'role': 'UI/UX Designer',
          'email': 'emma@example.com',
          'isOnline': false,
        },

        // User 4
        {
          'id': 'user4',
          'component': 'UserItem',
          'name': 'John Smith',
          'role': 'Product Manager',
          'email': 'john@example.com',
          'isOnline': true,
        },

        // User 5
        {
          'id': 'user5',
          'component': 'UserItem',
          'name': 'David Miller',
          'role': 'Flutter Developer',
          'email': 'david@example.com',
          'isOnline': false,
        },
      ],
    },
  }),
];