class Check {
  final int? cSeq;
  
  final String checkDate;
  final int attend;
  
  final String? cNote;
  //user foreign key
  final int? uSeq;
  //member foreign key
  final int? mSeq;
  //group foreign key
  final int? gSeq;

  Check({this.cSeq,
      required this.checkDate,
      required this.attend,
      this.cNote,
      this.uSeq,
      this.mSeq,
      this.gSeq
      });

  Check.fromMap(Map<String, dynamic> res)
      : cSeq = res['cSeq'],
        checkDate = res['checkDate'],
        attend = res['attend'],
        cNote = res['cNote'],
        uSeq = res['uSeq'],
        mSeq = res['mSeq'],
        gSeq = res['gSeq'];

  Map<String, Object?> toMap() {
    return {'cSeq': cSeq, 'checkDate': checkDate, 'attend': attend, 'cNote': cNote, 'uSeq': uSeq, 'mSeq': mSeq, 'gSeq': gSeq};
  }
}
