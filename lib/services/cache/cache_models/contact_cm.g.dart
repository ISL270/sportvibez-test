// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactCMAdapter extends TypeAdapter<ContactCM> {
  @override
  final int typeId = 0;

  @override
  ContactCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactCM(
      email: fields[5] as String?,
      notes: fields[6] as String?,
      nickName: fields[3] as String?,
      relationship: fields[4] as String?,
      lastName: fields[1] as String,
      firstName: fields[0] as String,
      phoneNumber: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactCM obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.nickName)
      ..writeByte(4)
      ..write(obj.relationship)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
