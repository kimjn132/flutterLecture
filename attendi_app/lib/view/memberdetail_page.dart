import 'package:flutter/material.dart';

class MemberDetailPage extends StatefulWidget {
  final int mSeq;
    final String mName;
    final String mTel;
    final String? mNote;
    final String eDate;
    final int gSeq;
    final int uSeq;
  const MemberDetailPage({super.key,
  required this.mSeq, 
  required this.mName, 
  required this.mTel, 
  this.mNote, 
  required this.eDate,
  required this.gSeq,
  required this.uSeq
  });

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}