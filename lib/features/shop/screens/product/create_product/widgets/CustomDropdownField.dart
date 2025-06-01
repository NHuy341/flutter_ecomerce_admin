import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreDropdownField extends StatelessWidget {
  final String label;
  final String collectionPath;
  final String? value;
  final void Function(String?) onChanged;

  const FirestoreDropdownField({
    super.key,
    required this.label,
    required this.collectionPath,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final docs = snapshot.data!.docs;

        final items = docs.map((doc) {
          return DropdownMenuItem<String>(
            value: doc.id,
            child: Text(doc['name'] ?? doc.id),
          );
        }).toList();

        return DropdownButtonFormField<String>(
          isExpanded: true,
          value: value,
          onChanged: onChanged,
          validator: (val) =>
              val == null || val.isEmpty ? 'Please select $label' : null,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
          ),
          items: items,
        );
      },
    );
  }
}
