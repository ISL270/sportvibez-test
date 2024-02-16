import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/services/cache/cache_models/contact_cm.dart';

extension ContactCMtoDomain on ContactCM {
  Contact toDomainModel() {
    return Contact(
      firstName: firstName,
      lastName: lastName,
      nickName: nickName,
      phoneNumber: phoneNumber,
      email: email,
      notes: notes,
      relationship: relationship,
    );
  }
}

extension ContactToCM on Contact {
  ContactCM toCacheModel() {
    return ContactCM(
      firstName: firstName,
      lastName: lastName,
      nickName: nickName,
      phoneNumber: phoneNumber,
      email: email,
      notes: notes,
      relationship: relationship,
    );
  }
}
