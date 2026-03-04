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
