import 'package:linalg/linalg.dart' as linalg;
import 'package:ml_linalg/matrix.dart';

class Calculations {
  //BZB B^T (_Il)   =  BEB   − BZb IB
  Map<String, List> branches = {};
  List<double> JB = [];
  List<double> VB = [];
  List<double> ZB = [];
  List<double> YB = [];
  List<double> EB = [];
  List<double> IB = [];
  List<List<double>> AT = [];
  List<List<double>> AL = [];
  List<List<double>> B = [];
  List<List<double>> C = [];

  bool isTieSet = true;

  Calculations({
    required bool isTieSet,
    required this.AT,
    required this.AL,
    List<double>? Zb,
    List<double>? Yb,
    required List<double> Eb,
    required List<double> Ib,
  }) {
    this.isTieSet = isTieSet;
    this.IB = Ib;
    this.EB = Eb;

    setMat();

    if (isTieSet) {
      this.ZB = Zb!;
      setBranchVoltage();
    } else {
      this.YB = Yb!;
      setBranchCurrent();
    }
  }

  void setMat() {
    var ATree = linalg.Matrix(AT);
    var ALink = linalg.Matrix(AL);

    print("ATree : $ATree");
    var CL = ATree.inverse() * ALink; //cut set links
    var CT = Matrix.identity(AT[0].length).toList().cast<List<double>>();

    //cut set tree
    CT.addAll(CL.transpose().toList()); //cut set transposed

    C = linalg.Matrix(CT).transpose().toList(); //cut set
    List<List<double>> BT = (CL * -1).toList(); //tie set tree transpose

    var BLink = Matrix.identity(AL[0].length)
        .toList()
        .cast<List<double>>(); //tie set link
    BT.addAll(BLink); //tie set transpose
    B = linalg.Matrix(BT).transpose().toList();

    print("B: $B");
    print("C: $C");

  }

  List getTieSetMat() {
    return B;
  }

  List getCutSetMat() {
    return C;
  }

  void setBranchVoltage() {
    var BMat = linalg.Matrix(B);
    var ZbMat = linalg.Matrix(Matrix.diagonal(ZB).toList().cast());
    var EbMat = linalg.Matrix(Matrix.column(EB).toList().cast());
    var IbMat = linalg.Matrix(Matrix.column(IB).toList().cast());
    var BZbBT = BMat * ZbMat * BMat.transpose();
    print("BZbBT: $BZbBT");
    var BEb = BMat * EbMat;
    print("BEb: $BEb");
    var BZbIb = BMat * ZbMat * IbMat;
    print("BZbIb : $BZbIb");
    var Il = BZbBT.inverse() * (BEb - BZbIb);
    print("Il: ${Il}");
    var JbMat = BMat.transpose() * Il;
    JB = JbMat.toVector().toList();
    print("Jb: $JB");
    var VbMat = ZbMat * (JbMat + IbMat) - EbMat;
    VB = VbMat.toVector().toList();
    print("vb: $VB");
  }

  void setBranchCurrent() {
    var CMat = linalg.Matrix(C);
    var YbMat = linalg.Matrix(Matrix.diagonal(YB).toList().cast());
    var EbMat = linalg.Matrix(Matrix.column(EB).toList().cast());
    var IbMat = linalg.Matrix(Matrix.column(IB).toList().cast());
    var CYbCT = CMat * YbMat * CMat.transpose();
    print('CMat $CMat');
    print("CYbCT: $CYbCT");
    var CIb = CMat * IbMat;
    print("CIb: $CIb");
    var CYbEb = CMat * YbMat * EbMat;
    print("CYbEb: $CYbEb");
    var En = CYbCT.inverse() * (CIb - CYbEb);
    print("En: ${En}");
    var VbMat = CMat.transpose() * En;
    VB = VbMat.toVector().toList();
    print("vb: $VB");
    var JbMat = YbMat * (VbMat + EbMat) - IbMat;
    JB = JbMat.toVector().toList();
    print("Jb: $JB");
  }

  List getBrachesCurrent() => JB;

  List getBrachesVolt() => VB;
}
