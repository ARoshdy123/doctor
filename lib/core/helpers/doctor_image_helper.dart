/// Returns a local asset image path for a doctor based on their [id].
/// Cycles through available doctor images so each card gets a consistent photo.
String getDoctorImage(int? id) {
  const doctorImages = [
    'assets/images/doc.png',
    'assets/images/doc1.png',
    'assets/images/doc2.png',
    'assets/images/doc3.png',
  ];
  final index = (id ?? 0) % doctorImages.length;
  return doctorImages[index];
}

String getSpecialtyImage(int? id) {
  const specialtyImages = [
    'assets/images/icon1.png',
    'assets/images/icon2.png',
    'assets/images/icon3.png',
    'assets/images/icon4.png',
    'assets/images/icon5.png',
    'assets/images/icon6.png',
    'assets/images/icon7.png',
    'assets/images/icon8.png',
    'assets/images/icon9.png',
    'assets/images/icon10.png',
    'assets/images/icon11.png',
  ];
  final index = (id ?? 0) % specialtyImages.length;
  return specialtyImages[index];
}
