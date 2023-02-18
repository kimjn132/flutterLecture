class Members {
  final int? mSeq;
  final String mName;
  final String mTel;
  final String mNote;
  final String eDate;
  String? oDate = '';
  
  //user foreign key
  final int? uSeq;
  //group foreign key
  final int? gSeq;

  Members(
      {this.mSeq,
      required this.mName,
      required this.mTel,
      required this.mNote,
      required this.eDate,
      this.uSeq,
      this.gSeq});

  Members.fromMap(Map<String, dynamic> res)
      : mSeq = res['mSeq'],
        mName = res['mName'],
        mTel = res['mTel'],
        mNote = res['mNote'],
        eDate = res['eDate'],
        oDate = res['oDate'],
        uSeq = res['uSeq'],
        gSeq = res['gSeq'];

  Map<String, Object?> toMap() {
    return {'mSeq': mSeq, 'mName': mName, 'mTel': mTel, 'mNote': mNote, 'eDate': eDate, 'oDate': oDate, 'uSeq': uSeq, 'gSeq': gSeq};
  }
}
