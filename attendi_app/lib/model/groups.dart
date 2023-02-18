class Groups {
  final int? gSeq;
  final String gName;
  final String gCategory;
  final String? gNote;
  final String cDate;
  String? dDate = '';
  
  //foreign key
  final int? uSeq;
  
  

  Groups(
      {this.gSeq,
      required this.gName,
      required this.gCategory,
      this.gNote,
      required this.cDate,
      this.uSeq});

  Groups.fromMap(Map<String, dynamic> res)
      : gSeq = res['gSeq'],
        gName = res['gName'],
        gCategory = res['gCategory'],
        gNote = res['gNote'],
        cDate = res['cDate'],
        dDate = res['dDate'],
        uSeq = res['uSeq'];

  Map<String, Object?> toMap() {
    return {'gSeq': gSeq, 'gName': gName, 'gCategory': gCategory, 'gNote':gNote, 'cDate': cDate, 'dDate': dDate, 'uSeq': uSeq};
  }
}
